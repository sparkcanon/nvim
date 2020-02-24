require 'diagnostics'
require 'keys'
local vimLsp = vim.lsp
local vimApi = vim.api

local on_attach = function(_, bufnr)
	Key_mappings(bufnr)
	Diagnostic_callbacks(bufnr)
end

-- Set up servers
local function setup()
	vimLsp.stop_client(vimLsp.get_active_clients())

	local nvim_lsp = require'nvim_lsp'
	local servers = {'tsserver', 'vimls', 'cssls', 'jsonls', 'yamlls', 'sumneko_lua', 'dartls'}
	for _, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup {
			on_attach = on_attach;
		}
	end
end

---@export
return {
	setup = setup;
}
