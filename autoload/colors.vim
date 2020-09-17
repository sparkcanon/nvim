" Purpose: Colors

" Desc: Make buffer transparent {{{
function! colors#modifyBufferColors() abort
	highlight! EndOfBuffer ctermbg=NONE ctermfg=241 guibg=NONE
	highlight! VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
	highlight! link HighlightedyankRegion Visual
	
	" Hint: This below makes the background transparent
	" highlight! Normal guibg=NONE
endfunction
" }}}

" Desc: Coc signs color mods {{{
function! colors#modifyCocSignColors() abort
	highlight link CocErrorSign SyntasticErrorSign
	highlight link CocWarningSign SyntasticWarningSign
	highlight CocInfoSign guibg=NONE guifg=#fab005 ctermbg=NONE
	highlight CocHintSign guibg=NONE guifg=#15aabf ctermbg=NONE
endfunction
" }}}

" Desc: Signify color mods {{{
function! colors#modifyCocGitColors() abort
	highlight link CocAddSign SignifySignAdd
	highlight link CocDeleteSign SignifySignDelete
	highlight link CocChangeSign SignifySignChange
	highlight link CocChangeRemovedSign SignifySignDelete
	highlight link CocTopRemovedSign SignifySignDelete
endfunction
" }}}

" vim:foldmethod=marker
