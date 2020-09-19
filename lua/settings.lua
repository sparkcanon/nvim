-- Purpose: Basic settings
local vim = vim
local home = vim.fn.expand("$HOME")

vim.cmd("filetype plugin indent on") -- enable filetype detection
vim.cmd("syntax on") -- enable syntax highlighting

-- Window options
vim.wo.nu = true -- Display numbers
vim.wo.signcolumn = "number" -- Merge signcolumn and numbers

-- Editor options
vim.o.hidden = true -- hide some buffers
vim.o.showmatch = true -- Visually show matching bracket
vim.o.wrap = true -- Wrap text
vim.o.mouse = "a" -- Allow mouse
vim.o.inccommand = "split" -- icremental search to open preview window
vim.o.splitbelow = true -- Split window to the bottom
vim.o.splitright = true -- Split window to right
vim.o.smartcase = true -- Use smart case
vim.o.ignorecase = true -- Ignore case
vim.o.wildignorecase = true -- Ignore case in wildignore
vim.o.wildignore = [[*.swp,*.bak,*.cache,*.min.*,**/dist/**,**/.git/**,*-lock.json,]] -- Wildignore paths
vim.o.errorformat = vim.o.errorformat .. ",%f," -- Set fd errorformat
vim.o.path = ".,,**" -- Set standard path

-- Backup, undo, swap options
vim.o.undofile = true -- Set this option to have full undo power
vim.o.backup = true -- Set this option to enable backup
vim.o.writebackup = true -- Set this option to write back up
vim.o.backupdir = home .. "/.config/nvim/tmp/dir_backup/" -- Back up dir
vim.o.directory = home .. "/.config/nvim/tmp/dir_swap/," .. vim.o.directory -- Swap file dir
vim.o.undodir = home .. "/.config/nvim/tmp/dir_undo/" -- Undo dir

-- Statusline
vim.o.laststatus = 2 -- Dont display statusline
vim.o.showmode = false -- Don't display mode in cmd

-- Insert mode
vim.o.iminsert = 1

-- Use rg for grep
if vim.fn.executable("rg") then
  vim.o.grepprg = "rg --vimgrep"
  vim.o.grepformat = "%f:%l:%c:%m"
end
