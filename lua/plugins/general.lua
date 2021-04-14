local cmd = vim.cmd
local g = vim.g

-- Load plugins
cmd "packadd! nvim-colorizer.lua" -- colorizer
require "plugins/treesitter" -- treesitter
require "telescope".setup {
  defaults = {
    -- layout_strategy = "vertical",
    -- results_height = 15
  }
}

-- Colorizer
require "colorizer".setup {
  "*", -- Highlight all files, but customize some others.
  less = {rgb_fn = true}, -- Enable parsing rgb(...) functions in less.
  sass = {rgb_fn = true}, -- Enable parsing rgb(...) functions in sass.
  scss = {rgb_fn = true} -- Enable parsing rgb(...) functions in scss.
}

-- Built in plugins
cmd "packadd! cfilter"
cmd "packadd! matchit"

-- Dirvish
g.loaded_netrwPlugin = 1
g.dirvish_mode = [[:sort ,^.*[/],]]

-- Fugitive
g.fugitive_pty = 0

-- Completion
cmd "let g:completion_matching_strategy_list = ['fuzzy', 'exact', 'substring', 'all']"
