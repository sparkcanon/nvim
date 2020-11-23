vim.cmd("packadd! formatter.nvim")
local api = vim.api

-- Find executable locally
local function setPrettier(exe)
  local fmt_prettier
  if vim.fn.findfile(exe, "node_modules/.bin/") == "node_modules/.bin/prettier" then
    fmt_prettier = "node_modules/.bin/prettier"
  else
    vim.fn.executable(exe)
    fmt_prettier = exe
  end
  return fmt_prettier
end

-- Formatter setup
require "format".setup(
  {
    javascript = {
      prettier = function()
        return {
          exe = setPrettier("prettier"),
          args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    javascriptreact = {
      prettier = function()
        return {
          exe = setPrettier("prettier"),
          args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    typescript = {
      prettier = function()
        return {
          exe = setPrettier("prettier"),
          args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    typescriptreact = {
      prettier = function()
        return {
          exe = setPrettier("prettier"),
          args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    css = {
      prettier = function()
        return {
          exe = setPrettier("prettier"),
          args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    less = {
      prettier = function()
        return {
          exe = setPrettier("prettier"),
          args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    html = {
      prettier = function()
        return {
          exe = setPrettier("prettier"),
          args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    markdown = {
      prettier = function()
        return {
          exe = setPrettier("prettier"),
          args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    json = {
      prettier = function()
        return {
          exe = setPrettier("prettier"),
          args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    lua = {
      luafmt = function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    }
  }
)
