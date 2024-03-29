-- See `:help vim.o`
-- Set highlight on search
vim.o.hlsearch = true

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.local/share/nvim/undodir'
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time from 250
vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'

-- True colours
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Cursor line
vim.o.cursorline = true

-- Clipboard
vim.opt.clipboard:prepend { 'unnamed' }

-- Statusline
vim.opt.laststatus = 2

-- Path
vim.cmd [[set path=$PWD/**]]
