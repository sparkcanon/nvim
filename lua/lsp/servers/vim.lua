local custom_attach = require("lsp/on_attach").custom_attach

return {
	on_attach = function(client)
		custom_attach(client)
	end,
}
