-- Mappings
local map = require("utils/general").map
local optTrue = { silent = true, noremap = true }

if packer_plugins["vim-ultest"] and packer_plugins["vim-ultest"].loaded then
	vim.cmd([[nmap <space>ut <Plug>(ultest-output-jump)]])
end

-- harpoon
if packer_plugins["harpoon"] and packer_plugins["harpoon"].loaded then
	map("n", "<space>ha", ":lua require('harpoon.mark').add_file()<CR>", optTrue)
	map("n", "<space>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", optTrue)

	map("n", "<space>hq", ":lua require('harpoon.ui').nav_file(1)<CR>", optTrue)
	map("n", "<space>hw", ":lua require('harpoon.ui').nav_file(2)<CR>", optTrue)
	map("n", "<space>he", ":lua require('harpoon.ui').nav_file(3)<CR>", optTrue)
	map("n", "<space>hr", ":lua require('harpoon.ui').nav_file(4)<CR>", optTrue)
	map("n", "<space>hs", ":lua require('harpoon.ui').nav_file(<c-r><c-w>)<CR>", optTrue)
	map("n", "<space>hx", ":lua require('harpoon.mark').clear_all()<CR>", optTrue)

	map("n", "<space>tg", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", optTrue)
	map("n", "<space>tq", ":lua require('harpoon.term').gotoTerminal(1)<CR>", optTrue)
	map("n", "<space>tw", ":lua require('harpoon.term').gotoTerminal(2)<CR>", optTrue)
	map("n", "<space>ta", ":lua require('harpoon.term').sendCommand(1, 1)<CR>", optTrue)
	map("n", "<space>ts", ":lua require('harpoon.term').sendCommand(1, 2)<CR>", optTrue)
end

-- Using backtick for marks drops you on the exact column
map("n", "`", "'")
map("n", "'", "`")

-- Command mode
map("n", ":", ";")
map("n", ";", ":")
map("x", ":", ";")
map("x", ";", ":")

-- Completion
map("i", "<C-]>", "<C-x><C-]>") -- Tag
map("i", "<C-k>", "<C-x><C-o>") -- Omni
map("i", "<C-n>", "<C-x><C-n>") -- Keyword
map("i", "<C-f>", "<C-x><C-f>") -- File name
map("i", "<C-l>", "<C-x><C-l>") -- Line
map("i", "<C-d>", "<C-x><C-s>") -- Spell

-- Tabs
map("n", "<Tab>", "gt")
map("n", "<S-Tab>", "gT")

-- Center search
map("n", "n", "nzvzz")
map("n", "N", "Nzvzz")
map("n", "*", "*zvzz")
map("n", "#", "#zvzz")
map("n", "``", "``zz")

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>")

-- Location list
map("n", "<Up>", [[:call togglelist#ToggleList('Location List', 'l')<CR>]], { silent = true, script = true }) -- Toggle Location list
map("n", "]l", ":lnext<CR>")
map("n", "[l", ":lprevious<CR>")
map("n", "[L", ":lfirst<CR>")
map("n", "]L", ":llast<CR>")
map("n", "]<C-L>", ":lnfile<CR>")
map("n", "[<C-L>", ":lpfile<CR>")

-- Quickfix list
map("n", "<Down>", [[:call togglelist#ToggleList('Quickfix List', 'c')<CR>]], { silent = true, script = true }) -- Toggle Quickfix list
map("n", "]q", ":cnext<CR>")
map("n", "[q", ":cprevious<CR>")
map("n", "[Q", ":cfirst<CR>")
map("n", "]Q", ":clast<CR>")
map("n", "]<C-F>", ":cnfile<CR>")
map("n", "[<C-F>", ":cpfile<CR>")

-- Buffers
map("n", "<BS>", "<C-^>")
map("n", "]b", ":bnext<CR>")
map("n", "[b", ":bprevious<CR>")

-- Edit
map("n", "<space>ee", [[:e <C-R>='%:h/'<CR>]])
map("n", "<space>ev", [[:vsp <C-R>='%:h/'<CR>]])
map("n", "<space>es", [[:sp <C-R>='%:h/'<CR>]])

-- Get more information from ctrl-g
map("n", "<c-g>", "2<c-g>")

-- Clear highlighting
map("n", "///", [[:nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>]])
