local cmd = vim.cmd
local g = vim.g

-- Load plugins
cmd "packadd! nvim-colorizer.lua" -- colorizer
require "plugins/treesitter" -- treesitter
require "plugins/telescope" -- telescope setup
require "trouble".setup {}
require "lualine".setup {
  options = {
    section_separators = "",
    component_separators = "",
    theme = "tokyonight"
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff"},
    lualine_c = {"filename"},
    lualine_x = {
      {"diagnostics", sources = {"nvim_lsp"}},
      "filetype"
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
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

-- Float term
g.floaterm_position = "bottom"
g.floaterm_width = vim.fn.eval("&columns")
g.floaterm_height = 0.3
