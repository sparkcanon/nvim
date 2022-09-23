-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = { vim.fn.expand '$MYVIMRC', '*/lua/**' },
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local term_group = vim.api.nvim_create_augroup('TermNav', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    if vim.bo.filetype == '' or vim.bo.filetype == 'toggleterm' then
      local opts = { silent = false, buffer = 0 }
      vim.keymap.set('t', '<C-space>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
      -- vim.keymap.set('t', ']t', [[<C-\><C-n>:tablast<CR>]])
      -- vim.keymap.set('t', '[t', [[<C-\><C-n>:tabnext<CR>]])
      -- vim.keymap.set('t', '<S-Tab>', [[<C-\><C-n>:bprev<CR>]])
      -- vim.keymap.set('t', '<leader><Tab>', [[<C-\><C-n>:close \| :bnext<cr>]])
    end
  end,
  group = term_group,
  pattern = { 'term://*' },
})
