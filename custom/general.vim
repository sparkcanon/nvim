" COLORS AND STYLING {{{
set t_Co=256
set t_ut=
colorscheme apprentice
syntax enable
set background=dark 
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

" For transparent vim background
highlight! Normal guibg=NONE
" }}}

" UI Config {{{
set softtabstop=4   " number of spaces in tab when editing
set number          " show line numbers
set ruler
set conceallevel =2
set cursorline      " highlight current line
set wrap
set linebreak
set wildcharm=<Tab>
set wildmenu
set wildmode=full
set lazyredraw      " redraw only when we need to.
set showmatch
set showcmd         " show command in bottom bar

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:¬
set fillchars+=vert:│
set list
set statusline=\ ❮\ %f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)\ ❯\ 
" }}}

" INDENTATION {{{
set smartindent
set autoindent
" }}}

" SEARCHING {{{
set incsearch " search as characters are entered
set smartcase
set ignorecase
" }}}

" FOLDING {{{
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested fold max
" }}}

" UTILITIES {{{
set shell=/usr/local/bin/zsh
set hidden
set history=100
set splitbelow
set splitright
set clipboard+=unnamed
set diffopt=vertical " Show diffs in vertical splits
" if has('nvim')
" 	set inccommand=split " opens a preview for highlights
" endif
set completeopt=menu,menuone,preview,noselect,noinsert
" }}}

" Backups {{{
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set backup
set writebackup
if has('nvim')
	set undodir=$HOME/.config/nvim/tmp/dir_undo
	set backupdir=$HOME/.config/nvim/tmp/dir_backup//
	set directory^=$HOME/.config/nvim/tmp/dir_swap//
else
	set backupdir=$HOME/.vim/tmp/dir_backup//
	set directory^=$HOME/.vim/tmp/dir_swap//
	set undodir=$HOME/.vim/tmp/dir_undo
endif
" }}}

if executable('rg') 
	" Note we extract the column as well as the file and line number
	set grepprg=rg\ --column\ --vimgrep
endif
