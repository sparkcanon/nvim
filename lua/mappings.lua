local opts = { silent = false }
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- Command mode mapping
vim.keymap.set({ 'n', 'x' }, ';', ':')
vim.keymap.set({ 'n', 'x' }, ':', ';')

-- Tabs
vim.keymap.set('n', '<Tab>', 'gt', { desc = 'Tab next' })
vim.keymap.set('n', '<S-Tab>', 'gT', { desc = 'Tab prev' })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', opts)

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- buffers
vim.keymap.set('n', '[b', ':bprevious<cr>', opts)
vim.keymap.set('n', ']b', ':bnext<cr>', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to prev error' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next error' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Quick show line error' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open errors in list' })

vim.keymap.set('t', '<C-space>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)

-- Clear highlighting
vim.keymap.set('n', '<C-x>', [[:nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>]], opts)
