" Purpose: General purpose utilities

" Desc: Perform the search {{{
" Source: https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3#gistcomment-3114427
function! utils#grep(...) abort
	return system(join(extend([&grepprg], a:000), ' '))
endfunction
" }}}

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
