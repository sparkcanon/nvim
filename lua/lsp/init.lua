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

-- Snippet Support
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     "documentation",
--     "detail",
--     "additionalTextEdits"
--   }
-- }

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
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    custom_attach(client)
  end,
  capabilities = capabilities
}

-- Stylelint
nvim_lsp.stylelint_lsp.setup {
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      autoFixOnFormat = true
    }
  },
  on_attach = function(client)
    custom_attach(client)
  end,
  capabilities = capabilities
}

-- Lua
local sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/sumneko_lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

nvim_lsp.sumneko_lua.setup {
  on_attach = custom_attach,
  capabilities = capabilities,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
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
