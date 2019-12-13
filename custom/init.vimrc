call plug#begin('~/.vim/plugged')

" Movement {{{
Plug 'easymotion/vim-easymotion'                      " Quickly move throughout the buffer
Plug 'haya14busa/incsearch.vim'                       " In buffer search on steroids - fuzzy
" Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'                 " In buffer search on steroids - fuzzy
Plug 'simeji/winresizer'                              " Quickly resize splits/windows
" }}}

" Completetions {{{
Plug 'tpope/vim-surround'                             " Add quotes & stuff around words/sentences
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-dispatch'
" Plug 'neomake/neomake'
Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Best autocomplete engine ever
" Plug 'ervandew/supertab'
Plug 'w0rp/ale'                                       " Errors and stuff
Plug 'jiangmiao/auto-pairs'
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
Plug 'xolox/vim-session'                              " Saving current session
Plug 'scrooloose/nerdtree'                            " Tree based file explorer
" Plug 'mhinz/vim-startify'                           " Start screen
Plug 'simnalamburt/vim-mundo'
Plug 'moll/vim-bbye'
Plug 'bfredl/nvim-miniyank'
Plug 'romainl/vim-cool'
" Plug 'roman/golden-ratio'
" }}}

" Search & replace {{{
" Plug 'wincent/ferret'
" }}}

" Syntax stuff and autocomplete {{{
Plug 'othree/yajs.vim'
Plug 'vim-scripts/SyntaxComplete'
Plug 'liuchengxu/vista.vim'                           " Symbols in tree view
" }}}

" flutter set up {{{
Plug 'dart-lang/dart-vim-plugin'                      " Dart support
Plug 'natebosch/vim-lsc'                              " Dart support
Plug 'natebosch/vim-lsc-dart'                         " Dart support
" }}}

" File exploring {{{
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'francoiscabrol/ranger.vim'                      " Best file explorer
Plug 'rbgrouleff/bclose.vim'                          " Close buffer without messing the layout
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                               " Fuzzy finder for EVERYTHING
" }}}

" Snippets {{{
Plug 'mattn/emmet-vim'                                " Snippet thingy
Plug 'SirVer/ultisnips'                               " Snippet thingy
Plug 'honza/vim-snippets'                             " Snippet thingy
" }}}

" Typescript & Javascript {{{
" Plug 'janko/vim-test'
Plug 'moll/vim-node'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'                        " Javascript syntax support
Plug 'mxw/vim-jsx'                                    " React jsx syntax support
Plug 'heavenshell/vim-jsdoc'                          " Javascript docs
" }}}

" status line stuff {{{
" Plug 'mike-hearn/base16-vim-lightline'              " Themes for the Simpler fancy status line
" Plug 'itchyny/lightline.vim'                        " Simpler fancy status line
Plug 'vim-airline/vim-airline'                        " Fancy status line
Plug 'vim-airline/vim-airline-themes'                 " Themes for the fancy status line
" }}}

" notes {{{
Plug 'vimwiki/vimwiki'                                " Note taking
" }}}

" Git Stuff {{{
Plug 'tpope/vim-fugitive'                             " Best git plugin for vim
" Plug 'sodapopcan/vim-twiggy'
" }}}

call plug#end()
