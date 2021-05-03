local map = require "utils/general".map
local M = {}

M.custom_attach = function(client, bufnr)
  require "lsp_signature".on_attach(
    {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "single"
      }
    }
  )
  -- Set omnifunc
  vim.api.nvim_buf_set_option(bufnr or 0, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Mappings
  map("n", ",j", "<cmd>lua vim.lsp.buf.definition()<CR>")
  map("n", ",vj", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>")
  map("n", ",sj", "<cmd>split | lua vim.lsp.buf.definition()<CR>")
  map("n", ",tj", "<cmd>tab lua vim.lsp.buf.definition()<CR>")
  map("n", ",p", "<cmd>lua Peek_definition()<CR>")

  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  map("n", ",i", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  map("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  map("n", ",yt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  map("n", ",r", "<cmd>lua vim.lsp.buf.references()<CR>")
  map("n", ",w", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  map("n", ",W", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  map("n", ",d", "<cmd>lua vim.lsp.buf.declaration()<CR>")

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    map("n", ",f", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
  end
  if client.resolved_capabilities.document_range_formatting then
    map("v", ",f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", {noremap = true, silent = true})
  end

  map("n", ",a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  map("n", ",R", "<cmd>lua vim.lsp.buf.rename()<CR>")

  map("n", ",e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  map("n", ",S", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
end

return M
