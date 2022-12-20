local opts = { silent = true }
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
vim.keymap.set('n', '<Tab>', 'gt', { desc = 'Next tab' })
vim.keymap.set('n', '<S-Tab>', 'gT', { desc = 'Prev tab' })

-- Cant remember why I added this
vim.keymap.set({ 'n', 'v' }, '<leader>', '<Nop>', opts)

-- Move selected line / block of text in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line/selected down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line/selected up' })

-- undotree
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { desc = 'Undotree toggle' })

-- disables Q
vim.keymap.set('n', 'Q', '<nop>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- buffers
vim.keymap.set('n', '[b', ':bprevious<cr>', { silent = true, desc = 'Previous buffer' })
vim.keymap.set('n', ']b', ':bnext<cr>', { silent = true, desc = 'Next buffer' })
vim.keymap.set('n', '<BS>', '<C-^>', { silent = true, desc = 'Alternate buffer' })

-- term mode mappings
vim.keymap.set('t', '<C-space>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)

-- quick substitute
vim.keymap.set('n', '<c-s>', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { desc = 'Quick substitute' })

-- Clear highlighting
vim.keymap.set('n', '<C-x>', [[:nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>]], { desc = 'Clear search highlight' })

-- copy file path
vim.cmd [[command! -nargs=? -complete=dir YRelative :let @+ = expand("%")]]
vim.cmd [[command! -nargs=? -complete=dir YFilename :let @+ = expand("%:t")]]
