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

-- Exit terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- Tabs
vim.keymap.set('n', '<Tab>', 'gt', { desc = 'Tab next' })
vim.keymap.set('n', '<S-Tab>', 'gT', { desc = 'Tab prev' })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Clear highlighting
vim.keymap.set('n', '<C-x>', [[:nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>]], { silent = true })

-- buffers
vim.keymap.set('n', '[b', ':bprevious<cr>', { silent = true })
vim.keymap.set('n', ']b', ':bnext<cr>', { silent = true })

-- [[ Dap ]]
vim.keymap.set('n', '<leader>C', function()
  require('dap').continue()
end, { silent = true, desc = 'Dap [C]ontinue' })
vim.keymap.set('n', '<leader>so', function()
  require('dap').step_over()
end, { silent = true, desc = 'Dap [S]tep [O]ver' })
vim.keymap.set('n', '<leader>si', function()
  require('dap').step_into()
end, { silent = true, desc = 'Dap [S]tep [I]nto' })
vim.keymap.set('n', '<leader>sO', function()
  require('dap').step_out()
end, { silent = true, desc = 'Dap [S]tep [O]ut' })
vim.keymap.set('n', '<leader>tb', function()
  require('dap').toggle_breakpoint()
end, { silent = true, desc = 'Dap [T]oggle [B]reakpoint' })
vim.keymap.set('n', '<leader>tsb', function()
  require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { silent = true, desc = 'Dap [S]et [C]onditional [B]reakindent' })
vim.keymap.set('n', '<leader>lp', function()
  require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
end, { silent = true, desc = 'Dap set [L]og [P]oint' })
vim.keymap.set('n', '<leader>or', ':DapToggleRepl<CR>', { silent = true, desc = 'Dap [O]pen [R]epl' })
vim.keymap.set('n', '<leader>rl', function()
  require('dap').run_last()
end, { silent = true, desc = 'Dap [R]un [L]ast' })
vim.keymap.set('n', '<leader>dt', function()
  require('dap').terminate()
end, { desc = '[D]ap [T]erminate' })

-- [[ Jester ]]
vim.keymap.set('n', '<leader>tr', function()
  require('jester').run()
end, { desc = '[T]est [R]un' })
vim.keymap.set('n', '<leader>tL', function()
  require('jester').run_last()
end, { desc = '[T]est run [L]ast' })
vim.keymap.set('n', '<leader>tF', function()
  require('jester').run_file()
end, { desc = '[T]est run [F]ile' })
vim.keymap.set('n', '<leader>tl', function()
  require('jester').debug_last()
end, { desc = '[T]est debug [L]ast' })
vim.keymap.set('n', '<leader>tf', function()
  require('jester').debug_file()
end, { desc = '[T]est debug [F]ile' })
vim.keymap.set('n', '<leader>td', function()
  require('jester').debug()
end, { desc = '[T]est [D]ebug' })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>se', require('telescope.builtin').diagnostics, { desc = '[S]earch all [E]errors' })
vim.keymap.set('n', '<leader>sF', ':Telescope file_browser grouped=true path=%:p:h<CR>', { desc = '[S]earch for [F]iles' })
vim.keymap.set('n', '<leader>sm', ':Telescope marks<CR>', { desc = '[S]earch [M]arks' })
vim.keymap.set('n', '<leader>sk', ':Telescope keymaps<CR>', { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sd', ':Telescope dap<CR>', { desc = '[S]earch [D]ap' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to prev error' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next error' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Quick show line error' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open errors in list' })

-- Commands
vim.api.nvim_create_user_command('Lg', ':FloatermNew --width=0.89 --height=0.89 lazygit', { nargs = 0 })
