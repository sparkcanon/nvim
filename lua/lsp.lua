-- Language Server Configuration

local map = require "utils/general".map
local eslint = require "utils/linters/eslint"
local prettier = require "utils/formatters/prettier"
local nvim_lsp = require "lspconfig"

-- Load plugins
vim.cmd("packadd! nvim-lspconfig")

-- Desc: only applies to buffers with lsp on.
local custom_attach = function(_, bufnr)
  -- Set omnifunc
  vim.api.nvim_buf_set_option(bufnr or 0, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Mappings
  map("n", ",j", "<cmd>lua vim.lsp.buf.definition()<CR>")
  map("n", ",vj", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>")
  map("n", ",sj", "<cmd>split | lua vim.lsp.buf.definition()<CR>")
  map("n", ",tj", "<cmd>tab lua vim.lsp.buf.definition()<CR>")
  map("n", ",p", "<cmd>lua Peek_definition()<CR>")

  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  map("n", ",i", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  map("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  map("n", ",yt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  map("n", ",r", "<cmd>lua vim.lsp.buf.references()<CR>")
  map("n", ",w", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  map("n", ",W", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  map("n", ",d", "<cmd>lua vim.lsp.buf.declaration()<CR>")

  map("n", ",f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  map("n", ",a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  map("n", ",R", "<cmd>lua vim.lsp.buf.rename()<CR>")

  map("n", ",e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  map("n", ",S", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
end

-- Handle diagnostic configuration
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    -- Enable underline
    underline = true,
    -- Enable virtual text
    virtual_text = true,
    -- Disable on insert
    update_in_insert = false,
    signs = {
      priority = 20
    }
  }
)

-- Lua server configuration
local sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/sumneko_lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"
nvim_lsp.sumneko_lua.setup {
  on_attach = custom_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {version = "LuaJIT", path = vim.split(package.path, ";")},
      diagnostics = {
        enable = true,
        globals = {
          "vim"
        }
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        }
      }
    }
  }
}

-- Diagnostic server configuration
nvim_lsp.diagnosticls.setup {
  on_attach = custom_attach,
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "html",
    "css",
    "scss",
    "less",
    "lua"
  },
  init_options = {
    filetypes = {
      javascript = "eslint",
      typescript = "eslint",
      javascriptreact = "eslint",
      typescriptreact = "eslint"
    },
    formatFiletypes = {
      javascript = "prettier",
      typescript = "prettier",
      javascriptreact = "prettier",
      typescriptreact = "prettier",
      css = "prettier",
      scss = "prettier",
      html = "prettier",
      less = "prettier",
      lua = "luafmt"
    },
    linters = {
      eslint = eslint
    },
    formatters = {
      prettier = prettier,
      luafmt = {
        command = "luafmt",
        args = {"--indent-count", 2, "--stdin"}
      }
    }
  }
}

-- Snippet Support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

-- Server Configuration
local servers = {"cssls", "bashls", "html", "tsserver", "jsonls", "vimls", "dartls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = custom_attach,
    capabilities = capabilities
  }
end

-- Peek definition
local function preview_location_callback(_, method, result)
  if result == nil or vim.tbl_isempty(result) then
    vim.lsp.log.info(method, "No location found")
    return nil
  end
  if vim.tbl_islist(result) then
    vim.lsp.util.preview_location(result[1])
  else
    vim.lsp.util.preview_location(result)
  end
end

function Peek_definition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
end
