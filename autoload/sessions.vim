" Purpose: Session based logic

" Desc: Save session {{{
function! sessions#sessionSave() abort
	if finddir('.git', '.;') == ".git"
		let l:root = substitute(fnamemodify(getcwd(0), ':t'), '^\.', '', '')
		execute 'mks! $HOME/.vim/tmp/dir_session/' . l:root . '.vim'
	endif
endfunction
" }}}

" Desc: Complete path for save command {{{
function! sessions#sessionCompletePath(A,L,P) abort
	return system("fd . --base-directory /Users/praborde/.vim/tmp/dir_session/")
endfunction
" }}}

" vim:foldmethod=marker
