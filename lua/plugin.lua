-- Plugins
local vim = vim

-- Colorizer
vim.cmd("packadd! nvim-colorizer.lua")
require "colorizer".setup()

-- Built in plugins
vim.cmd("packadd! cfilter")
vim.cmd("packadd! matchit")

-- Diagnostics
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_enable_underline = 0
vim.g.diagnostic_insert_delay = 1
vim.g.diagnostic_virtual_text_prefix = "▢"
