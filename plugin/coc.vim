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
nnoremap <silent> <leader>cs :<C-u>CocSearch <C-R><C-W><CR>
" Search workspace for word
xnoremap <script> <leader>cs <Esc>:CocSearch <C-R><C-R>=<SID>get_visual_selection()<CR>
" Do default action for next item.
nnoremap <silent> <leader>c[  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>c]  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>

" Remap for do codeAction of current line
nmap <silent> <leader>ca  <Plug>(coc-codeaction)

vmap <silent> <leader>ca  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>cA  <Plug>(coc-codeaction-selected)

" Fix autofix problem of current line
nmap <silent> <leader>cq  <Plug>(coc-fix-current)

" Remap for format selected region
vmap <silent> <leader>cf  <Plug>(coc-format-selected)
nmap <silent> <leader>cf  <Plug>(coc-format-selected)

nmap <silent> <leader>cR <Plug>(coc-rename)
nmap <leader>ci <Plug>(coc-diagnostic-info)

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
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
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
      \     'coc-import-cost',
      \     ]
" }}}
