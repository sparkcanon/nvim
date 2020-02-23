local vimLsp = vim.lsp
local vimApi = vim.api
local buf_set_keymap = vim.api.nvim_buf_set_keymap

-- Set up diagnostic errors in QF list
local on_attach = function(_, bufnr)
	vimApi.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	Diagnostics_loc_list()
	Key_mappings(bufnr)
end

-- Key mappings
function Key_mappings(bufnr)
local opts = { noremap=true, silent=true }
  buf_set_keymap(bufnr, 'n', 'cD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'cd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'ci', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'cs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'cR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'cF', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'cr', '<cmd>lua vim.lsp.buf.references({ includeDeclaration = true })<CR>', opts)
end

-- Diagnostics to loc list
function Diagnostics_loc_list()
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
