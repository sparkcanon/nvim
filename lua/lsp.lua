-- LSP

local K = require "utils/general"
local eslint = require "linters/eslint"
local prettier = require "formatters/prettier"
local nvim_lsp = require "lspconfig"

-- Load plugins
vim.cmd("packadd! nvim-lspconfig")

-- Desc: only applies to buffers with lsp on.
local custom_attach = function(_, bufnr)
  -- Set omnifunc
  vim.api.nvim_buf_set_option(bufnr or 0, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings
  K.Key_mapper("n", ",j", "<cmd>lua vim.lsp.buf.definition()<CR>", true)
  K.Key_mapper("n", ",vj", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", true)
  K.Key_mapper("n", ",sj", "<cmd>split | lua vim.lsp.buf.definition()<CR>", true)
  K.Key_mapper("n", ",tj", "<cmd>tab lua vim.lsp.buf.definition()<CR>", true)

  K.Key_mapper("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", true)
  K.Key_mapper("n", ",i", "<cmd>lua vim.lsp.buf.implementation()<CR>", true)
  K.Key_mapper("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", true)
  K.Key_mapper("n", ",yt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", true)
  K.Key_mapper("n", ",r", "<cmd>lua vim.lsp.buf.references()<CR>", true)
  K.Key_mapper("n", ",w", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", true)
  K.Key_mapper("n", ",W", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", true)
  K.Key_mapper("n", ",d", "<cmd>lua vim.lsp.buf.declaration()<CR>", true)

  K.Key_mapper("n", ",f", "<cmd>lua vim.lsp.buf.formatting()<CR>", true)
  K.Key_mapper("n", ",a", "<cmd>lua vim.lsp.buf.code_action()<CR>", true)
  K.Key_mapper("n", ",R", "<cmd>lua vim.lsp.buf.rename()<CR>", true)

  K.Key_mapper("n", ",e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", true)
  K.Key_mapper("n", ",s", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", true)
end

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

nvim_lsp.sumneko_lua.setup {
  on_attach = custom_attach,
  settings = {
    Lua = {
      runtime = {version = "LuaJIT", path = vim.split(package.path, ";")},
      completion = {keywordSnippet = "Disable"},
      diagnostics = {
        enable = true,
        globals = {
          "vim",
          "describe",
          "it",
          "before_each",
          "after_each"
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

nvim_lsp.diagnosticls.setup {
  on_attach = custom_attach,
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "html",
    "css",
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

local servers = {"cssls", "bashls", "html", "tsserver", "jsonls", "vimls", "dartls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = custom_attach
  }
end
