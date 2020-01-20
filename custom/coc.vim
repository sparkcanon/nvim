" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation() abort
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
augroup HighlightSymOnCursor
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-s> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings {{{

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [p <Plug>(coc-diagnostic-prev)
nmap <silent> ]p <Plug>(coc-diagnostic-next)

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nnoremap <silent> K :call <SID>show_documentation()<CR>

" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...) abort
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <space>fS :exe 'CocList -I --normal --input='.expand('<cword>').' grep'<CR>

vnoremap <space>fS :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
" nnoremap <leader>fq :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

function! s:GrepFromSelected(type) abort
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction

" }}}

" Installs all the below plugins on fresh neovim install as the coc server
" starts
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
      \     'coc-yank',
      \     'coc-lists',
      \     'coc-styled-components',
      \     'coc-stylelint',
      \     'coc-flutter',
      \     'coc-tslint',
      \     'coc-json',
      \     'coc-tsserver',
      \     'coc-html',
      \     'coc-css',
      \     'coc-tslint-plugin',
      \     'coc-import-cost',
      \     ]
