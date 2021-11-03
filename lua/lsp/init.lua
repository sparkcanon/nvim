local nvim_lsp = require "lspconfig"
local custom_attach = require "lsp/on_attach".custom_attach

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
    signs = true
  }
)

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

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Vue
nvim_lsp.vuels.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    custom_attach(client)
  end,
  capabilities = capabilities
}

-- eslint
nvim_lsp.eslint.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    custom_attach(client)
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
  end,
  capabilities = capabilities
}

-- Bash
nvim_lsp.bashls.setup {
  on_attach = function(client)
    custom_attach(client)
  end,
  capabilities = capabilities
}

-- HTML
nvim_lsp.html.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    custom_attach(client)
  end,
  capabilities = capabilities
}

-- Vim
nvim_lsp.vimls.setup {
  on_attach = function(client)
    custom_attach(client)
  end,
  capabilities = capabilities
}

-- CSS
nvim_lsp.cssls.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    custom_attach(client)
  end,
  capabilities = capabilities
}

-- Typescript
nvim_lsp.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    custom_attach(client)
  end,
  capabilities = capabilities
}

-- Json
nvim_lsp.jsonls.setup {
  cmd = {"vscode-json-language-server", "--stdio"},
  on_attach = custom_attach,
  capabilities = capabilities,
  filetypes = {"json", "jsonc"},
  settings = {
    json = {
      -- Schemas https://www.schemastore.org
      schemas = {
        {
          fileMatch = {"package.json"},
          url = "https://json.schemastore.org/package.json"
        },
        {
          fileMatch = {"tsconfig*.json"},
          url = "https://json.schemastore.org/tsconfig.json"
        },
        {
          fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json"
          },
          url = "https://json.schemastore.org/prettierrc.json"
        },
        {
          fileMatch = {".eslintrc", ".eslintrc.json"},
          url = "https://json.schemastore.org/eslintrc.json"
        },
        {
          fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
          url = "https://json.schemastore.org/babelrc.json"
        },
        {
          fileMatch = {"lerna.json"},
          url = "https://json.schemastore.org/lerna.json"
        },
        {
          fileMatch = {"now.json", "vercel.json"},
          url = "https://json.schemastore.org/now.json"
        },
        {
          fileMatch = {
            ".stylelintrc",
            ".stylelintrc.json",
            "stylelint.config.json"
          },
          url = "http://json.schemastore.org/stylelintrc.json"
        }
      }
    }
  }
}

-- Lua
local sumneko_root_path = vim.fn.eval("$HOME") .. "/.config/lua-language-server"

nvim_lsp.sumneko_lua.setup {
  on_attach = custom_attach,
  capabilities = capabilities,
  cmd = {sumneko_root_path .. "/bin/macOS/lua-language-server", "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {version = "LuaJIT", path = vim.split(package.path, ";")},
      diagnostics = {
        enable = true,
        globals = {
          "vim",
          "use"
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

require "lsp/diagnostics/init"
