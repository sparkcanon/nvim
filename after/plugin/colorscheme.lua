vim.opt.fillchars = {
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┫',
  vertright = '┣',
  verthoriz = '╋',
}

require('catppuccin').setup {
  flavour = 'mocha',
  dim_inactive = {
    enabled = false,
    shade = 'dark',
    percentage = 0.15,
  },
  transparent_background = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    telescope = true,
    neotest = true,
    treesitter = true,
    treesitter_context = false,
    navic = {
      enabled = false,
      custom_bg = 'NONE',
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
}

vim.cmd 'colorscheme catppuccin'

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'single',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
  border = 'single',
})
vim.diagnostic.config { float = { border = 'single' } }
