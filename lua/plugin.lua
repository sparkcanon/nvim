local cmd = vim.cmd
local g = vim.g

-- Colorizer
cmd("packadd! nvim-colorizer.lua")
require "colorizer".setup()

-- Built in plugins
cmd("packadd! cfilter")
cmd("packadd! matchit")

-- Diagnostics
g.diagnostic_enable_virtual_text = 1
g.diagnostic_enable_underline = 0
g.diagnostic_insert_delay = 1
g.diagnostic_virtual_text_prefix = "▢"
