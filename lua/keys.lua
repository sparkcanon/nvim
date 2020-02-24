local vimApi = vim.api
local buf_set_keymap = vimApi.nvim_buf_set_keymap

-- Key mappings
function Key_mappings(bufnr)
	vimApi.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap=true, silent=true }
	buf_set_keymap(bufnr, 'n', ',D', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap(bufnr, 'n', ',d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap(bufnr, 'n', ',i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap(bufnr, 'n', ',s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap(bufnr, 'n', ',t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap(bufnr, 'n', ',R', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap(bufnr, 'n', ',F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
	buf_set_keymap(bufnr, 'n', ',r', '<cmd>lua vim.lsp.buf.references({ includeDeclaration = true })<CR>', opts)
	buf_set_keymap(bufnr, 'n', ',e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
end
