local com = vim.api.nvim_command

-- Grep for quickfix list
com([[command! -nargs=+ -complete=file Grep call grep#any('any', <q-args>)]])
-- Grep word under the cursor
com([[command! -nargs=1 GrepExact call grep#any('exact', <q-args>)]])
-- Grep word under the cursor excluding test files
com([[command! -nargs=1 GrepExclude call grep#any('exclude', <q-args>)]])
-- Manual grep for current buffer
com([[command! -nargs=1 GrepBuffer call grep#any('buffer', <q-args>)]])

-- Save sessions (force)
com([[command! -nargs=0 SessionSave lua require 'functions/session'.SessionSave()]])

-- Find files and add to quickfix list
com([[command! -nargs=* FdFiles cgetexpr system('fd -g "' . <q-args> . '" -E "*.snap" -E "test"')]])
