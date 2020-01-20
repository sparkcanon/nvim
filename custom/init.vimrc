" Install vim plug if not already present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" THEMES {{{
Plug 'flazz/vim-colorschemes'                                              " one colorscheme pack to rule them all!
" }}}

" UTILITIES {{{
Plug 'tpope/vim-sensible'                                                  " Defaults everyone can agree on
Plug 'simnalamburt/vim-mundo', { 'on' : 'MundoToggle' }
Plug 'junegunn/vim-slash'                                                  " Remove highlight
Plug 'junegunn/vim-peekaboo'                                               " 👀 \" / @ / CTRL-R
Plug 'Yggdroot/indentLine'                                                 " Line that show indentation
Plug 'airblade/vim-rooter'                                                 " Changes Vim working directory to project root
Plug 'tpope/vim-repeat'                                                    " repeat any command
Plug 'shime/vim-livedown', { 'on': 'LivedownPreview' }                     " Live markdown server
Plug 'tpope/vim-surround'                                                  " quoting/parenthesizing made simple
Plug 'tpope/vim-commentary'                                                " comment stuff out
Plug 'godlygeek/tabular'                                                   " 🌻 A Vim alignment plugin
Plug 'vim-scripts/VisIncr'                                                 " Increasing/decreasing columns of numbers
Plug 'ciaranm/detectindent'                                                " Vim script for automatically detecting indent settings
Plug 'takac/vim-hardtime'                                                  " Plugin to help you stop repeating the basic movement keys
Plug 'simeji/winresizer'                                                   " Quickly resize splits/windows
Plug 'tpope/vim-abolish'
" }}}

" SHELL {{{
Plug 'tpope/vim-eunuch'                                                    " Helpers for UNIX
Plug 'tpope/vim-dispatch'                                                  " Asynchronous build and test dispatcher
" }}}

" SYNTAX STUFF & COMPLETETIONS {{{
Plug 'othree/yajs.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}                            " Coc is an intellisense engine for Vim/Neovim
" }}}

" FLUTTER {{{
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }                        " Dart support
Plug 'natebosch/vim-lsc', { 'for': 'dart' }                                " Dart support
Plug 'natebosch/vim-lsc-dart', { 'for': 'dart' }                           " Dart support
" }}}

" FILE EXPLORING {{{
Plug 'justinmk/vim-dirvish'                                                " Directory viewer for Vim ⚡️
Plug 'kristijanhusak/vim-dirvish-git'                                      " Git support for dirvish.vim
" }}}

" SNIPPETS {{{
Plug 'honza/vim-snippets'                                                  " Snippet thingy
Plug 'grvcoelho/vim-javascript-snippets'                                   " Javascript snippet
" }}}

" TYPESCRIPT & JAVASCRIPT {{{
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }               " Typescript syntax highlighting
Plug 'mxw/vim-jsx', { 'for': 'javascript' }                                " React jsx syntax support
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }                      " Javascript docs
" }}}

" STATUS LINE {{{
Plug 'itchyny/lightline.vim'                                               " A light and configurable statusline/tabline plugin for Vim
" }}}

" GIT STUFF {{{
Plug 'tpope/vim-fugitive'                                                  " Best git plugin for vim
Plug 'tpope/vim-rhubarb'                                                   " GitHub extension for fugitive.vim
Plug 'mhinz/vim-signify'                                                   " ➕ Show a diff using Vim its sign column.
" }}}

" EXTRA {{{
" Plug 'sheerun/vim-polyglot'                                              " A collection of language packs for Vim
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }        " Fuzzy finder base
" Plug 'junegunn/fzf.vim'                                                  " Fuzzy finder for EVERYTHING
" Plug 'lifepillar/vim-gruvbox8'                                           " A simplified and optimized Gruvbox colorscheme for Vim
" }}}

call plug#end()
