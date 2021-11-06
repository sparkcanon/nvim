local custom_attach = require("lsp/on_attach").custom_attach

return {
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		custom_attach(client)
	end,
}
