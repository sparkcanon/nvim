if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" MOVEMENT {{{
Plug 'easymotion/vim-easymotion'                                  " Quickly move throughout the buffer
Plug 'haya14busa/incsearch.vim'                                   " In buffer search on steroids - fuzzy
Plug 'haya14busa/incsearch-fuzzy.vim'                             " In buffer search on steroids - fuzzy
Plug 'simeji/winresizer'                                          " Quickly resize splits/windows
" }}}

" THEMES {{{
Plug 'flazz/vim-colorschemes'                                     " one colorscheme pack to rule them all! 
" }}}

" UTILITIES {{{
Plug 'tpope/vim-sensible'
Plug 'simnalamburt/vim-mundo'
Plug 'moll/vim-bbye'
Plug 'junegunn/vim-slash'                                         " Remove highlight
Plug 'junegunn/vim-easy-align'                                    " Alignment plugin
Plug 'junegunn/vim-peekaboo'                                      " Extends \"
Plug 'Yggdroot/indentLine'                                        " Line that show indentation
Plug 'airblade/vim-rooter'                                        " Change working directory
Plug 'tpope/vim-speeddating'                                      " increment/decrementing
Plug 'tpope/vim-repeat'                                           " repeat any command
Plug 'shime/vim-livedown'                                         " Live markdown server
Plug 'tpope/vim-surround'                                         " Add quotes & stuff around words/sentences
Plug 'tpope/vim-commentary'                                       " smart comments
Plug 'jiangmiao/auto-pairs'
Plug 'markonm/traces.vim'                                         " Highlights during substitution
Plug 'tpope/vim-eunuch'                                           " Helpers for UNIX
" }}}

" SYNTAX STUFF & COMPLETETIONS {{{
Plug 'othree/yajs.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " Coc is an intellisense engine for Vim/Neovim
" }}}

" FLUTTER {{{
Plug 'dart-lang/dart-vim-plugin'                                  " Dart support
Plug 'natebosch/vim-lsc'                                          " Dart support
Plug 'natebosch/vim-lsc-dart'                                     " Dart support
" }}}

" FILE EXPLORING {{{
Plug 'justinmk/vim-dirvish'                                       " Directory viewer for Vim ⚡️
Plug 'kristijanhusak/vim-dirvish-git'                             " Git support for dirvish.vim 
" }}}

" SNIPPETS {{{
Plug 'honza/vim-snippets'                                         " Snippet thingy
Plug 'grvcoelho/vim-javascript-snippets'                          " Javascript snippet
" }}}

" TYPESCRIPT & JAVASCRIPT {{{
Plug 'moll/vim-node'                                              " Node tools and environment for vim
Plug 'HerringtonDarkholme/yats.vim'                               " Typescript syntax highlighting
Plug 'mxw/vim-jsx'                                                " React jsx syntax support
Plug 'heavenshell/vim-jsdoc'                                      " Javascript docs
" }}}

" STATUS LINE {{{
Plug 'itchyny/lightline.vim'                                      " Simpler fancy status line
" }}}

" GIT STUFF {{{
Plug 'tpope/vim-fugitive'                                         " Best git plugin for vim
Plug 'mhinz/vim-signify'
" }}}

" EXTRA {{{
" Plug 'sheerun/vim-polyglot'                                       " A collection of language packs for Vim
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder base
" Plug 'junegunn/fzf.vim'                                           " Fuzzy finder for EVERYTHING
" Plug 'godlygeek/tabular'
" Plug 'lifepillar/vim-gruvbox8'                                    " A simplified and optimized Gruvbox colorscheme for Vim 
" }}}

call plug#end()
