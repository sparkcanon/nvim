local nvim_lsp = require "lspconfig"
local custom_attach = require "lsp/on_attach".custom_attach

nvim_lsp.bashls.setup {
  on_attach = function(client)
    custom_attach(client)
  end
}
