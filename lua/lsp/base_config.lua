local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local baseConfig = function()
	return {
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	}
end

return baseConfig
