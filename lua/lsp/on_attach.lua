local map = require("utils/general").map
local M = {}

M.custom_attach = function(client, bufnr)
	-- Set omnifunc
	vim.api.nvim_buf_set_option(bufnr or 0, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local opts = { noremap = true, silent = true }
	-- Mappings
	map("n", ",d", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map("n", ",vd", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
	map("n", ",sd", "<cmd>split | lua vim.lsp.buf.definition()<CR>", opts)
	map("n", ",td", "<cmd>tab lua vim.lsp.buf.definition()<CR>", opts)

	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	map("n", ",r", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	map("n", ",sw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
	map("n", ",sW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)

	map("n", ",f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	map("v", ",f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)

	map("n", ",a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	map("n", ",R", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

	map("n", ",de", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	map("n", ",db", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	map("n", ",dw", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts)
	map("n", ",dn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

	if client.resolved_capabilities.signature_help then
		vim.cmd([[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]])
	end
end

return M
