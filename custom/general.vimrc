" Update a buffer's contents on focus if it changed outside of Vim. {{{
augroup UpdateBufferOnFocus
    autocmd!
    au FocusGained,BufEnter * :checktime
augroup END
" }}}

"" STATUS BAR {{{
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
" }}}

" RESIZE {{{
" Auto-resize splits when Vim gets resized.
augroup ResizeSplitsOnVimResize
    autocmd!
    autocmd VimResized * wincmd =
augroup END
" }}}

" Reduce delay when switching between modes. {{{
augroup NoInsertKeycodes
  autocmd!
  autocmd InsertEnter * set ttimeoutlen=0
  autocmd InsertLeave * set ttimeoutlen=50
augroup END
" }}}

" COLORS AND STYLING {{{
augroup HighlightOverwrite
    autocmd!
    autocmd ColorScheme * highlight SignifySignAdd    ctermfg=green  guifg=#30e3ca cterm=NONE gui=NONE
                \ | highlight SignifySignDelete ctermfg=red    guifg=#be3144 cterm=NONE gui=NONE
                \ | highlight SignifySignChange ctermfg=yellow guifg=#faf494 cterm=NONE gui=NONE
                \ | hi SignColumn guibg=clear-background
augroup END
colorscheme landscape
syntax enable
set background=dark 
set termguicolors
" }}}

" SPACES AND TABS {{{
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
" }}}

" UI Config {{{
set number
set ruler
set conceallevel =2
set cursorline
set smartindent
set autoindent
set wrap
set linebreak
set wildmenu
set lazyredraw
set showmatch
set noshowmode " lightline shows the status not vim
set showcmd

" FONT {{{
let g:one_allow_italics = 1
highlight Comment cterm=italic
hi link xmlEndTag xmlTag
hi htmlArg gui=italic
hi Comment gui=italic
hi Type gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type cterm=italic
" Italic garbage
let &t_8f="\<Esc>[38;2%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
" }}}

" }}}

" SEARCHING {{{
set incsearch
set hlsearch
set smartcase
set ignorecase
" }}}

" FOLDING {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let vimsyn_folding='af'       " Vim script
" }}}

" UTILITIES {{{
set shell=/usr/local/bin/zsh
set nobackup
set nowritebackup
set noswapfile
set hidden
set history=100
set path+=**
set nolist
set splitbelow
set splitright
set clipboard+=unnamed
set diffopt=vertical
" }}}

set completeopt=menu,menuone,preview,noselect,noinsert
if executable('rg') 
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column\ --vimgrep
endif

