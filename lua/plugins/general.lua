local cmd = vim.cmd
local g = vim.g

-- Load plugins
cmd "packadd! nvim-colorizer.lua" -- colorizer
require "plugins/treesitter" -- treesitter
require "plugins/telescope" -- telescope setup
require "trouble".setup {} -- fancy lsp diagnostics
require "lualine".setup { -- statusline
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

require "compe".setup { -- auto complete
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true
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

-- Float term
g.floaterm_position = "bottom"
g.floaterm_width = vim.fn.eval("&columns")
g.floaterm_height = 0.3
