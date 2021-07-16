local nvim_lsp = require "lspconfig"
local custom_attach = require "lsp/on_attach".custom_attach

nvim_lsp.stylelint_lsp.setup {
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      autoFixOnFormat = true
    }
  },
  on_attach = function(client)
    custom_attach(client)
  end
}
