" Purpose: Colors

" Desc: Make buffer transparent {{{
function! colors#modifyBufferColors() abort
	highlight! EndOfBuffer ctermbg=NONE ctermfg=241 guibg=NONE
	highlight! VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
	highlight! link HighlightedyankRegion Visual
	highlight! LineNr ctermbg=NONE guibg=NONE

	highlight! link LspDiagnosticsError ALEVirtualTextError   
	highlight! LspDiagnosticsHint guifg=#8389a3 
	highlight! LspDiagnosticsInformation guifg=#3f83a6
	highlight! link LspDiagnosticsWarning ALEVirtualTextWarning    
	
	" Hint: This below makes the background transparent
	" highlight! Normal guibg=NONE
endfunction
" }}}

" vim:foldmethod=marker
