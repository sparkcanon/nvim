" Colors {{{
" Make buffer transparent
function! functions#modifyBufferColors() abort
	highlight! Normal guibg=NONE
	highlight! EndOfBuffer guibg=NONE
	highlight! VertSplit guibg=NONE ctermbg=NONE
endfunction

" Coc signs color mods
function! functions#modifyCocSignColors() abort
	highlight CocErrorSign guibg=NONE guifg=#ff0000 ctermbg=NONE
	highlight CocWarningSign guibg=NONE guifg=#ff922b ctermbg=NONE
	highlight CocInfoSign guibg=NONE guifg=#fab005 ctermbg=NONE
	highlight CocHintSign guibg=NONE guifg=#15aabf ctermbg=NONE
endfunction

" Signify color mods
function! functions#modifyCocGitColors() abort
	highlight CocAddSign guifg=green guibg=NONE ctermbg=NONE
	highlight CocDeleteSign guifg=#ff0000  guibg=NONE ctermbg=NONE
	highlight CocChangeSign guifg=#fab005 guibg=NONE ctermbg=NONE
	highlight CocChangeRemovedSign guifg=#fab005 guibg=NONE ctermbg=NONE
	highlight CocTopRemovedSign guifg=#ff0000 guibg=NONE ctermbg=NONE
endfunction
" }}}

" Section: Perform the search {{{
" Source: https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3#gistcomment-3114427
function! functions#grep(...) abort
	return system(join(extend([&grepprg], a:000), ' '))
endfunction
" }}}

" Visual {{{
" Get visual section
function! functions#getVisualSelection() abort
	let l=getline("'<")
	let [line1,col1] = getpos("'<")[1:2]
	let [line2,col2] = getpos("'>")[1:2]
	return l[col1 - 1: col2 - 1]
endfunction
" }}}

" Abbrs {{{
function! functions#setupCommandAbbrs(from, to) abort
	exec 'cnoreabbrev <expr> '.a:from
				\ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
				\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
" }}}

" Section: Long fnames in statusline {{{
function! functions#ShortenFname() abort
	let fname = expand("%f")
	let fnameList = len(split(fname, '/')) > 4
	return fnameList ? pathshorten(fname) : fname
endfunction
" }}}

" Section: Loc list error count {{{
function! functions#locListErrorCount() abort
	let l:locList = len(getloclist(winnr())) == 0 ? '' : 'LE: ' . len(getloclist(winnr())) . ' '
	let l:qfList = len(getqflist()) == 0 ? '' : 'QE: ' . len(getqflist())
	let l:status = l:locList . l:qfList
	return l:status
endfunction
" }}}
