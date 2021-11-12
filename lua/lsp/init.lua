local lsp = vim.lsp
local nvim_lsp = require("lspconfig")
local merge_table = require("utils/general").merge_table
local baseConfig = require("lsp/base_config")

lsp.handlers["textDocument/signatureHelp"] = lsp.with(
	lsp.handlers.signature_help,
	{ focusable = false, scope = "line" }
)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, { focusable = false, scope = "line" })

-- Handle diagnostic configuration
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
	-- Enable underline
	underline = false,
	-- Enable virtual text
	virtual_text = false,
	-- Disable on insert
	update_in_insert = false,
	signs = true,
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
	"null-ls",
}

local server_configs = require("lsp/servers")

for _, v in pairs(s) do
	local config = baseConfig()
	if server_configs[v] ~= nil then
		config = merge_table(config, server_configs[v])
	end
	nvim_lsp[v].setup(config)
end
