-- Mappings

local map = require "utils/general".map

-- LSP trouble
map("n", ",s", "<cmd>LspTroubleToggle<cr>", {silent = true, noremap = true})

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
map("i", "<Tab>", [[pumvisible() ? '<C-n>' : '<Tab>']], {silent = true, expr = true}) -- next selection on autocomplete menu
map("i", "<S-Tab>", [[pumvisible() ? '<C-p>' : '<S-Tab>']], {silent = true, expr = true}) -- previous selection on autocomplete menu

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
map("n", "<Up>", [[:call togglelist#ToggleList('Location List', 'l')<CR>]], {silent = true, script = true}) -- Toggle Location list
map("n", "]l", ":lnext<CR>")
map("n", "[l", ":lprevious<CR>")
map("n", "[L", ":lfirst<CR>")
map("n", "]L", ":llast<CR>")
map("n", "]<C-L>", ":lnfile<CR>")
map("n", "[<C-L>", ":lpfile<CR>")

-- Quickfix list
map("n", "<Down>", [[:call togglelist#ToggleList('Quickfix List', 'c')<CR>]], {silent = true, script = true}) -- Toggle Quickfix list
map("n", "]q", ":cnext<CR>")
map("n", "[q", ":cprevious<CR>")
map("n", "[Q", ":cfirst<CR>")
map("n", "]Q", ":clast<CR>")
map("n", "]<C-F>", ":cnfile<CR>")
map("n", "[<C-F>", ":cpfile<CR>")

-- Buffers
map("n", "<space>b", "<cmd>lua require('telescope.builtin').buffers()<CR>")
map("n", "<BS>", "<C-^>")
map("n", "]b", ":bnext<CR>")
map("n", "[b", ":bprevious<CR>")

-- Args
map("n", "]a", ":next<CR>")
map("n", "[a", ":previous<CR>")

-- Substitute
map("n", "<Bslash>s", ":%s/\\v<<C-r><C-w>>/")

-- Global
map("n", "<Bslash>g", ":g//#<Left><Left>")

-- New lines
map("n", "]<space>", "o<C-c>")
map("n", "[<space>", "O<C-c>")

-- Find
map("n", "<space>f", "<cmd>lua require('telescope.builtin').find_files()<CR>")
map("n", "<space>g", "<cmd>lua require('telescope.builtin').live_grep()<CR>")

-- Edit
map("n", "<space>ee", [[:e <C-R>='%:h/'<CR>]])
map("n", "<space>ev", [[:vsp <C-R>='%:h/'<CR>]])
map("n", "<space>es", [[:sp <C-R>='%:h/'<CR>]])

-- Lists
vim.api.nvim_set_keymap("c", "<CR>", "listcommands#CR()", {noremap = true, silent = false, expr = true, script = false})

-- Tmux
if vim.fn.exists("$TMUX_PANE") then
  map("n", "<a-h>", ":lua require 'utils/tmux'.TmuxNavigate('h')<CR>")
  map("n", "<a-j>", ":lua require 'utils/tmux'.TmuxNavigate('j')<CR>")
  map("n", "<a-k>", ":lua require 'utils/tmux'.TmuxNavigate('k')<CR>")
  map("n", "<a-l>", ":lua require 'utils/tmux'.TmuxNavigate('l')<CR>")
else
  map("n", "<a-h>", "<c-w>h")
  map("n", "<a-j>", "<c-w>j")
  map("n", "<a-k>", "<c-w>k")
  map("n", "<a-l>", "<c-w>l")
end

-- Jump to another window directly from terminal mode
map("t", "¬", "<c-w>l")
map("t", "˙", "<c-w>h")
map("t", "∆", "<c-w>j")
map("t", "˚", "<c-w>k")

-- Enable use of alt/meta key
vim.api.nvim_set_keymap("n", "¬", "<a-l>", {noremap = false})
vim.api.nvim_set_keymap("n", "˙", "<a-h>", {noremap = false})
vim.api.nvim_set_keymap("n", "∆", "<a-j>", {noremap = false})
vim.api.nvim_set_keymap("n", "˚", "<a-k>", {noremap = false})

-- Get more information from ctrl-g
map("n", "<c-g>", "2<c-g>")

-- Clear highlighting
map("n", "<c-l>", [[:nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>]])
