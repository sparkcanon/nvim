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
Plug 'rakr/vim-one'
Plug 'flazz/vim-colorschemes'                                     " Collection of themes
Plug 'chriskempson/base16-vim'                                    " Collection of base16 themes
Plug 'Rigellute/rigel'
Plug 'drewtempelmeyer/palenight.vim'
" }}}

" UTILITIES {{{
Plug 'tpope/vim-sensible'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'                                          " Saving current session
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
" }}}

" SYNTAX STUFF & COMPLETETIONS {{{
Plug 'othree/yajs.vim'
Plug 'vim-scripts/SyntaxComplete'
Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " Best autocomplete engine ever
" }}}

" FLUTTER {{{
Plug 'dart-lang/dart-vim-plugin'                                  " Dart support
Plug 'natebosch/vim-lsc'                                          " Dart support
Plug 'natebosch/vim-lsc-dart'                                     " Dart support
" }}}

" FILE EXPLORING {{{
Plug 'francoiscabrol/ranger.vim'                                  " Best file explorer
Plug 'rbgrouleff/bclose.vim'                                      " Close buffer without messing the layout
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder base
Plug 'junegunn/fzf.vim'                                           " Fuzzy finder for EVERYTHING
" }}}

" SNIPPETS {{{
Plug 'mattn/emmet-vim'                                            " Snippet thingy
Plug 'honza/vim-snippets'                                         " Snippet thingy
Plug 'grvcoelho/vim-javascript-snippets'                          " Javascript snippet
" }}}

" TYPESCRIPT & JAVASCRIPT {{{
Plug 'moll/vim-node'                                              " Node tools and environment for vim
Plug 'HerringtonDarkholme/yats.vim'                               " Typescript syntax highlighting
Plug 'pangloss/vim-javascript'                                    " Javascript syntax support
Plug 'mxw/vim-jsx'                                                " React jsx syntax support
Plug 'heavenshell/vim-jsdoc'                                      " Javascript docs
" }}}

" STATUS LINE {{{
Plug 'mike-hearn/base16-vim-lightline'                            " Themes for the Simpler fancy status line
Plug 'itchyny/lightline.vim'                                      " Simpler fancy status line
" }}}

" NOTES {{{
Plug 'vimwiki/vimwiki'                                            " Note taking
" }}}

" GIT STUFF {{{
Plug 'tpope/vim-fugitive'                                         " Best git plugin for vim
Plug 'sodapopcan/vim-twiggy'                                      " Another git client
" }}}

" EXTRA {{{
" Plug 'vim-airline/vim-airline'         " Fancy status line
" Plug 'vim-airline/vim-airline-themes'  " Themes for the fancy status line
" }}}

call plug#end()
