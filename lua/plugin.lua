local cmd = vim.cmd
local g = vim.g

-- Load plugins
cmd("packadd! nvim-colorizer.lua") -- colorizer
require "formatter" -- formatter
require "treesitter" -- treesitter

-- Colorizer
require "colorizer".setup()

-- Built in plugins
cmd("packadd! cfilter")
cmd("packadd! matchit")

-- Diagnostics
g.diagnostic_enable_virtual_text = 1
g.diagnostic_enable_underline = 0
g.diagnostic_insert_delay = 1
g.diagnostic_virtual_text_prefix = "▢"

-- Dirvish
g.loaded_netrwPlugin = 1
g.dirvish_mode = [[:sort ,^.*[/],]]
