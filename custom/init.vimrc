if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Movement {{{
Plug 'easymotion/vim-easymotion'      " Quickly move throughout the buffer
Plug 'haya14busa/incsearch.vim'       " In buffer search on steroids - fuzzy
Plug 'haya14busa/incsearch-fuzzy.vim' " In buffer search on steroids - fuzzy
Plug 'simeji/winresizer'              " Quickly resize splits/windows
" Plug 'haya14busa/incsearch-easymotion.vim'
" }}}

" Completetions {{{
Plug 'tpope/vim-surround'                       " Add quotes & stuff around words/sentences
Plug 'tpope/vim-commentary'                     " smart comments
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Best autocomplete engine ever
Plug 'w0rp/ale'                                 " Errors and stuff
Plug 'jiangmiao/auto-pairs'
" Plug 'ervandew/supertab'
" Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-dispatch'
" Plug 'neomake/neomake'
" }}}

" Themes {{{
Plug 'rakr/vim-one'
Plug 'shime/vim-livedown'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'Rigellute/rigel'
Plug 'drewtempelmeyer/palenight.vim'
" }}}

" Utilities {{{
Plug 'tpope/vim-sensible'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'       " Saving current session
Plug 'scrooloose/nerdtree'     " Tree based file explorer
"Plug 'mhinz/vim-startify'      " Start screen
Plug 'simnalamburt/vim-mundo'
Plug 'moll/vim-bbye'
" Plug 'bfredl/nvim-miniyank'
Plug 'junegunn/vim-slash'      " Remove highlight
Plug 'junegunn/vim-easy-align' " Alignment plugin
Plug 'junegunn/vim-peekaboo'   " Extends \"
Plug 'Yggdroot/indentLine'     " Line that show indentation
Plug 'airblade/vim-rooter'     " Change working directory
Plug 'tpope/vim-speeddating'   " increment/decrementing
Plug 'tpope/vim-repeat'        " repeat any command
" }}}

" Search & replace {{{
" Plug 'wincent/ferret'
" }}}

" Syntax stuff and autocomplete {{{
Plug 'othree/yajs.vim'
Plug 'vim-scripts/SyntaxComplete'
" Plug 'liuchengxu/vista.vim'                           " Symbols in tree view
" }}}

" flutter set up {{{
Plug 'dart-lang/dart-vim-plugin' " Dart support
Plug 'natebosch/vim-lsc'         " Dart support
Plug 'natebosch/vim-lsc-dart'    " Dart support
" }}}

" File exploring {{{
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                          " NERDTree syntax highlighing
Plug 'francoiscabrol/ranger.vim'                                        " Best file explorer
Plug 'rbgrouleff/bclose.vim'                                            " Close buffer without messing the layout
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }       " Fuzzy finder base
Plug 'junegunn/fzf.vim'                                                 " Fuzzy finder for EVERYTHING
" Plug 'liuchengxu/vim-clap', { 'do': function('clap#helper#build_all') } " Another fuzzy finder
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" }}}

" Snippets {{{
Plug 'mattn/emmet-vim'    " Snippet thingy
Plug 'SirVer/ultisnips'   " Snippet thingy
Plug 'honza/vim-snippets' " Snippet thingy
" }}}

" Typescript & Javascript {{{
" Plug 'janko/vim-test'
Plug 'moll/vim-node'                " Node tools and environment for vim
Plug 'HerringtonDarkholme/yats.vim' " Typescript syntax highlighting
Plug 'pangloss/vim-javascript'      " Javascript syntax support
Plug 'mxw/vim-jsx'                  " React jsx syntax support
Plug 'heavenshell/vim-jsdoc'        " Javascript docs
" }}}

" status line stuff {{{
"Plug 'mike-hearn/base16-vim-lightline' " Themes for the Simpler fancy status line
"Plug 'itchyny/lightline.vim'           " Simpler fancy status line
Plug 'vim-airline/vim-airline'         " Fancy status line
Plug 'vim-airline/vim-airline-themes'  " Themes for the fancy status line
" }}}

" notes {{{
Plug 'vimwiki/vimwiki' " Note taking
" }}}

" Git Stuff {{{
Plug 'tpope/vim-fugitive'                             " Best git plugin for vim
" Plug 'junegunn/vim-github-dashboard'                  " Github dashboard
" Plug 'sodapopcan/vim-twiggy'
" }}}

call plug#end()
