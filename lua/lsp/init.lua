local lsp = vim.lsp
local merge_table = require("utils/general").merge_table
local baseConfig = require("lsp/base_config")
local server_configs = require("lsp/servers")
local lsp_installer_servers = require("nvim-lsp-installer.servers")

lsp.handlers["textDocument/signatureHelp"] = lsp.with(
	lsp.handlers.signature_help,
	{ focusable = false, scope = "line" }
)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, { focusable = false, scope = "line" })

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = true,
	update_in_insert = false,
	signs = false,
})

local s = {
	"vuels",
	-- "eslint",
	"bashls",
	"html",
	"vimls",
	"cssls",
	"tsserver",
	"jsonls",
	"sumneko_lua",
}

for _, v in pairs(s) do
	local server_available, requested_server = lsp_installer_servers.get_server(v)
	if server_available then
		requested_server:on_ready(function()
			-- local opts = {}
			local config = baseConfig()
			if server_configs[v] ~= nil then
				config = merge_table(config, server_configs[v])
			end
			requested_server:setup(config)
		end)
		if not requested_server:is_installed() then
			-- Queue the server to be installed
			requested_server:install()
		end
	end
end

require("lsp/servers/null_ls")
