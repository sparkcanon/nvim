" Purpose: Grep

" Desc: Perform the search {{{
" Source: https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3#gistcomment-3114427
function! grep#grep(...) abort
	return system(join(extend([&grepprg], a:000), ' '))
endfunction
" }}}

" Desc: Grep based on type {{{
function! grep#any(type, arg) abort
	if a:type == 'exact'
		let l:query = '"\b( ' . a:arg . ')\b"'
	endif
	if a:type == 'exclude'
		let l:query = '"\b( ' . a:arg . ')\b" -g !"{*spec.*,*test.*}"'
	endif
	if a:type == 'buffer'
		let l:query = a:arg . ' ' . expand('%')
	endif
	if a:type == 'any'
		let l:query = a:arg
	endif
	cgetexpr grep#grep(l:query)
endfunction
" }}}

" vim:foldmethod=marker
