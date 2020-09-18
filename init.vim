" Desc: Personal Neovim configuration
" Author: Pratik Borde
"  _______ 
" < NVIMRC >
"  ------- 
"        \   ^__^
"         \  (**)\_______
"            (__)\       )\/\
"             U  ||----w |
"                ||     ||

" Section: Reset au group {{{
augroup GeneralAutocmds
	autocmd!
augroup END
augroup ColorsAutocmd
	autocmd!
augroup END
augroup MkdirAutocmd
	autocmd!
augroup END
augroup FileTypeAutocmd
	autocmd!
augroup END
" }}}

" Section: Syntax {{{
filetype plugin indent on
syntax on
" }}}

" Section: Basic settings {{{
set number                                               " Display number line
setglobal hidden                                         " Display hidden buffers in list
setglobal showmatch                                      " Highlight matching paranthesis
setglobal wrap                                           " Wrap long lines
setglobal autoindent                                     " Minimal auto indenting for any filetype
setglobal clipboard+=unnamed                             " Set clipboard options
set mouse=a
set inccommand=split
set signcolumn=number

" Splits
setglobal splitbelow                                     " Split window opens below
setglobal splitright                                     " Split window opens right

" Case
setglobal smartcase                                      " To ignore case in certain cases, overrides ignorecase
setglobal ignorecase                                     " Ignore case all together

" Wild menu options
setglobal wildignorecase                                 " Ignore case for wildmenu
setglobal wildignore=*.swp,*.bak                         " Ignore files
setglobal wildignore+=*.cache,*.min.*,**/dist/**
setglobal wildignore+=**/.git/**/*
setglobal wildignore+=*-lock.json

" Set fd error format
set errorformat^=%f

" Path options
setglobal path=.,,**                                     " Standard path

" Backup settings
setglobal viewoptions-=options
set undofile                                             " Set this option to have full undo power
setglobal backup                                         " Set this option to enable backup
setglobal writebackup                                    " Set this option to write back up
setglobal backupdir=$HOME/.config/nvim/tmp/dir_backup//  " Back up dir
setglobal directory^=$HOME/.config/nvim/tmp/dir_swap//   " Swap file dir
setglobal undodir=$HOME/.config/nvim/tmp/dir_undo        " Undo dir

" Statusline
set laststatus=0                                         " Dont display statusline
set ruler                                                " Display ruler
set rulerformat=%45(%t%m\ ❯\ %l,%c%V%=%P%)               " Display filename in ruler

" Grepprg & grepformat
if executable('rg')
	setglobal grepprg=rg\ --vimgrep
	setglobal grepformat=%f:%l:%c:%m
endif
" }}}

" Section: Colorscheme {{{
" Modify buffer colors
autocmd GeneralAutocmds ColorScheme * call colors#modifyBufferColors()

set termguicolors
colorscheme iceberg
" }}}

" Section: Autocmd {{{
" Preview window close
autocmd GeneralAutocmds CompleteDone * silent! pclose
autocmd GeneralAutocmds CursorMoved * silent! pclose

" Save session on exit
autocmd GeneralAutocmds VimLeavePre * call sessions#sessionSave()

" Set path
autocmd GeneralAutocmds VimEnter * call path_job#setProjectPath()

" Set up format prg
autocmd FileTypeAutocmd FileType javascript,typescript,typescriptreact,json,less,css call format#formatprg()

" Create a new dir if it doesnt exists
autocmd MkdirAutocmd BufNewFile * call utils#mkdir(expand('<afile>:p:h'))

" Auto-resize splits when Vim gets resized.
autocmd GeneralAutocmds VimResized * wincmd =
" }}}

" Section: Custom commands {{{
" Grep for quickfix list
command! -nargs=+ -complete=file Grep call grep#any('any', <q-args>)
" Grep word under the cursor
command! -nargs=1 GrepExact call grep#any('exact', <q-args>)
" Grep word under the cursor excluding test files
command! -nargs=1 GrepExclude call grep#any('exclude', <q-args>)
" Manual grep for current buffer
command! -nargs=1 GrepBuffer call grep#any('buffer', <q-args>)

" Save sessions (force)
command! -nargs=0 SessionSave call sessions#sessionSave()
" Load sessions
command! -nargs=1 -complete=custom,sessions#sessionCompletePath
			\ SessionLoad execute 'source $HOME/.vim/tmp/dir_session/<args>'

