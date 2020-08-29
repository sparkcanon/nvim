" Purpose: Colors

" Desc: Make buffer transparent {{{
function! colors#modifyBufferColors() abort
	highlight! Normal guibg=NONE
	highlight! EndOfBuffer guibg=NONE
	highlight! VertSplit guibg=NONE ctermbg=NONE
endfunction
" }}}

" Desc: Coc signs color mods {{{
function! colors#modifyCocSignColors() abort
	highlight CocErrorSign guibg=NONE guifg=#ff0000 ctermbg=NONE
	highlight CocWarningSign guibg=NONE guifg=#ff922b ctermbg=NONE
	highlight CocInfoSign guibg=NONE guifg=#fab005 ctermbg=NONE
	highlight CocHintSign guibg=NONE guifg=#15aabf ctermbg=NONE
endfunction
" }}}

" Desc: Signify color mods {{{
function! colors#modifyCocGitColors() abort
	highlight CocAddSign guifg=green guibg=NONE ctermbg=NONE
	highlight CocDeleteSign guifg=#ff0000  guibg=NONE ctermbg=NONE
	highlight CocChangeSign guifg=#fab005 guibg=NONE ctermbg=NONE
	highlight CocChangeRemovedSign guifg=#fab005 guibg=NONE ctermbg=NONE
	highlight CocTopRemovedSign guifg=#ff0000 guibg=NONE ctermbg=NONE
endfunction
" }}}

" vim:foldmethod=marker
