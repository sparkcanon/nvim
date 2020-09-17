" Purpose: General purpose path setup using fd for various projects
" Author: Pratik Borde

" Desc: Fd job to set dirsPath {{{
function! path_job#setProjectPath() abort
	if utils#isProject('lego-web')
		let l:depth = '--exact-depth'
	else
		let l:depth = '--max-depth'
	endif

	let l:cmd = [ 'fd', '.',
				\ l:depth, '2',
				\ '-t', 'd',
				\ '-E', 'test/',
				\ '-E', 'bin/',
				\ '-E', 'eslint/',
				\ '-E', '__mocks__/',
				\ '-E', 'tests_utils/',
				\ '-E', 'bin/',
				\ '-E', 'eslint/',
				\ '-E', 'docs/',
				\ '-E', 'backstop_data/',
				\ '-E', 'pack/'
				\ ]
	let l:opt = {
				\ 'on_stdout': function('s:OnEvent'),
				\ 'on_stderr': function('s:OnEvent'),
				\ 'on_exit': function('s:OnEvent')
				\ }
	let l:jobStart = jobstart(l:cmd, l:opt)
endfunction
" }}}

" Desc: Handle paths from fd job {{{
let s:chunks = ['']
function! s:OnEvent(job_id, data, event) abort
	if a:event == 'stdout'
		let s:chunks[-1] .= a:data[0]
		call extend(s:chunks, a:data[1:])
		let &path = '.,,' . join(s:chunks, '/**,')
	endif
endfunction
" }}}

" vim:foldmethod=marker
