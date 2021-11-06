-- Mappings
local map = require("utils/general").map
local optTrue = { silent = true, noremap = true }

-- harpoon
if packer_plugins["harpoon"] and packer_plugins["harpoon"].loaded then
	map("n", "ga", ":lua require('harpoon.mark').add_file()<CR>", optTrue)
	map("n", "gt", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", optTrue)

	map("n", "gq", ":lua require('harpoon.ui').nav_file(1)<CR>", optTrue)
	map("n", "gw", ":lua require('harpoon.ui').nav_file(2)<CR>", optTrue)
	map("n", "ge", ":lua require('harpoon.ui').nav_file(3)<CR>", optTrue)
	map("n", "gr", ":lua require('harpoon.ui').nav_file(4)<CR>", optTrue)
	map("n", "gs", ":lua require('harpoon.ui').nav_file(<c-r><c-w>)<CR>", optTrue)
	map("n", "gx", ":lua require('harpoon.mark').clear_all()<CR>", optTrue)

	map("n", "tg", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", optTrue)
	map("n", "tq", ":lua require('harpoon.term').gotoTerminal(1)<CR>", optTrue)
	map("n", "tw", ":lua require('harpoon.term').gotoTerminal(2)<CR>", optTrue)
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
map("i", "<Tab>", [[pumvisible() ? '<C-n>' : '<Tab>']], { silent = true, expr = true }) -- next selection on autocomplete menu
map("i", "<S-Tab>", [[pumvisible() ? '<C-p>' : '<S-Tab>']], { silent = true, expr = true }) -- previous selection on autocomplete menu

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

-- Find
if packer_plugins["telescope.nvim"] and packer_plugins["telescope.nvim"].loaded then
	map("n", "<space>ff", ":lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<CR>")
	map("n", "<space>fr", ":lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<CR>")
	map("n", "<space>fb", ":lua require'telescope.builtin'.file_browser(require('telescope.themes').get_ivy({}))<CR>")
	map("n", "<space>b", ":lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<CR>")
end

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
