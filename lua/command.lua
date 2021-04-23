local com = vim.api.nvim_command

-- Grep for quickfix list
com [[command! -nargs=+ -complete=file Grep cgetexpr utils#grep(<f-args>)]]

-- Save sessions (force)
com [[command! -nargs=0 SessionSave lua require 'utils/session'.SessionSave()]]

-- Dirvish
com [[command! -nargs=? -complete=dir Explore Dirvish <args>]]
com [[command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>]]
com [[command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>]]

-- Telescope
com [[command! -nargs=? Thelp lua require 'telescope.builtin'.help_tags()]]
com [[command! -nargs=? TqList lua require 'telescope.builtin'.quickfix()]]
com [[command! -nargs=? Tllist lua require 'telescope.builtin'.loclist()]]
com [[command! -nargs=? Tregs lua require 'telescope.builtin'.registers()]]
com [[command! -nargs=? Tcolors lua require 'telescope.builtin'.colorscheme()]]
com [[command! -nargs=? Tmarks lua require 'telescope.builtin'.marks()]]
com [[command! -nargs=? Tstatus lua require 'telescope.builtin'.git_status()]]
com [[command! -nargs=? Tbranches lua require 'telescope.builtin'.git_branches()]]
com [[command! -nargs=? Tbcommits lua require 'telescope.builtin'.git_bcommits()]]
com [[command! -nargs=? Tcommits lua require 'telescope.builtin'.git_commits()]]
com [[command! -nargs=? Ttree lua require 'telescope.builtin'.treesitter()]]
com [[command! -nargs=? Treferences lua require 'telescope.builtin'.lsp_references()]]
com [[command! -nargs=? Twsymbols lua require 'telescope.builtin'.lsp_workspace_symbols()]]
com [[command! -nargs=? RcFiles lua require('plugins/telescope').search_dotfiles()]]
com [[command! -nargs=? Tgrep lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})]]

-- Yank
com [[command! -nargs=? -complete=dir YRelative :let @+ = expand("%")]]
com [[command! -nargs=? -complete=dir YFilename :let @+ = expand("%:t")]]

-- Custom Pickers
com [[command! -nargs=0 SessionLoad lua require 'utils/telescope'.SessionPicker()]]
