local vimLsp = vim.lsp

-- Set up servers
local function setup()
	vimLsp.stop_client(vimLsp.get_active_clients())

	local nvim_lsp = require'nvim_lsp'
	local servers = {'tsserver', 'vimls', 'cssls', 'jsonls', 'yamlls', 'sumneko_lua', 'dartls'}
	for _, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup {}
	end
end

-- Set up diagnostic errors in QF list
local function qfDiagnostics()
	local method = 'textDocument/publishDiagnostics'
	local default_callback = vimLsp.callbacks[method]
	vimLsp.callbacks[method] = function(err, method, result, client_id)
		default_callback(err, method, result, client_id)
		if result and result.diagnostics then
			for _, v in ipairs(result.diagnostics) do
				v.uri = v.uri or result.uri
			end
			vimLsp.util.set_loclist(result.diagnostics)
		end
	end
end

---@export
return {
	setup = setup;
	qfDiagnostics = qfDiagnostics;
}
