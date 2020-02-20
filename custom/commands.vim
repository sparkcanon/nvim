" CUSTOM FUNCTIONS {{{
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
  execute 'grep '.word
endfunction
" }}}

" Grep without minibuffer
command! -nargs=+ -bar -complete=file Grep silent! grep! <args>|cwindow|redraw!
" Grep word under cursor
command! -nargs=* -bar -complete=file GrepCursorWord :execute 'Grep '.expand('<cword>')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" session load
command! -nargs=0 Sload :call CocAction('runCommand', 'session.load')
" session save
command! -nargs=0 Ssave :call CocAction('runCommand', 'session.save')
" chunk undo
command! -nargs=0 GchunkdUndo :call CocAction('runCommand', 'git.chunkUndo')
" Run jest on current file
command! -nargs=0 JestSingleFile :call  CocAction('runCommand', 'jest.fileTest', ['%'])
" find files using vim-find-files
command! -nargs=+ -bang -complete=dir Files :call find_files#execute(<q-args>, 'qf', <bang>0)

" DiffRev {{{
let s:git_status_dictionary = {
      \ "A": "Added",
      \ "B": "Broken",
      \ "C": "Copied",
      \ "D": "Deleted",
      \ "M": "Modified",
      \ "R": "Renamed",
      \ "T": "Changed",
      \ "U": "Unmerged",
      \ "X": "Unknown"
      \ }
function! s:get_diff_files(rev)
  let list = map(split(system(
	\ 'git diff --name-status '.a:rev), '\n'),
	\ '{"filename":matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
	\ )
  call setqflist(list)
  copen
endfunction

command! -nargs=1 DiffRev call s:get_diff_files(<q-args>)
" }}}
