local cmd = vim.cmd
local g = vim.g

-- Load plugins
-- statusline
require "lualine".setup {
  options = {
    section_separators = "",
    component_separators = "",
    theme = "iceberg_dark"
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

-- Auto complete
require "compe".setup {
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

-- Todo comments
require "todo-comments".setup()

-- Colorizer
require "colorizer".setup {
  "*", -- Highlight all files, but customize some others.
  less = {rgb_fn = true}, -- Enable parsing rgb(...) functions in less.
  sass = {rgb_fn = true}, -- Enable parsing rgb(...) functions in sass.
  scss = {rgb_fn = true}, -- Enable parsing rgb(...) functions in scss.
  json = {rgb_fn = true}, -- Enable parsing rgb(...) functions in scss.
  js = {rgb_fn = true}, -- Enable parsing rgb(...) functions in scss.
  jsx = {rgb_fn = true}, -- Enable parsing rgb(...) functions in scss.
  tsx = {rgb_fn = true}, -- Enable parsing rgb(...) functions in scss.
  ts = {rgb_fn = true} -- Enable parsing rgb(...) functions in scss.
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

g.indent_blankline_char = "│"
cmd "let g:indent_blankline_filetype_exclude = ['TelescopePrompt', 'packer']" -- TODO: fix for telescope prompt
