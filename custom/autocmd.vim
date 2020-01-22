augroup GeneralSettings
	autocmd!
augroup END

" \ | highlight SignColumn guibg=clear-background
" \ | highlight cursorline guibg=#333333
au GeneralSettings ColorScheme * highlight SignifySignAdd    ctermfg=green  guifg=green cterm=NONE gui=NONE
	\ | highlight SignifySignDelete ctermfg=red    guifg=red cterm=NONE gui=NONE
	\ | highlight SignifySignChange ctermfg=yellow guifg=yellow cterm=NONE gui=NONE
	\ | highlight! CocErrorSign guibg=NONE guifg=#ff0000
	\ | highlight! CocWarningSign guibg=NONE guifg=#ff922b
	\ | highlight! CocInfoSign guibg=NONE guifg=#fab005
	\ | highlight! CocHintSign guibg=NONE guifg=#15aabf

" Update a buffer's contents on focus if it changed outside of Vim. {{{
au GeneralSettings FocusGained,BufEnter * :checktime
" }}}

" TERMINAL {{{
au GeneralSettings TermOpen * startinsert
au GeneralSettings BufEnter term://* startinsert
au GeneralSettings BufLeave term://* stopinsert
" }}}

" RESIZE {{{
" Auto-resize splits when Vim gets resized.
au GeneralSettings VimResized * wincmd =
" }}}

" Reduce delay when switching between modes. {{{
au GeneralSettings InsertEnter * set ttimeoutlen=0
au GeneralSettings InsertLeave * set ttimeoutlen=50
" }}}
