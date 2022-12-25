vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
local navic = require 'nvim-navic'
navic.setup {
  highlight = true,
}

require('mason.settings').set {
  ui = {
    border = 'rounded',
  },
}

local lsp = require 'lsp-zero'

lsp.preset 'recommended'
lsp.ensure_installed {
  'sumneko_lua',
  'cssls',
  'cssmodules_ls',
  'eslint',
  'html',
  'jsonls',
  'prismals',
  'svelte',
  'tailwindcss',
  'tsserver',
  'vimls',
}

lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
  -- lsp mappings
  local bind = vim.keymap.set

  bind('n', '<leader>gq', '<cmd>LspZeroFormat<cr>', { buffer = bufnr, remap = false, desc = 'Format' })
  bind('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = bufnr, remap = false, desc = 'Code action' })
  bind('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = bufnr, remap = false, desc = 'Rename' })
  bind('i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { buffer = bufnr, remap = false, desc = 'Signature help' })
  bind('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr, remap = false, desc = 'References' })

  if client.server_capabilities.goto_definition == true then
    vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
  end

  if client.server_capabilities.document_formatting == true then
    vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
    -- Add this <leader> bound mapping so formatting the entire document is easier.
    -- bind('n', '<leader>gq', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  end
  -- navic capabilities
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end)

lsp.setup()

-- diagnostics
vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
}
