call plug#begin('~/.vim/plugged')

" Movement {{{
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
" }}}

" Completetions {{{
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-dispatch'
" Plug 'neomake/neomake'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ervandew/supertab'
Plug 'w0rp/ale'
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
Plug 'xolox/vim-session'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'simnalamburt/vim-mundo'
Plug 'moll/vim-bbye'
Plug 'bfredl/nvim-miniyank'
" Plug 'roman/golden-ratio'
" }}}

" Search & replace {{{
Plug 'wincent/ferret'
" }}}

" Syntax stuff and autocomplete {{{
Plug 'othree/yajs.vim'
Plug 'vim-scripts/SyntaxComplete'
Plug 'liuchengxu/vista.vim'
" }}}

" flutter set up {{{
" Plug 'thosakwe/vim-flutter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
" }}}

" File exploring {{{
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

" Snippets {{{
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}

" Typescript & Javascript {{{
" Plug 'janko/vim-test'
Plug 'moll/vim-node'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'
" }}}

" status line stuff {{{
Plug 'mike-hearn/base16-vim-lightline'
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" }}}

" notes {{{
Plug 'vimwiki/vimwiki'
" }}}

" Git Stuff {{{
Plug 'codeindulgence/vim-tig'
Plug 'tpope/vim-fugitive'
" Plug 'jreybert/vimagit'
" }}}

call plug#end()
