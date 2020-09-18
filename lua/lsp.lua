vim.cmd("packadd nvim-lspconfig")
vim.cmd("packadd diagnostic-nvim")

local nvim_lsp = require "nvim_lsp"

-- Desc: key mapping helper.
local key_mapper = function(mode, key, result)
  vim.fn.nvim_buf_set_keymap(
    0,
    mode,
    key,
    result,
    {
      noremap = true,
      silent = true
    }
  )
end

-- Desc: only applies to buffers with lsp on.
local on_attach = function(_, bufnr)
  -- Set omnifunc
  vim.api.nvim_buf_set_option(bufnr or 0, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Configure diagnostics using plugin
  require "diagnostic".on_attach()

  -- Mappings
  key_mapper("n", ",d", "<cmd>lua vim.lsp.buf.definition()<CR>")
  key_mapper("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  key_mapper("n", ",i", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  key_mapper("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  key_mapper("n", ",t", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  key_mapper("n", ",r", "<cmd>lua vim.lsp.buf.references()<CR>")
  key_mapper("n", ",w", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  key_mapper("n", ",W", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  key_mapper("n", ",D", "<cmd>lua vim.lsp.buf.declaration()<CR>")

  key_mapper("n", ",f", "<cmd>Format<CR>")
  key_mapper("n", ",a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  key_mapper("n", ",R", "<cmd>lua vim.lsp.buf.rename()<CR>")
  key_mapper("n", ",e", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>")
end

local servers = {"cssls", "bashls", "html", "tsserver", "jsonls", "vimls", "dartls", "sumneko_lua"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach
  }
end
