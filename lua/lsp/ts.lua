local nvim_lsp = require "lspconfig"
local custom_attach = require "lsp/on_attach".custom_attach

nvim_lsp.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    custom_attach(client)
  end
}
