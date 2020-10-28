local tmux_directions = {h = "L", j = "D", k = "U", l = "R"}
local T = {}

-- Purpose: Tmux navigator
function T.TmuxNavigate(dir)
  local winnr = vim.fn.winnr()
  vim.fn.execute("wincmd " .. dir)
  if vim.fn.winnr() == winnr then
    vim.fn.system("tmux select-pane -" .. tmux_directions[dir])
  end
end

return T
