local custom_attach = require("lsp/on_attach").custom_attach
local ts_utils = require("lsp/ts-utils")
local lspconfig_util = require("lspconfig.util")

return {
	-- Only needed for inlayHints
	init_options = require("nvim-lsp-ts-utils").init_options,
	root_dir = lspconfig_util.find_git_ancestor,
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		custom_attach(client)

		ts_utils(client)

		-- format on save
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")

		local opts = { silent = true, noremap = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", ",to", ":TSLspOrganize<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", ",tr", ":TSLspRenameFile<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", ",ti", ":TSLspImportAll<CR>", opts)
	end,
}
