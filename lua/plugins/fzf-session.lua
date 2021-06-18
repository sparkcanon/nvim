local fzf = require "fzf"
fzf.default_window_options = {border = false, row = vim.fn.eval("&lines"), height = 15, width = vim.fn.eval("&columns")}

local S = {}

function S.SessionPicker()
  coroutine.wrap(
    function()
      local result = fzf.fzf([[fd . --base-directory ~/.config/nvim/tmp/dir_session/]])
      if result then
        vim.cmd("so ~/.config/nvim/tmp/dir_session/" .. result[1])
      end
    end
  )()
end

function S.NpmScriptPicker()
  local raw = vim.fn.readfile("./package.json")
  local decode = vim.fn.json_decode(raw)["scripts"]
  local scriptsNames = {}
  local scripts = {}
  for name, code in pairs(decode) do
    table.insert(scriptsNames, name)
    table.insert(scripts, code)
  end
  coroutine.wrap(
    function()
      local result = fzf.fzf(scriptsNames)
      if result then
        vim.cmd("FloatermNew yarn " .. result[1])
      end
    end
  )()
end

return S