" Find files and add to quickfix list
command! -nargs=* FdFiles cgetexpr system('fd -g "' . <q-args> . '" -E "*.snap" -E "test"')
" }}}

" Section: Abbr {{{
call utils#setupCommandAbbrs('w','update')
call utils#setupCommandAbbrs('sov','source $MYVIMRC')
call utils#setupCommandAbbrs('nw','noautocmd update')
call utils#setupCommandAbbrs('ngw','noautocmd Gw')

" Buffer list
call utils#setupCommandAbbrs('lv','ls\<space>t\<CR>:vert\<space>sb')
call utils#setupCommandAbbrs('lt','ls\<space>t\<CR>:tab\<space>sb')
call utils#setupCommandAbbrs('ld','ls\<space>t\<CR>:bd')
call utils#setupCommandAbbrs('bD','bp\<bar>bd#')

" Session
call utils#setupCommandAbbrs('ssl','SessionLoad')
call utils#setupCommandAbbrs('ssa','SessionSave')

" Grep
call utils#setupCommandAbbrs('sr','Grep')
call utils#setupCommandAbbrs('sb','GrepBuffer' )
call utils#setupCommandAbbrs('se','GrepExact')
call utils#setupCommandAbbrs('st','GrepExclude')
call utils#setupCommandAbbrs('fd','FdFiles')

" Git
call utils#setupCommandAbbrs('gf','Git fetch --all')
call utils#setupCommandAbbrs('gp','Git push')
call utils#setupCommandAbbrs('gl','Git pull')
call utils#setupCommandAbbrs('gd','Git difftool')
call utils#setupCommandAbbrs('gm','Git mergetool')
" }}}

" Section: Mappings {{{
" Enter Commands mode
set iminsert=1
for mode in ['n', 'x']
  execute mode . 'noremap  : ;'
  execute mode . 'noremap  ; :'
endfor

" Using backtick for marks drops you on the exact column
nnoremap ` '
nnoremap ' `

" Completion
" Tag completion
inoremap <C-]> <C-x><C-]>
" Omni completion
inoremap <C-k> <C-x><C-o>
" Keyword completion
inoremap <C-n> <C-x><C-n>
" File name completion
inoremap <C-f> <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
" Line completion
inoremap <C-l> <C-x><C-l>
" Spell completion
inoremap <C-d> <C-x><C-s>
" Tab movement in pum
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Terminal
tnoremap <Esc> <C-\><C-n>

" Center search result line in screen
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
nnoremap # #zvzz
nnoremap `` ``zz

" Location list
nnoremap <script> <silent> <Up> :call togglelist#ToggleList('Location List', 'l')<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>
nnoremap ]<C-L> :lnfile<CR>
nnoremap [<C-L> :lpfile<CR>

" Quickfix list
nnoremap <script> <silent> <Down> :call togglelist#ToggleList('Quickfix List','c')<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap ]<C-F> :cnfile<CR>
nnoremap [<C-F> :cpfile<CR>

" Buffers
" previously used buffer
nnoremap <BS> <C-^>
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>

" Args
nnoremap ]a :next<CR>
nnoremap [a :previous<CR>

" Substitute
nnoremap <Bslash>s :%s/\v<<C-r><C-w>>/
xnoremap <Bslash>s <Esc>:%s/<C-R><C-R>=utils#getVisualSelection()<CR>/

" Global
nnoremap <Bslash>g :g//#<Left><Left>
" Lists
cnoremap <expr> <CR> listcommands#CR()
nnoremap <Bslash>F :global //#<left><left>
nnoremap <Bslash>f :global /<C-R><C-W>/#

" New lines
nnoremap ]<space> o<C-c>
nnoremap [<space> O<C-c>

" Find
nnoremap <space>f :find<space>
nnoremap <space>c :Cfind<space>
nnoremap <space>s :sfind<space>
nnoremap <space>v :vert sfind<space>
nnoremap <space>t :tabfind<space>

" Edit
nnoremap <space>ee :e <C-R>='%:h/'<CR>
nnoremap <space>ev :vsp <C-R>='%:h/'<CR>
nnoremap <space>es :sp <C-R>='%:h/'<CR>
" }}}

" Section: Plugin & lsp {{{
lua require("init")

" Enable virtual text
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 0

" Load built-in optional plugins
packadd! cfilter  " Filter results from qf lists
packadd! matchit  " Jump to brackets
" }}}

" vim:foldmethod=marker
