" Purpose: General purpose utilities

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

" Desc: Perform the search {{{
" Source: https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3#gistcomment-3114427
function! utils#grep(...) abort
	return system(join(extend([&grepprg], a:000), ' '))
endfunction
" }}}

" vim:foldmethod=marker
