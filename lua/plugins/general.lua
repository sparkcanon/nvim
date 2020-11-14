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

-- Dirvish
g.loaded_netrwPlugin = 1
g.dirvish_mode = [[:sort ,^.*[/],]]

-- Fugitive
g.fugitive_pty = 0
