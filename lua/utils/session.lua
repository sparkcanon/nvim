local M = {}

-- Save session
function M.SessionSave()
  if vim.fn.finddir(".git", ",;") == ".git" then
    local root = vim.fn.substitute(vim.fn.fnamemodify(vim.fn.getcwd(0), ":t"), "^\\.", "", "")
    vim.api.nvim_command("mks! " .. vim.fn.stdpath("config") .. "/tmp/dir_session/" .. root .. ".vim")
  end
end

function M.SessionFzf()
  vim.api.nvim_command(
    [[
call fzf#run({ 'source': 'fd . ~/.config/nvim/tmp/dir_session/ -e vim', 'sink': 'so', 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } })
	]]
  )
end

return M
