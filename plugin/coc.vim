" AU {{{
augroup CocAu
	autocmd!
augroup END

" Highlight references on cursorhold
autocmd CocAu CursorHold * silent call CocActionAsync('highlight')
" Setup formatexpr specified filetype(s).
autocmd CocAu FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder
autocmd CocAu User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" }}}

" Functions {{{
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation() abort
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}

" Mappings {{{
" Search workspace for word
nnoremap <silent> <space>cs :<C-u>CocSearch <C-R><C-W><CR>
" Search workspace for word
xnoremap <script> <space>cs <Esc>:CocSearch <C-R><C-R>=<SID>get_visual_selection()<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [p <Plug>(coc-diagnostic-prev)
nmap <silent> ]p <Plug>(coc-diagnostic-next)

" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" }}}

" G: CODE RELATED {{{
nmap <silent> ,j <Plug>(coc-definition)
nmap <silent> ,t <Plug>(coc-type-definition)
nmap <silent> ,i <Plug>(coc-implementation)
nmap <silent> ,r <Plug>(coc-references)
" }}}

" Commands: {{{
command! -nargs=? Find execute 'CocList files'
command! -nargs=? CList execute 'CocList'
command! -nargs=? Rg execute 'CocList grep'
command! -nargs=? SessLoad execute 'CocList sessions'
command! -nargs=0 Cdiag execute 'CocDiagnostics'
command! -nargs=0 CRename call CocActionAsync('rename')
command! -nargs=0 CFix call CocActionAsync('doQuickfix')
command! -nargs=0 CFormat call CocActionAsync('format')
command! -nargs=0 CAction execute 'CocAction'
" }}}

" Extensions {{{
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
      \     'coc-fish'
      \     ]
" }}}
