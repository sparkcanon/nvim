local sumneko_root_path = vim.fn.eval("$HOME") .. "/.config/lua-language-server"
local custom_attach = require("lsp/on_attach").custom_attach

return {
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		custom_attach(client)

		-- format on save
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
	end,
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
}
