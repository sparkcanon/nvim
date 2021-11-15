-- Purpose: Basic settings
local o = vim.o
local wo = vim.wo
local g = vim.g

-- Window options
wo.number = true -- Display numbers
wo.signcolumn = "no" -- Merge signcolumn and numbers
wo.cursorline = true -- Show cursorline

-- Editor options
o.showmatch = true -- Visually show matching bracket
o.wrap = true -- Wrap text
o.mouse = "a" -- Allow mouse
o.inccommand = "split" -- icremental search to open preview window
o.splitbelow = true -- Split window to the bottom
o.splitright = true -- Split window to right
o.smartcase = true -- Use smart case
o.ignorecase = true -- Ignore case
o.wildmode="longest,full"
o.wildignorecase = true -- Ignore case in wildignore
o.wildignore = [[*.swp,*.bak,*.cache,*.min.*,**/dist/**,**/.git/**,*-lock.json,]] -- Wildignore paths
o.path = ".,,**" -- Set standard path
o.clipboard = "unnamed" .. o.clipboard -- os clipboard
o.completeopt = "menuone,noselect" -- Autocomplete options
o.updatetime = 100
o.list = true
o.listchars="trail:·,eol:¬,tab:│ "
o.laststatus = 1
o.termguicolors = true -- True colors

-- Use rg for grep
if vim.fn.executable("rg") then
	g.grepprg = "rg"
	o.grepprg = g.grepprg .. " --vimgrep"
	o.grepformat = "%f:%l:%c:%m"
end
