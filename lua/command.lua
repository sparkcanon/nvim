local api = require "vim".api

-- Grep for quickfix list
api.nvim_command([[command! -nargs=+ -complete=file Grep call grep#any('any', <q-args>)]])
-- Grep word under the cursor
api.nvim_command([[command! -nargs=1 GrepExact call grep#any('exact', <q-args>)]])
-- Grep word under the cursor excluding test files
api.nvim_command([[command! -nargs=1 GrepExclude call grep#any('exclude', <q-args>)]])
-- Manual grep for current buffer
api.nvim_command([[command! -nargs=1 GrepBuffer call grep#any('buffer', <q-args>)]])

-- Save sessions (force)
api.nvim_command([[command! -nargs=0 SessionSave lua require 'functions/session'.SessionSave()]])

-- Find files and add to quickfix list
api.nvim_command([[command! -nargs=* FdFiles cgetexpr system('fd -g "' . <q-args> . '" -E "*.snap" -E "test"')]])
