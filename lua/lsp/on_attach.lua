local map = require("utils/general").map
local M = {}

M.custom_attach = function(client, bufnr)
	require("lsp_signature").on_attach({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = {
			border = "single",
		},
	})
	-- Set omnifunc
	vim.api.nvim_buf_set_option(bufnr or 0, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local opts = { noremap = true, silent = true }
	-- Mappings
	map("n", ",j", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map("n", ",vj", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
	map("n", ",sj", "<cmd>split | lua vim.lsp.buf.definition()<CR>", opts)
	map("n", ",tj", "<cmd>tab lua vim.lsp.buf.definition()<CR>", opts)
	map("n", ",p", "<cmd>lua Peek_definition()<CR>", opts)

	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	map("n", ",i", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	map("n", ",yt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	map("n", ",r", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	map("n", ",w", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
	map("n", ",W", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
	map("n", ",d", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

	-- Set some keybinds conditional on server capabilities
	map("n", ",f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	map("v", ",f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	map("n", ",fs", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>", opts)
	map("v", ",fs", "<cmd>lua vim.lsp.buf.range_formatting_sync(nil, 1000)<CR>", opts)

	map("n", ",a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	map("n", ",R", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

	map("n", ",e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	map("n", ",S", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

	-- if client.resolved_capabilities.signature_help then
	-- 	vim.cmd([[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]])
	-- end
end

return M
