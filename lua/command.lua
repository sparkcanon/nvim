local com = vim.api.nvim_command

-- Grep for quickfix list
com([[command! -nargs=+ -complete=file Grep lua require 'utils/grep'.Grep(<q-args>)]])

-- Save sessions (force)
com([[command! -nargs=0 SessionSave lua require 'utils/session'.SessionSave()]])

-- Find files and add to quickfix list
com([[command! -nargs=* FdFiles cgetexpr system('fd -g "' . <q-args> . '" -E "*.snap" -E "test"')]])

-- Nvim colors to kitty
com([[command! -nargs=0 ColorKitty lua require 'utils/color'.ModifyKittyColors()]])

-- Dirvish
com([[command! -nargs=? -complete=dir Explore Dirvish <args>]])
com([[command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>]])
com([[command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>]])

-- Yank
com([[command! -nargs=? -complete=dir YRelative :let @+ = expand("%")]])
com([[command! -nargs=? -complete=dir YFilename :let @+ = expand("%:t")]])
