" TWIGGY {{{
let g:twiggy_group_locals_by_slash = 0
let g:twiggy_local_branch_sort = 'mru'
let g:twiggy_remote_branch_sort = 'date'
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

" RANGER.VIM {{{
let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
" }}}

" ALE STUFF {{{
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\}
let g:ale_linters = {
\    'javascript': ['eslint'],
\    'javascript.jsx': ['eslint']
\}

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_eslint_use_local_config = 1
let g:ale_sign_error = '●'
" }}}

" let g:projectionist_heuristics = {
"       \   'src/*': {
"       \     '*.js': {
"       \       'alternate': [
"       \         '{dirname}/{basename}.test.js',
"       \         '{dirname}/__tests__/{basename}.test.js',
"       \       ],
"       \       'type': 'source'
"       \     },
"       \     '*.test.js': {
"       \       'alternate': [
"       \         '{dirname}/{basename}.js',
"       \         '{dirname}/../{basename}.js'
"       \       ],
"       \       'type': 'test',
"       \     },
"       \     '**/__tests__/*-mocha.js': {
"       \       'alternate': '{dirname}/{basename}.js',
"       \       'type': 'test'
"       \     },
"       \     '**/__tests__/*-test.js': {
"       \       'alternate': '{dirname}/{basename}.js',
"       \       'type': 'test'
"       \     }
"       \   }
"       \ }

au FileType elixir let b:AutoPairs = AutoPairsDefine({'do': 'end//n'})

let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
let g:neomake_open_list = 1
let g:test#strategy = 'neomake'
let g:neomake_warning_sign = {
  \   'text': '◉'
  \ }

let g:neomake_error_sign = {
  \   'text': '◉'
  \ }

" autocmd QuickFixCmdPost [^l]* cwindow
" autocmd QuickFixCmdPost l* lwindow

let g:livedown_autorun = 0
" Open the browser window upon previewing
let g:livedown_open = 1
let g:livedown_port = 1337

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
" let g:indentLine_concealcursor = 'inc'
" let g:indentLine_conceallevel = 2
let g:indentLine_setConceal = 0
" }}}

" EMMET {{{
let g:user_emmet_settings = {
  \ 'javascript.jsx': {
    \ 'extends': 'jsx',
  \}
\}
let g:user_emmet_mode='inv'
" }}}

" NERDTREE {{{
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " enable folder glyph flag
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
" }}}

" NEOMAKE {{{
" Show message that tests have started
function! MyOnNeomakeJobStarted() abort
  echom printf('🔮 Running tests...')
endfunction

" Show message when all tests are passing
function! MyOnNeomakeJobFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code == 0
    echom printf('🧙 All tests passed ')
  endif
  if context.jobinfo.exit_code == 1
    echom printf('🤬 Failing tests')
  endif
endfunction

augroup my_neomake_hooks
  au!
  autocmd User NeomakeJobFinished call MyOnNeomakeJobFinished()
  autocmd User NeomakeJobStarted call MyOnNeomakeJobStarted()
augroup END
" }}}


" AIRLINE {{{
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" }}}

" SESSIONS {{{
let g:session_autosave = 'no'

" SESSION MANAGEMENT {{{
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
" }}}

" LEADERF {{{
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
" }}}
