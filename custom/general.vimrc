set nocompatible
" let g:ruby_host_prog = '/usr/local/lib/ruby/gems/2.6.0/bin/neovim-ruby-host'

" peekaboo {{{
let g:peekaboo_window = "vert bo 40new"
" }}}

" Copy paste {{{
set clipboard+=unnamed
" }}}

" Update a buffer's contents on focus if it changed outside of Vim. {{{
au FocusGained,BufEnter * :checktime
" }}}

"" STATUS BAR {{{
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
" }}}

" Resize {{{
" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =
" }}}

" Reduce delay when switching between modes. {{{
augroup NoInsertKeycodes
  autocmd!
  autocmd InsertEnter * set ttimeoutlen=0
  autocmd InsertLeave * set ttimeoutlen=50
augroup END
" }}}

" COLORS AND STYLING {{{
colorscheme base16-dracula
syntax enable
set background=dark 
" }}}

" Font {{{
let g:one_allow_italics = 1
highlight Comment cterm=italic
hi link xmlEndTag xmlTag
hi htmlArg gui=italic
hi Comment gui=italic
hi Type gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type cterm=italic
"  Italic garbage
let &t_8f="\<Esc>[38;2%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
" }}}

" SPACES AND TABS {{{
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" }}}

" UI Config {{{
set number
" set relativenumber
set cole=1
set conceallevel=1
set concealcursor=nvic
set ruler
set cursorline
set smartindent
set autoindent
set wrap
set linebreak
set wildmenu
set lazyredraw
set ttyfast
set showmatch
set noshowmode " lightline shows the status not vim
" set showcmd
"}}}

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
" }}}

set nobackup
set nowritebackup
set noswapfile
set hidden
set history=100
set path+=**
set nolist
set splitbelow
set splitright

set diffopt=vertical

set completeopt=menu,menuone,preview,noselect,noinsert
if executable('ag') 
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column\ --vimgrep
endif

