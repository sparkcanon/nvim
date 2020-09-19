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

" Desc: Current project check {{{
function! utils#isProject(match) abort
	let l:cmd = [ 'git', 'rev-parse', '--show-toplevel' ]
	let l:git_match = system(l:cmd)[:-2]

	if fnamemodify(l:git_match, ':p:h:t') =~ a:match
		return 1
	else
		return 0
	endif

endfunction
" }}}

" vim:foldmethod=marker
