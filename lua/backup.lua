
-- " Modify lsp colors
-- autocmd GeneralSettings ColorScheme * call functions#modifyLspColors()
-- " Modify signify colors
-- autocmd GeneralSettings ColorScheme * call functions#modifySignifyColors()


-- " Lsp colors
-- " TODO: Add colors to the commented hl groups
-- function! functions#modifyLspColors() abort
--  highlight! LspDiagnosticsError guifg=#CB2E3D
--  highlight! LspDiagnosticsHint guifg=#b7e1b5
--  highlight! LspDiagnosticsWarning guifg=#fccf4d
--  highlight! LspDiagnosticsInformation guifg=#00EA9E

--  highlight! LspDiagnosticsUnderlineError guifg=#CB2E3D
--  " highlight! LspDiagnosticsUnderline guifg=#b7e1b5
--  highlight! LspDiagnosticsUnderlineHint guifg=#b7e1b5
--  highlight! LspDiagnosticsUnderlineInformation guifg=#00EA9E
--  highlight! LspDiagnosticsUnderlineWarning guifg=#fccf4d
-- endfunction
-- " }}}

-- " Prettier {{{
-- function! functions#prettierFormat() abort
--  let prettierPath = glob(getcwd().'/node_modules/.bin/prettier')
--  if !empty(prettierPath)
--   let getPath = system('prettier --find-config-path .')[:-2]
--   let &l:makeprg = './node_modules/.bin/prettier --config ' . getPath . ' --write'
--  endif
-- endfunction
-- " }}}


-- " Jest {{{
-- " TODO: Resolve root automatically
-- function! functions#jestRunForSingleFile() abort
--  execute 'vnew | terminal cd node_modules/.bin && ./jest --watch '
-- endfunction
-- " }}}


-- " Sessions {{{
-- function! functions#sessionSave() abort
--  let root = fnamemodify(getcwd(0), ':t')
--  execute 'mks! $HOME/.config/nvim/tmp/dir_session/'.root.'.vim' | echo 'Session saved as '.root.'.vim'
-- endfunction

-- function! functions#sessionLoad(file) abort
--  execute 'source $HOME/.config/nvim/tmp/dir_session/'.a:file | echo 'Session '.a:file.' has been loaded'
-- endfunction

-- function! functions#sessionCompletePath(A,L,P) abort
--  let pathList =  split(globpath('$HOME/.config/nvim/tmp/dir_session/', '*.vim'), '\n')
--  let emptyList = []
--  for i in pathList
--   let item = split(i, '/')[-1]
--   let finalList = add(emptyList, item)
--  endfor
--  return finalList
-- endfunction
-- " }}}

-- " Signify colors {{{
-- function! functions#modifySignifyColors() abort
-- 	highlight SignifySignAdd guifg=yellow guibg=NONE ctermbg=NONE
-- 	highlight SignifySignDelete guifg=red  guibg=NONE ctermbg=NONE
-- 	highlight SignifySignChange guifg=green guibg=NONE ctermbg=NONE
-- endfunction
-- " }}}


-- MinPlug neovim/nvim-lsp                " Nvim LSP client configurations
-- MinPlug mhinz/vim-signify              " ➕ Show a diff using Vim its sign column.
-- MinPlug norcalli/nvim-colorizer.lua    " The fastest Neovim colorizer.


-- " Save session on exit
-- autocmd GeneralSettings VimLeave * call functions#sessionSave()


-- " Run prettier on save
-- autocmd GeneralSettings BufRead,BufNewFile *.tsx,*.jsx call functions#prettierFormat()
-- autocmd GeneralSettings FileType javascript,typescript,less,css,html call functions#prettierFormat()
-- autocmd GeneralSettings BufWritePost *.js,*.ts,*.tsx,*.jsx,*.html,*.css,*.less execute 'Make! %'

-- " Close preview window after completion is done
-- autocmd GeneralSettings CompleteDone * pclose


-- " Run jest test watcher
-- command! -nargs=1 -complete=file JestSingleFile call functions#jestRunForSingleFile()
-- " Save sessions (force)
-- command! -nargs=0 SessionSave call functions#sessionSave()
-- " Load sessions
-- command! -nargs=1 -complete=customlist,functions#sessionCompletePath SessionLoad call functions#sessionLoad(<q-args>)


-- call functions#setupCommandAbbrs('sload','SessionLoad')
-- call functions#setupCommandAbbrs('ssave','SessionSave')


-- " Nvim-lsp
-- lua require'main'.setup()
-- if exists('g:loaded_colorizer')
-- 	lua require'colorizer'.setup()
-- end


-- " Omnifunc
-- " Completion pum
-- inoremap ,, <C-x><C-o>
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
-- " keyword completion
-- inoremap        ,'      <C-n><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
-- " File name completion
-- inoremap        ,;      <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
-- " Whole line completion
-- inoremap        ,=      <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>


-- let g:signify_sign_add    = '│'
-- let g:signify_sign_delete = '│'
-- let g:signify_sign_change = '│'

