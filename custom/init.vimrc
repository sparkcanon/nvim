call plug#begin('~/.vim/plugged')

" Completetions {{{
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-dispatch'
" Plug 'neomake/neomake'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ervandew/supertab'
" Plug 'Shougo/echodoc.vim'
" }}}

" Themes {{{
Plug 'rakr/vim-one'
Plug 'tpope/vim-sensible'
Plug 'shime/vim-livedown'
Plug 'flazz/vim-colorschemes'
Plug 'jaredgorski/spacecamp'
Plug 'chriskempson/base16-vim'
" }}}

" Utilities {{{
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
" }}}

" Syntax stuff and autocomplete {{{
Plug 'othree/yajs.vim'
Plug 'moll/vim-node'
Plug 'vim-scripts/SyntaxComplete'
" Plug 'janko/vim-test'
Plug 'dart-lang/dart-vim-plugin'
" Plug 'thosakwe/vim-flutter'
" }}}

" File exploring {{{
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'romainl/vim-qf'
" }}}

" Typescript {{{
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'Quramy/tsuquyomi'
" }}}

" Airline and style stuff {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'roman/golden-ratio'
" }}}

" Git Stuff {{{
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
" Plug 'yuttie/comfortable-motion.vim'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'
" }}}

call plug#end()
