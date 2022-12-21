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
