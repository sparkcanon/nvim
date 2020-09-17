" Purpose: Format prg

" Desc: Set format options {{{
function! format#formatprg() abort

	if findfile('prettier', 'node_modules/.bin/') == 'node_modules/.bin/prettier'
		let l:fmt_prettier = 'node_modules/.bin/prettier'
	elseif executable('prettier')
		let l:fmt_prettier = 'prettier'
	endif

	let &l:formatprg = l:fmt_prettier . " --stdin-filepath %"
	setlocal formatexpr=
	nnoremap gQ mlgggqG'l :delm l<CR>

endfunction
" }}}

" vim:foldmethod=marker
