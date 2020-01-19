augroup GeneralSettings
	autocmd!
augroup END

" Update a buffer's contents on focus if it changed outside of Vim. {{{
au GeneralSettings FocusGained,BufEnter * :checktime
" }}}

" TERMINAL {{{
au GeneralSettings TermOpen * startinsert
" }}}

"" STATUS BAR {{{
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
" }}}

" RESIZE {{{
" Auto-resize splits when Vim gets resized.
au GeneralSettings VimResized * wincmd =
" }}}

" Reduce delay when switching between modes. {{{
au GeneralSettings InsertEnter * set ttimeoutlen=0
au GeneralSettings InsertLeave * set ttimeoutlen=50
" }}}

" COLORS AND STYLING {{{
au GeneralSettings ColorScheme * highlight SignifySignAdd    ctermfg=green  guifg=#30e3ca cterm=NONE gui=NONE
	\ | highlight SignifySignDelete ctermfg=red    guifg=#be3144 cterm=NONE gui=NONE
	\ | highlight SignifySignChange ctermfg=yellow guifg=#faf494 cterm=NONE gui=NONE
	\ | hi SignColumn guibg=clear-background
colorscheme landscape
syntax enable
set background=dark 
set termguicolors
" }}}

" UI Config {{{
set softtabstop=4
set number
set ruler
set conceallevel =2
set cursorline " line highlighting the cursor
set smartindent
set autoindent
set wrap
set linebreak
set wildmenu
set lazyredraw
set showmatch
set noshowmode " lightline shows the status not vim
set showcmd

" Enable persistent undo so that undo history persists across vim sessions {{{
set undofile
set undodir=~/.vim/undo
" }}}

" FONT {{{
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
" set hlsearch " Focus on the cursor when highlighting
set smartcase
set ignorecase
" }}}

" FOLDING {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
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
set inccommand=split " highlights as you substitute
" }}}

set completeopt=menu,menuone,preview,noselect,noinsert
if executable('rg') 
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column\ --vimgrep
endif

