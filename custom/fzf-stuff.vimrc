augroup fzf
  autocmd!
augroup END

"" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

" ripgrep command to search in multiple files
" autocmd fzf VimEnter * command! -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

" ripgrep - ignore the files defined in ignore files (.gitignore...) and doesn't ignore case
" autocmd fzf VimEnter * command! -nargs=* Rgic
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --fixed-strings --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

" ripgrep - ignore the files defined in ignore files (.gitignore...) and doesn't ignore case
" autocmd fzf VimEnter * command! -nargs=* Rgir
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

" ripgrep - ignore the files defined in ignore files (.gitignore...) and doesn't ignore case and activate regex search
" autocmd fzf VimEnter * command! -nargs=* Rgr
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --hidden --no-ignore --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

" ripgrep - ignore the files defined in ignore files (.gitignore...) Rgi
function! Fzf_find_func_rg(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--info=inline', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec, 'right:40%'), a:fullscreen)
endfunction

function! Fzf_example_standard_find(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--info=inline', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec, 'right:40%'), a:fullscreen)
endfunction

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}, 'right:40%'), <bang>0)
command! -nargs=* -bang Find call Fzf_find_func_rg(<q-args>, <bang>0)
command! -nargs=* -bang RRg call Fzf_example_standard_find(<q-args>, <bang>0)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' 
  \ }
