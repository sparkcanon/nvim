local com = vim.api.nvim_command

-- Grep for quickfix list
com([[command! -nargs=+ -complete=file Grep lua require 'functions/grep'.Grep(<q-args>)]])

-- Save sessions (force)
com([[command! -nargs=0 SessionSave lua require 'functions/session'.SessionSave()]])

-- Find files and add to quickfix list
com([[command! -nargs=* FdFiles cgetexpr system('fd -g "' . <q-args> . '" -E "*.snap" -E "test"')]])

-- Nvim colors to kitty
com([[command! -nargs=0 ColorKitty lua require 'functions/color'.ModifyKittyColors()]])
