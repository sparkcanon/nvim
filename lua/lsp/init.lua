local nvim_lsp = require("lspconfig")
local null_ls = require("null-ls")
local custom_attach = require("lsp/on_attach").custom_attach

-- null_ls.builtins.formatting.stylelint
-- null_ls.builtins.diagnostics.hadolint
-- null_ls.builtins.diagnostics.vint
-- null_ls.builtins.diagnostics.yamllint
null_ls.config({
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.trim_whitespace,
		null_ls.builtins.code_actions.gitsigns,
	},
})

nvim_lsp["null-ls"].setup({})

-- Handle diagnostic configuration
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- Enable underline
	underline = true,
	-- Enable virtual text
	virtual_text = true,
	-- Disable on insert
	update_in_insert = false,
	signs = true,
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Vue
nvim_lsp.vuels.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		custom_attach(client)
	end,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

-- eslint
nvim_lsp.eslint.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		custom_attach(client)
	end,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

-- Bash
nvim_lsp.bashls.setup({
	on_attach = function(client)
		custom_attach(client)
	end,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

-- HTML
nvim_lsp.html.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		custom_attach(client)
	end,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

-- Vim
nvim_lsp.vimls.setup({
	on_attach = function(client)
		custom_attach(client)
	end,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

-- CSS
nvim_lsp.cssls.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		custom_attach(client)
	end,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

-- Typescript
local ts_utils = require("lsp/ts-utils")
nvim_lsp.tsserver.setup({
	-- Only needed for inlayHints
	init_options = require("nvim-lsp-ts-utils").init_options,
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		custom_attach(client)

		ts_utils(client)

		-- format on save
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
		-- no default maps, so you may want to define some here
		local opts = { silent = true, noremap = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", ",ts", ":TSLspOrganize<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", ",tr", ":TSLspRenameFile<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", ",ti", ":TSLspImportAll<CR>", opts)
	end,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

-- Json
nvim_lsp.jsonls.setup({
	cmd = { "vscode-json-language-server", "--stdio" },
	on_attach = custom_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			-- Schemas https://www.schemastore.org
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig*.json" },
					url = "https://json.schemastore.org/tsconfig.json",
				},
				{
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json",
					},
					url = "https://json.schemastore.org/prettierrc.json",
				},
				{
					fileMatch = { ".eslintrc", ".eslintrc.json" },
					url = "https://json.schemastore.org/eslintrc.json",
				},
				{
					fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
					url = "https://json.schemastore.org/babelrc.json",
				},
				{
					fileMatch = { "lerna.json" },
					url = "https://json.schemastore.org/lerna.json",
				},
				{
					fileMatch = { "now.json", "vercel.json" },
					url = "https://json.schemastore.org/now.json",
				},
				{
					fileMatch = {
						".stylelintrc",
						".stylelintrc.json",
						"stylelint.config.json",
					},
					url = "http://json.schemastore.org/stylelintrc.json",
				},
			},
		},
	},
})

-- Lua
local sumneko_root_path = vim.fn.eval("$HOME") .. "/.config/lua-language-server"
nvim_lsp.sumneko_lua.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		custom_attach(client)
	end,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	cmd = { sumneko_root_path .. "/bin/macOS/lua-language-server", "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
			diagnostics = {
				enable = true,
				globals = {
					"vim",
					"use",
				},
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})
