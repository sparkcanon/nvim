" Purpose: General purpose utilities

" Visual {{{
" Get visual section
function! utils#getVisualSelection() abort
	let l=getline("'<")
	let [line1,col1] = getpos("'<")[1:2]
	let [line2,col2] = getpos("'>")[1:2]
	return l[col1 - 1: col2 - 1]
endfunction
" }}}

" Desc: Custom abbrs {{{
function! utils#setupCommandAbbrs(from, to) abort
	exec 'cnoreabbrev <expr> '.a:from
				\ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
				\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
" }}}

" Desc: Create new dir if it doesnt exist {{{
function! utils#mkdir(path) abort
  if !isdirectory(a:path)
    let b:path = a:path
    autocmd MkdirAutocmd BufWritePre <buffer>
      \ call mkdir(b:path, 'p')
      \ | unlet b:path
      \ | autocmd! MkdirAutocmd  * <buffer>
  endif
endfunction
" }}}

" vim:foldmethod=marker
