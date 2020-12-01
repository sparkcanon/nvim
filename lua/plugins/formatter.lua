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
require "formatter".setup(
  {
    filetype = {
      javascript = {
        function()
          return {
            exe = setPrettier("prettier"),
            args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      javascriptreact = {
        function()
          return {
            exe = setPrettier("prettier"),
            args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      typescript = {
        function()
          return {
            exe = setPrettier("prettier"),
            args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      typescriptreact = {
        function()
          return {
            exe = setPrettier("prettier"),
            args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      css = {
        function()
          return {
            exe = setPrettier("prettier"),
            args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      less = {
        function()
          return {
            exe = setPrettier("prettier"),
            args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      html = {
        function()
          return {
            exe = setPrettier("prettier"),
            args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      markdown = {
        function()
          return {
            exe = setPrettier("prettier"),
            args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      json = {
        function()
          return {
            exe = setPrettier("prettier"),
            args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      lua = {
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)
