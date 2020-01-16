" TWIGGY {{{
let g:twiggy_num_columns = 40
let g:twiggy_group_locals_by_slash = 0
let g:twiggy_local_branch_sort = 'mru'
let g:twiggy_remote_branch_sort = 'date'
" }}}

" NETRW {{{
" let g:netrw_liststyle = 3
" let g:netrw_sort_sequence = '[\/]$,*'
let g:loaded_netrwPlugin = 1 " disable netrw
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

" UNDO VISUALIZER {{{
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo
" }}}

" VIM GREPPER {{{
let g:grepper={}
let g:grepper.tools=["rg"]
" }}}

" LIVEDOWN SERVER {{{
let g:livedown_autorun = 0
" Open the browser window upon previewing
let g:livedown_open = 1
let g:livedown_port = 1337
" }}}

" JAVASCRIPT {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_domhtmlcss = 1
let g:javascript_plugin_flow = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

let g:javascript_conceal_function                  = "ƒ"
let g:javascript_conceal_null                      = "ø"
let g:javascript_conceal_this                      = "@"
let g:javascript_conceal_return                    = "⇚"
let g:javascript_conceal_undefined                 = "¿"
let g:javascript_conceal_NaN                       = "ℕ"
let g:javascript_conceal_prototype                 = "¶"
let g:javascript_conceal_static                    = "•"
let g:javascript_conceal_super                     = "Ω"
let g:javascript_conceal_arrow_function            = "⇒"
" let g:javascript_conceal_noarg_arrow_function      = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"
" }}}

" INDENTLINE {{{
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_setConceal = 0
" }}}

au FileType elixir let b:AutoPairs = AutoPairsDefine({'do': 'end//n'})
" autocmd QuickFixCmdPost [^l]* cwindow
" autocmd QuickFixCmdPost l* lwindow
