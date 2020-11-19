local com = vim.api.nvim_command

-- Grep for quickfix list
com([[command! -nargs=+ -complete=file Grep lua require 'utils/grep'.Grep(<f-args>)]])

-- Save sessions (force)
com([[command! -nargs=0 SessionSave lua require 'utils/session'.SessionSave()]])
com(
  [[command! -nargs=0 SessionLoad call fzf#run({ 'source': 'fd . ~/.config/nvim/tmp/dir_session/ -e vim', 'sink': 'so', 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } }) ]]
)

-- Nvim colors to kitty
com([[command! -nargs=0 ColorKitty lua require 'utils/color'.ModifyKittyColors()]])

-- Dirvish
com([[command! -nargs=? -complete=dir Explore Dirvish <args>]])
com([[command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>]])
com([[command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>]])

-- Yank
com([[command! -nargs=? -complete=dir YRelative :let @+ = expand("%")]])
com([[command! -nargs=? -complete=dir YFilename :let @+ = expand("%:t")]])

-- Jest
com(
  [[command! -nargs=0 JestLego call fzf#run({ 'source': 'fd -g {"*.test.*,*-test.*"} -E "*.snap" --base-directory ~/Documents/work_projects/tesco/lego-web/web/', 'sink': 'vsplit | term cd web && npx jest --watch', 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } }) ]]
)
com(
  [[command! -nargs=0 Jest call fzf#run({ 'source': 'fd -g {"*.test.*,*-test.*"} -E "*.snap"', 'sink': 'vsplit | term npx jest --watch', 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } }) ]]
)
