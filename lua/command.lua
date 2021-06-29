local com = vim.api.nvim_command

-- Grep for quickfix list
com [[command! -nargs=+ -complete=file Grep cgetexpr utils#grep(<f-args>)]]

-- Save sessions (force)
com [[command! -nargs=0 SessionSave lua require 'utils/session'.SessionSave()]]

-- Dirvish
com [[command! -nargs=? -complete=dir Explore Dirvish <args>]]
com [[command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>]]
com [[command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>]]

-- Yank
com [[command! -nargs=? -complete=dir YRelative :let @+ = expand("%")]]
com [[command! -nargs=? -complete=dir YFilename :let @+ = expand("%:t")]]

-- Custom Pickers
com [[command! -nargs=0 SessionLoad lua require 'plugins/fzf'.SessionPicker()]]
com [[command! -nargs=0 Npm lua require 'plugins/fzf'.NpmScriptPicker()]]

com [[command! -nargs=0 Files lua require("fzf-commands").files({ fzf = function(contents, options)
  return require("fzf").fzf(contents, options, { border = false, row = vim.fn.eval("&lines"), height = 25, width = vim.fn.eval("&columns") }) end })]]

com [[command! -nargs=0 Buffers lua require("fzf-commands").bufferpicker2({height = 20})]]

com [[command! -nargs=1 Find call luaeval('require("fzf-commands").rg(_A, { fzf = function(contents, options)
  return require("fzf").fzf(contents, options, { border = false, row = vim.fn.eval("&lines"), height = 25, width = vim.fn.eval("&columns") }) end })', <f-args>)]]
