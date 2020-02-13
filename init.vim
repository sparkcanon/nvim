" Dev set up for coc-git-stash {{{
" set runtimepath^=/Users/praborde/Documents/playground/n_vim/coc-git-stash
" }}}

" Install vim plug if not already present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('config') . '/plugged')

" THEMES {{{
Plug 'romainl/Apprentice'                  " A dark, low-contrast, Vim colorscheme
" }}}

" HIGHLIGHT {{{
Plug 'markonm/traces.vim'                  " Range, pattern and substitute preview for Vim
Plug 'romainl/vim-cool'                    " A very simple plugin that makes hlsearch more useful
" }}}

" UTILITIES {{{
Plug 'tpope/vim-sensible'                  " Defaults everyone can agree on
Plug 'simnalamburt/vim-mundo',
      \ { 'on' : 'MundoToggle' }
Plug 'junegunn/vim-peekaboo'               " 👀 \" / @ / CTRL-R
Plug 'Yggdroot/indentLine'                 " Line that show indentation
Plug 'tpope/vim-repeat'                    " repeat any command
Plug 'shime/vim-livedown',
      \ { 'for': 'markdown' }              " Live markdown server
Plug 'tpope/vim-surround'                  " quoting/parenthesizing made simple
Plug 'tpope/vim-commentary'                " comment stuff out
Plug 'godlygeek/tabular'                   " 🌻 A Vim alignment plugin
Plug 'tpope/vim-sleuth'                    " Vim script for automatically detecting indent settings
Plug 'takac/vim-hardtime'                  " Plugin to help you stop repeating the basic movement keys
Plug 'tpope/vim-abolish'                   " Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'moll/vim-bbye'                       " Delete buffers and close files in Vim
" }}}

" TMUX {{{
Plug 'tmux-plugins/vim-tmux-focus-events'  " Make terminal vim and tmux work better together.
Plug 'christoomey/vim-tmux-navigator'      " Seamless navigation between tmux panes and vim splits
" }}}

" SHELL {{{
Plug 'tpope/vim-eunuch'                    " Helpers for UNIX
Plug 'tpope/vim-dispatch'                  " Asynchronous build and test dispatcher
" }}}

" SYNTAX STUFF & COMPLETETIONS {{{
Plug 'sheerun/vim-polyglot'                " A solid language pack for Vim
Plug 'neoclide/coc.nvim',
      \ {'branch': 'release'}              " Coc is an intellisense engine for Vim/Neovim
" }}}

" FILE EXPLORING {{{
Plug 'justinmk/vim-dirvish'                " Directory viewer for Vim ⚡️
Plug 'kristijanhusak/vim-dirvish-git'      " Git support for dirvish.vim
" }}}

" SNIPPETS {{{
Plug 'honza/vim-snippets'                  " Snippet thingy
Plug 'grvcoelho/vim-javascript-snippets',
      \ { 'for': 'javascript' }            " Javascript snippet
" }}}

" TYPESCRIPT & JAVASCRIPT {{{
Plug 'heavenshell/vim-jsdoc',
      \ { 'for': 'javascript' }            " Javascript docs
" }}}

" GIT STUFF {{{
Plug 'tpope/vim-fugitive'                  " 💀 A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-rhubarb'                   " GitHub extension for fugitive.vim
Plug 'mhinz/vim-signify'                   " ➕ Show a diff using Vim its sign column.
" }}}

call plug#end()

for s:path in split(glob('~/.config/nvim/custom/*.vim'), "\n")
  exe 'source ' . s:path
endfor
