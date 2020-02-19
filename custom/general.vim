" COLORS AND STYLING {{{
set t_Co=256
set t_ut=
syntax enable
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
colorscheme xcodedark
set background=dark 
" }}}

" UI Config {{{
set softtabstop=4   " number of spaces in tab when editing
set number          " show line numbers
set conceallevel =2
set cursorline      " highlight current line
set wrap
set linebreak
set lazyredraw      " redraw only when we need to.
set showmatch
set showcmd         " show command in bottom bar
set statusline=\ ❮\ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ ❯\ 
" }}}

" LIST CHARS {{{
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:¬
set fillchars+=vert:│
set list
" }}}

" WILDMENU {{{
set wildcharm=<Tab>
set wildmenu
set wildmode=full
set wildignore+=**/node_modules/**
set path=.,lego-web/**,peas/**
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

" UTILITIES {{{
set shell=/usr/local/bin/zsh
set hidden
set history=100
set splitbelow
set splitright
set clipboard+=unnamed
set diffopt=vertical " Show diffs in vertical splits
set hidden
set cmdheight=1
set updatetime=300 " You will have bad experience for diagnostic messages when it's default 4000.
set shortmess+=c " don't give |ins-completion-menu| messages.
if has('nvim')
  set signcolumn=auto:1
else
  set signcolumn=yes
endif
" if has('nvim')
" 	set inccommand=split " opens a preview for highlights
" endif
set completeopt=menu,menuone,preview,noselect,noinsert
set belloff+=ctrlg
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
	set grepprg=rg\ --column\ --no-heading\ --smart-case\ --follow\ --vimgrep
endif
