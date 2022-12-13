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

-- [[ Packadd cfilter on qf ]]
local qf_group = vim.api.nvim_create_augroup('quickfixlist', { clear = true })
vim.api.nvim_create_autocmd('filetype', {
  callback = function()
    vim.cmd [[packadd cfilter]]
  end,
  group = qf_group,
  pattern = 'qf',
})

-- vim.api.nvim_create_autocmd('ColorScheme', {
--   pattern = '*',
--   callback = function()
--     package.loaded['feline'] = nil
--     package.loaded['catppuccin.groups.integrations.feline'] = nil
--     require('feline').setup {
--       components = require('catppuccin.groups.integrations.feline').get(),
--     }
--   end,
-- })
