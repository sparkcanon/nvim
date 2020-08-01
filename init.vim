" Section: Syntax {{{
filetype plugin indent on
syntax enable
" }}}

" Section: Completion {{{
setglobal completeopt+=menuone,noinsert,longest  " Open menu and no insert
set omnifunc=syntaxcomplete#Complete             " General purpose omnifunc
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
setglobal laststatus=2                                   " Display statusline
setglobal statusline=\ ❮\ %<%{functions#ShortenFname()}
setglobal statusline+=\ %{functions#locListErrorCount()}
setglobal statusline+=\%h%m%r%=%-14.(%l,%c%V%)\%P\ ❯\ 

" Grepprg & grepformat
if executable('rg')
	setglobal grepprg=rg\ --vimgrep
	setglobal grepformat=%f:%l:%c:%m
endif
" }}}

" Autocmd {{{
augroup GeneralSettings
	autocmd!
augroup END

" Modify buffer colors
autocmd GeneralSettings ColorScheme * call functions#modifyBufferColors()

" Coc colors
autocmd GeneralSettings ColorScheme * call functions#modifyCocSignColors()
autocmd GeneralSettings ColorScheme * call functions#modifyCocGitColors()

" Create a new dir if it doesnt exists
autocmd GeneralSettings BufWritePre *
			\ if '<afile>' !~ '^scp:' && !isdirectory(expand('<afile>:h')) |
			\ call mkdir(expand('<afile>:h'), 'p') |
			\ endif

" Set cwd on bufenter
autocmd GeneralSettings BufEnter * silent! Glcd

" Auto-resize splits when Vim gets resized.
autocmd GeneralSettings VimResized * wincmd =
" }}}

" Plugins {{{
if empty(glob(substitute(&packpath, ",.*", "/pack/plugins/opt/minPlug", "")))
	call system("git clone --depth=1 https://github.com/Jorengarenar/minPlug ".substitute(&packpath, ",.*", "/pack/plugins/opt/minPlug", ""))
	autocmd VimEnter * nested silent! MinPlugInstall | echo "minPlug: INSTALLED"
endif

packadd minPlug
MinPlug arzg/vim-colors-xcode          " Xcode 11’s dark and light colourschemes, now for Vim!
MinPlug sheerun/vim-polyglot           " A solid language pack for Vim
MinPlug justinmk/vim-dirvish           " Directory viewer for Vim ⚡️
MinPlug tpope/vim-fugitive             " 💀 A Git wrapper so awesome, it should be illegal
MinPlug tpope/vim-eunuch               " Helpers for UNIX
MinPlug tpope/vim-repeat               " repeat any command
MinPlug tpope/vim-surround             " quoting/parenthesizing made simple
MinPlug tpope/vim-commentary           " comment stuff out
MinPlug romainl/vim-cool               " A very simple plugin that makes hlsearch more useful
MinPlug godlygeek/tabular              " 🌻 A Vim alignment plugin
MinPlug ciaranm/detectindent           " Vim script for automatically detecting indent settings
MinPlug christoomey/vim-tmux-navigator " Seamless navigation between tmux panes and vim splits
" }}}

" Colorscheme {{{
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
colorscheme xcodedark
set background=dark
" }}}

" Load coc after setting colorscheme otherwise search hl breaks {{{
MinPlug neoclide/coc.nvim release      " Intellisense engine for Vim8 & Neovim
" }}}

" Commands {{{
" Grep for quickfix list
command! -nargs=+ -complete=file -bar Grep  cgetexpr functions#grep(<q-args>)
" Grep for location list
command! -nargs=+ -complete=file -bar LGrep lgetexpr functions#grep(<q-args>)
" }}}

" Abbr {{{
call functions#setupCommandAbbrs('w','update')
call functions#setupCommandAbbrs('sov','source $MYVIMRC')
call functions#setupCommandAbbrs('Mi','MinPlugInstall')
call functions#setupCommandAbbrs('gr','Grep')
call functions#setupCommandAbbrs('gp','Git push')
call functions#setupCommandAbbrs('gl','Git pull')
" }}}

" Plugin settings {{{
" Disvirsh
let g:loaded_netrwPlugin = 1                     " disable netrw
let g:dirvish_mode = ':sort | sort ,^.*[^/]$, r' " Sort dir at the top

" Vim-qf
let g:qf_mapping_ack_style = 1                   " Qf mappings
" }}}

" Mappings {{{
" Enter Commands mode
nnoremap ; :
nnoremap : ;

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
nnoremap <Up> :call togglelist#ToggleList('Location List', 'l')<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>
nnoremap ]<C-L> :lnfile<CR>
nnoremap [<C-L> :lpfile<CR>

" Quickfix list
nnoremap <Down> :call togglelist#ToggleList('Quickfix List','c')<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap ]<C-F> :cnfile<CR>
nnoremap [<C-F> :cpfile<CR>

" Tabularize
xnoremap ga :Tabularize /
xnoremap ga" :Tabularize / ".*<CR>
nnoremap ga :Tabularize /

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
xnoremap <Bslash>s <Esc>:%s/<C-R><C-R>=functions#getVisualSelection()<CR>/

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
