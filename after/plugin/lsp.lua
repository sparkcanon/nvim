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
  local opts = { buffer = bufnr, remap = false }
  local bind = vim.keymap.set

  bind('n', '<leader>f', '<cmd>LspZeroFormat<cr>', opts)
  bind('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  bind('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  bind('i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

  bind('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true, noremap = true })
  bind('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { silent = true, noremap = true })
  bind('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { silent = true, noremap = true })
  bind('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { silent = true, noremap = true })
  bind('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { silent = true, noremap = true })
  bind('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', { silent = true, noremap = true })

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
