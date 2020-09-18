-- Purpose: Initialize lua code

-- LSP
require "lsp"

-- Treesitter
require "treesitter"

-- Formatter
require "formatter"

-- Colorizer
vim.cmd("packadd nvim-colorizer.lua")
require "colorizer".setup()
