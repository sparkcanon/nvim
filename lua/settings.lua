-- Purpose: Basic settings
local o = vim.o
local cmd = vim.cmd
local wo = vim.wo
local g = vim.g
local home = vim.fn.stdpath "config"

cmd "filetype plugin indent on" -- enable filetype detection
cmd "syntax on" -- enable syntax highlighting

-- Window options
wo.number = true -- Display numbers
wo.signcolumn = "auto" -- Merge signcolumn and numbers
wo.cursorline = true -- Show cursorline

-- Editor options
o.hidden = true -- hide some buffers
o.showmatch = true -- Visually show matching bracket
o.wrap = true -- Wrap text
o.mouse = "a" -- Allow mouse
o.inccommand = "split" -- icremental search to open preview window
o.splitbelow = true -- Split window to the bottom
o.splitright = true -- Split window to right
o.smartcase = true -- Use smart case
o.ignorecase = true -- Ignore case
o.wildignorecase = true -- Ignore case in wildignore
o.wildignore = [[*.swp,*.bak,*.cache,*.min.*,**/dist/**,**/.git/**,*-lock.json,]] -- Wildignore paths
o.errorformat = o.errorformat .. ",%f," -- Set fd errorformat
o.path = ".,,**" -- Set standard path
o.clipboard = "unnamed" .. o.clipboard -- os clipboard
o.completeopt = "menuone,noselect" -- Autocomplete options
o.shortmess = o.shortmess .. "c"

-- Backup, undo, swap options
o.undofile = true -- Set this option to have full undo power
o.backup = true -- Set this option to enable backup
o.writebackup = true -- Set this option to write back up
o.backupdir = home .. "/tmp/dir_backup/" -- Back up dir
o.directory = home .. "/tmp/dir_swap/," .. o.directory -- Swap file dir
o.undodir = home .. "/tmp/dir_undo/" -- Undo dir

-- Use rg for grep
if vim.fn.executable("rg") then
  g.grepprg = "rg"
  o.grepprg = g.grepprg .. " --vimgrep"
  o.grepformat = "%f:%l:%c:%m"
end

-- Statusline
o.laststatus = 2 -- Dont display statusline
o.showmode = true -- Display mode in cmd
o.ruler = true

local mod = " %m"
local ro = "%{&readonly ? '[RO] ' : ''}"
local ft = "%y "
local sep = " %= "
local pos = " %-12(%l/%c%) "
local pct = " %P"
local fn = ' %{pathshorten(expand("%"))}'

-- Fugitive
-- let l:fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"

o.statusline = fn .. "%<" .. mod .. ro .. ft .. sep .. pos .. "%*" .. pct .. " "
