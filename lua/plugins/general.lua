local cmd = vim.cmd
local g = vim.g

-- Load plugins
cmd("packadd! nvim-colorizer.lua") -- colorizer
require "plugins/formatter" -- formatter
require "plugins/treesitter" -- treesitter

-- Colorizer
require "colorizer".setup()

-- Built in plugins
cmd("packadd! cfilter")
cmd("packadd! matchit")

-- Diagnostics
g.diagnostic_enable_virtual_text = 1
g.diagnostic_trimmed_virtual_text = 60
g.diagnostic_enable_underline = 1
g.diagnostic_insert_delay = 1
g.diagnostic_virtual_text_prefix = "▢"

-- Dirvish
g.loaded_netrwPlugin = 1
g.dirvish_mode = [[:sort ,^.*[/],]]

-- Fugitive
g.fugitive_pty = 0
