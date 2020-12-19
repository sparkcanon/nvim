local cmd = vim.cmd
local g = vim.g

-- Load plugins
cmd("packadd! nvim-colorizer.lua") -- colorizer
require "plugins/treesitter" -- treesitter

-- Colorizer
require "colorizer".setup {
  "*", -- Highlight all files, but customize some others.
  less = {rgb_fn = true}, -- Enable parsing rgb(...) functions in less.
  sass = {rgb_fn = true}, -- Enable parsing rgb(...) functions in sass.
  scss = {rgb_fn = true} -- Enable parsing rgb(...) functions in scss.
}

-- Built in plugins
cmd("packadd! cfilter")
cmd("packadd! matchit")

-- Dirvish
g.loaded_netrwPlugin = 1
g.dirvish_mode = [[:sort ,^.*[/],]]

-- Fugitive
g.fugitive_pty = 0

-- fzf
vim.cmd([[let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } }]])

-- Autocomplete
vim.cmd([[let g:mucomplete#enable_auto_at_startup = 1]])
