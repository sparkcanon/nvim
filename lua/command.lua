local com = vim.api.nvim_command

-- Grep for quickfix list
com [[command! -nargs=+ -complete=file Grep lua require 'utils/grep'.Grep(<f-args>)]]

-- Save sessions (force)
com [[command! -nargs=0 SessionSave lua require 'utils/session'.SessionSave()]]
com [[command! -nargs=0 SessionLoad lua require 'utils/telescope'.SessionPicker()]]

-- Nvim colors to kitty
com [[command! -nargs=0 ColorKitty lua require 'utils/color'.ModifyKittyColors()]]

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

-- Yank
com [[command! -nargs=? -complete=dir YRelative :let @+ = expand("%")]]
com [[command! -nargs=? -complete=dir YFilename :let @+ = expand("%:t")]]

-- Jest
-- com [[command! -nargs=0 JestLego call fzf#run({ 'source': 'fd -g {"*.test.*,*-test.*"} -E "*.snap" --base-directory ~/Documents/work_projects/tesco/lego-web/web/', 'sink': 'vsplit | term cd web && npx jest --watch', 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } }) ]]

-- com [[command! -nargs=0 Jest call fzf#run({ 'source': 'fd -g {"*.test.*,*-test.*"} -E "*.snap"', 'sink': 'vsplit | term npx jest --watch', 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } }) ]]
