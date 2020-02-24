local vimLsp = vim.lsp
local util = require 'vim.lsp.util'

local function diagnostic_loc_list(result)
	for _, v in ipairs(result.diagnostics) do
		v.uri = v.uri or result.uri
	end
	vimLsp.util.set_loclist(result.diagnostics)
end

function Diagnostic_callbacks(bufnr)
	local method = 'textDocument/publishDiagnostics'
	local default_callback = vimLsp.callbacks[method]
	vimLsp.callbacks[method] = function(err, method, result, client_id)
		default_callback(err, method, result, client_id)
		if not result then return end
		util.buf_diagnostics_underline(bufnr, result.diagnostics)

		-- diagnostic_signs(result, bufnr)
		diagnostic_loc_list(result)
	end
end
