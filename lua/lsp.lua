-- LSP

local K = require "utils"

-- Load plugins
vim.cmd("packadd! nvim-lspconfig")
vim.cmd("packadd! diagnostic-nvim")

-- Desc: only applies to buffers with lsp on.
local on_attach = function(_, bufnr)
  -- Set omnifunc
  vim.api.nvim_buf_set_option(bufnr or 0, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Configure diagnostics using plugin
  require "diagnostic".on_attach()

  -- Mappings
  K.Key_mapper("n", ",j", "<cmd>lua vim.lsp.buf.definition()<CR>", true)
  K.Key_mapper("n", ",vj", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", true)
  K.Key_mapper("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", true)
  K.Key_mapper("n", ",i", "<cmd>lua vim.lsp.buf.implementation()<CR>", true)
  K.Key_mapper("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", true)
  K.Key_mapper("n", ",t", "<cmd>lua vim.lsp.buf.type_definition()<CR>", true)
  K.Key_mapper("n", ",r", "<cmd>lua vim.lsp.buf.references()<CR>", true)
  K.Key_mapper("n", ",w", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", true)
  K.Key_mapper("n", ",W", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", true)
  K.Key_mapper("n", ",d", "<cmd>lua vim.lsp.buf.declaration()<CR>", true)

  K.Key_mapper("n", ",f", "<cmd>Format<CR>", true)
  K.Key_mapper("n", ",a", "<cmd>lua vim.lsp.buf.code_action()<CR>", true)
  K.Key_mapper("n", ",R", "<cmd>lua vim.lsp.buf.rename()<CR>", true)
  K.Key_mapper("n", ",e", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>", true)
end

local nvim_lsp = require "nvim_lsp"

local servers = {"cssls", "bashls", "html", "tsserver", "jsonls", "vimls", "dartls", "sumneko_lua"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach
  }
end
