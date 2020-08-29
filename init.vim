" Desc: Personal Vim configuration
" Author: Pratik Borde
"  _______ 
" < VIMRC >
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
augroup FileTypeAutocmd
	autocmd!
augroup END
augroup ColorsAutocmd
	autocmd!
augroup END
augroup MkdirAutocmd
	autocmd!
augroup END
" }}}
"
" Section: Syntax {{{
filetype plugin indent on
syntax on
" }}}

" Section: Completion {{{
setglobal completeopt+=menuone,noinsert,longest  " Open menu and no insert
set omnifunc=v:lua.vim.lsp.omnifunc             " General purpose omnifunc
" }}}

" Section: Basic settings {{{
set number                                               " Display number line
setglobal backspace=indent,eol,start                     " Normal backspace behaviour
setglobal hidden                                         " Display hidden buffers in list
setglobal autoread                                       " Update file if changed outside
setglobal incsearch                                      " Turn on incremental search
setglobal hlsearch                                       " Highlight search term
setglobal showmatch                                      " Highlight matching paranthesis
setglobal wrap                                           " Wrap long lines
setglobal autoindent                                     " Minimal auto indenting for any filetype
setglobal clipboard+=unnamed                             " Set clipboard options
set mouse=a
set inccommand=split

" Splits
setglobal splitbelow                                     " Split window opens below
setglobal splitright                                     " Split window opens right

" Case
setglobal smartcase                                      " To ignore case in certain cases, overrides ignorecase
setglobal ignorecase                                     " Ignore case all together

" Wild menu options
setglobal wildmenu                                       " Turn menu on for wild searches
setglobal wildignorecase                                 " Ignore case for wildmenu
setglobal wildignore=*.swp,*.bak                         " Ignore files
setglobal wildignore+=*.cache,*.min.*,**/dist/**
setglobal wildignore+=**/.git/**/*
setglobal wildignore+=*-lock.json

" Set fd error format
set errorformat+=%f

" Path options
setglobal path=.,,**                                     " Standard path

" Backup settings
setglobal sessionoptions-=options
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

" Coc colors
autocmd GeneralAutocmds ColorScheme * call colors#modifyCocSignColors()
autocmd GeneralAutocmds ColorScheme * call colors#modifyCocGitColors()

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
colorscheme xcodedark
set background=dark
" }}}

" Section: Autocmd {{{
" Preview window close
autocmd GeneralAutocmds CompleteDone * silent! pclose
autocmd GeneralAutocmds CursorMoved * silent! pclose

" Create a new dir if it doesnt exists
autocmd MkdirAutocmd BufNewFile * call utils#mkdir(expand('<afile>:p:h'))

" Save session on exit
autocmd GeneralAutocmds VimLeave * call sessions#sessionSave()

" Auto-resize splits when Vim gets resized.
autocmd GeneralAutocmds VimResized * wincmd =

" Set up format prg
let s:formatprg_for_filetype = {
			\ "css"             : "prettier --stdin-filepath %",
			\ "less"            : "prettier --stdin-filepath %",
			\ "go"              : "gofmt",
			\ "html"            : "prettier --stdin-filepath %",
			\ "javascript"      : "prettier --stdin-filepath %",
			\ "typescript"      : "prettier --stdin-filepath %",
			\ "typescriptreact" : "prettier --stdin-filepath %",
			\ "json"            : "prettier --stdin-filepath %",
			\ }

for [ft, fp] in items(s:formatprg_for_filetype)
	execute "autocmd FileTypeAutocmd FileType " . ft . " let &l:formatprg=\"" . fp . "\" | setlocal formatexpr="
endfor

autocmd FileTypeAutocmd FileType css,javascript,typescript,typescriptreact,json,less nnoremap gQ mlgggqG'l :delm l<CR>
" }}}

" Section: Custom commands {{{
" Grep for quickfix list
command! -nargs=+ -complete=file_in_path Grep cgetexpr utils#grep(<q-args>)
" Grep word under the cursor
command! -nargs=0 -bar GrepV execute 'Grep ' . expand('<cword>')
" Grep word under the cursor excluding test files
command! -nargs=0 -bar GrepVT execute "Grep '" . expand('<cword>') . "' -F -g !'{*spec.*,*test.*}'"
" Manual grep for current buffer
command! -nargs=1 -bar GrepBuffer execute 'Grep ' . <q-args> . ' ' . expand('%')
" Last grep
command! -nargs=0 GrLast execute 'Grep ' . @/ . ' ' . expand('%')

" Save sessions (force)
command! -nargs=0 SessionSave call sessions#sessionSave()
" Load sessions
command! -nargs=1 -complete=custom,sessions#sessionCompletePath
			\ SessionLoad execute 'source $HOME/.config/nvim/tmp/dir_session/<args>'

" }}}

" Section: Abbr {{{
call utils#setupCommandAbbrs('w','update')
call utils#setupCommandAbbrs('sov','source $MYVIMRC')
call utils#setupCommandAbbrs('ssl','SessionLoad')
call utils#setupCommandAbbrs('ssa','SessionSave')

" Grep
call utils#setupCommandAbbrs('fr','Grep')
call utils#setupCommandAbbrs('fb','GrepBuffer' )
call utils#setupCommandAbbrs('fv','GrepV')
call utils#setupCommandAbbrs('ft','GrepVT')

" Git
call utils#setupCommandAbbrs('gp','Git push')
call utils#setupCommandAbbrs('gl','Git pull')
" }}}

" Section: Plugins {{{
packloadall " Load all plugins

" Disvirsh
let g:loaded_netrwPlugin = 1                     " disable netrw
let g:dirvish_mode = ':sort | sort ,^.*[^/]$, r' " Sort dir at the top
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

" CFDO
nnoremap <Bslash>c :cfdo! %s/<C-r><C-w>//g <Bar> update<S-Left><Left><Left><Left><Left><Left>
" xnoremap <Bslash>c :cfdo %s/<C-R><C-R>=utils#getVisualSelection()<CR>//gc <Bar> update<S-Left><S-Left><Left><Left><Left><Left> FIXME: This mapping is broken

" Lists
cnoremap <expr> <CR> listcommands#CR()
nnoremap <Bslash>F :global //#<left><left>
nnoremap <Bslash>f :global /<C-R><C-W>/#

" New lines
nnoremap ]<space> o<C-c>
nnoremap [<space> O<C-c>

" Edit
nnoremap <space>ee :e <C-R>='%:h/'<CR>
nnoremap <space>ev :vsp <C-R>='%:h/'<CR>
nnoremap <space>es :sp <C-R>='%:h/'<CR>
" }}}

" vim:foldmethod=marker
