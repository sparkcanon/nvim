local nvim_lsp = require("lspconfig")
local custom_attach = require "lsp/on_attach".custom_attach
local eslint = require("lsp/diagnostics/eslint")
local prettier = require("lsp/diagnostics/prettier")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local efm_config = os.getenv("HOME") .. "/.config/nvim/lua/lsp/diagnostics/config.yaml"
local efm_log_dir = "/tmp/"
local efm_root_markers = {"package.json", ".git/", ".zshrc"}
local efm_languages = {
  yaml = {prettier},
  markdown = {prettier},
  javascript = {eslint, prettier},
  javascriptreact = {eslint, prettier},
  typescript = {eslint, prettier},
  typescriptreact = {eslint, prettier},
  css = {prettier},
  scss = {prettier},
  sass = {prettier},
  less = {prettier},
  json = {prettier},
  graphql = {prettier},
  vue = {prettier},
  html = {prettier},
  lua = {{formatCommand = "luafmt --indent-count 2 --stdin", formatStdin = true}}
}

nvim_lsp.efm.setup {
  cmd = {
    "efm-langserver",
    "-c",
    efm_config,
    "-logfile",
    efm_log_dir .. "efm.log"
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "lua",
    "html",
    "hbr",
    "scss",
    "vue"
  },
  on_attach = custom_attach,
  root_dir = nvim_lsp.util.root_pattern(unpack(efm_root_markers)),
  init_options = {documentFormatting = true},
  settings = {rootMarkers = efm_root_markers, languages = efm_languages},
  capabilities = capabilities
}
