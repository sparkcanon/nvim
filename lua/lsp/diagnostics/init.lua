local nvim_lsp = require "lspconfig"
local custom_attach = require "lsp/on_attach".custom_attach
local eslint = require "lsp/diagnostics/eslint"
local prettier = require "lsp/diagnostics/prettier"

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
