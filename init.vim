" Desc: Personal Vim configuration
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
" }}}
"
" Section: Syntax {{{
filetype plugin indent on
syntax on
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
set signcolumn=number

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
colorscheme iceberg
set background=dark
" }}}

" Section: Autocmd {{{
" Preview window close
autocmd GeneralAutocmds CompleteDone * silent! pclose
autocmd GeneralAutocmds CursorMoved * silent! pclose

" Create a new dir if it doesnt exists
autocmd MkdirAutocmd BufNewFile * call utils#mkdir(expand('<afile>:p:h'))

" Auto-resize splits when Vim gets resized.
autocmd GeneralAutocmds VimResized * wincmd =
" }}}

" Section: Abbr {{{
call utils#setupCommandAbbrs('w','update')
call utils#setupCommandAbbrs('sov','source $MYVIMRC')

call utils#setupCommandAbbrs('cs','CocSearch')
call utils#setupCommandAbbrs('cS','CocList sessions')
call utils#setupCommandAbbrs('ll','CocList buffers')
call utils#setupCommandAbbrs('cr','CocList grep')
call utils#setupCommandAbbrs('cf','CocList files')
call utils#setupCommandAbbrs('cl','CocList')
call utils#setupCommandAbbrs('ca','CocAction')
call utils#setupCommandAbbrs('cd','CocDiagnostics')
call utils#setupCommandAbbrs('cc','CocCommand')

" Git
call utils#setupCommandAbbrs('gp','Git push')
call utils#setupCommandAbbrs('gl','Git pull')
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
