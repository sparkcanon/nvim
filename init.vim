" Dev set up for coc-git-stash {{{
" set runtimepath^=/Users/praborde/Documents/playground/n_vim/coc-git-stash
" }}}

" Clear all vimrc autocmds at the beginning
augroup VimPlug | execute 'autocmd!' | augroup END
augroup GeneralSettings | execute 'autocmd!' | augroup END

augroup VimPlug
  autocmd!
augroup end

" Install vim plug if not already present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimPlug VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('config') . '/plugged')

" THEMES {{{
" Plug 'romainl/Apprentice'                                        " A dark, low-contrast, Vim colorscheme
Plug 'arzg/vim-colors-xcode'                                       " Xcode 11’s dark and light colourschemes, now for Vim!
" }}}

" HIGHLIGHT {{{
Plug 'markonm/traces.vim'                                          " Range, pattern and substitute preview for Vim
Plug 'romainl/vim-cool'                                            " A very simple plugin that makes hlsearch more useful
" }}}

" UTILITIES {{{
Plug 'tpope/vim-sensible'                                          " Defaults everyone can agree on
Plug 'junegunn/vim-peekaboo'                                       " 👀 \" / @ / CTRL-R
Plug 'Yggdroot/indentLine'                                         " Line that show indentation
Plug 'tpope/vim-repeat'                                            " repeat any command
Plug 'tpope/vim-surround'                                          " quoting/parenthesizing made simple
Plug 'tpope/vim-commentary'                                        " comment stuff out
Plug 'godlygeek/tabular'                                           " 🌻 A Vim alignment plugin
Plug 'moll/vim-bbye'                                               " Delete buffers and close files in Vim
Plug 'ciaranm/detectindent'                                        " Vim script for automatically detecting indent settings
Plug 'romainl/vim-qf'                                              " Tame the quickfix window
Plug 'samoshkin/vim-find-files'                                    " 🔎 Search for files and show results in a quickfix list
" }}}

" TMUX {{{
Plug 'christoomey/vim-tmux-navigator'
" }}}

" SHELL {{{
Plug 'tpope/vim-eunuch'                                            " Helpers for UNIX
Plug 'tpope/vim-dispatch'                                          " Asynchronous build and test dispatcher
" }}}

" SYNTAX STUFF & COMPLETETIONS {{{
Plug 'sheerun/vim-polyglot'                                        " A solid language pack for Vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}                    " Coc is an intellisense engine for Vim/Neovim
" }}}

" FILE EXPLORING {{{
Plug 'justinmk/vim-dirvish'                                        " Directory viewer for Vim ⚡️
" }}}

" SNIPPETS {{{
Plug 'honza/vim-snippets'                                          " Snippet thingy
Plug 'grvcoelho/vim-javascript-snippets', { 'for': 'javascript' }  " 🔧 JavaScript & NodeJS Snippets for Vim
" }}}

" TYPESCRIPT & JAVASCRIPT {{{
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }              " Generate JSDoc to your JavaScript code
" }}}

" GIT STUFF {{{
Plug 'tpope/vim-fugitive'                                          " 💀 A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-rhubarb'                                           " GitHub extension for fugitive.vim
" }}}

call plug#end()

for s:path in split(glob('~/.config/nvim/custom/*.vim'), "\n")
  exe 'source ' . s:path
endfor
