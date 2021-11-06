local M = {}

M.sumneko_lua = require("lsp/servers/lua")
M.jsonls = require("lsp/servers/json")
M.vuels = require("lsp/servers/vue")
M.eslint = require("lsp/servers/eslint")
M.bashls = require("lsp/servers/bash")
M.html = require("lsp/servers/html")
M.vimls = require("lsp/servers/vim")
M.cssls = require("lsp/servers/css")
M.tsserver = require("lsp/servers/ts")

require('lsp/servers/null_ls')

return M
