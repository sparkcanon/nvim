" FILE MANAGER {{{
" let g:netrw_liststyle = 3
" let g:netrw_sort_sequence = '[\/]$,*'
let g:loaded_netrwPlugin = 1 " disable netrw
" }}}

" FIND FILES {{{
let g:find_files_findprg = 'fd $*'
let g:find_files_command_name = ''
" }}}

" FUGITIVE {{{
let g:github_enterprise_urls = ['https://github.dev.global.tesco.org']
" }}}

" Dirvish {{{
let g:dirvish_mode = ':sort | sort ,^.*[^/]$, r'
" }}}

" PEEKABOO {{{
let g:peekaboo_window = "vert bo 40new"
" }}}

" DART SETUP {{{
let g:lsc_auto_map = v:true
" }}}

" JAVASCRIPT {{{
let g:javascript_plugin_jsdoc      = 1
let g:javascript_plugin_domhtmlcss = 1
let g:javascript_plugin_flow       = 1
" }}}

" INDENTLINE {{{
let g:indentLine_char_list     = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel  = 2
let g:indentLine_setConceal    = 0
" }}}

" COC {{{
let g:coc_global_extensions = [
      \     'coc-webpack',
      \     'coc-git',
      \     'coc-eslint',
      \     'coc-highlight',
      \     'coc-vimlsp',
      \     'coc-utils',
      \     'coc-jest',
      \     'coc-snippets',
      \     'coc-emoji',
      \     'coc-prettier',
      \     'coc-emmet',
      \     'coc-marketplace',
      \     'coc-diagnostic',
      \     'coc-pairs',
      \     'coc-gitignore',
      \     'coc-lists',
      \     'coc-styled-components',
      \     'coc-stylelint',
      \     'coc-flutter',
      \     'coc-json',
      \     'coc-tsserver',
      \     'coc-html',
      \     'coc-css',
      \     'coc-tslint-plugin',
      \     'coc-import-cost',
      \     ]
" }}}
