augroup GeneralSettings
	autocmd!
augroup END

" \ | highlight SignifySignDelete ctermfg=red    guifg=red cterm=NONE gui=NONE
" \ | highlight SignifySignChange ctermfg=yellow guifg=yellow cterm=NONE gui=NONE
" \ | highlight SignColumn guibg=clear-background
" \ | highlight cursorline guibg=#333333
au GeneralSettings ColorScheme * highlight SignifySignAdd    ctermfg=green  guifg=green cterm=NONE gui=NONE
	\ | hi! CocErrorSign guibg=#252429 guifg=#ff0000
	\ | hi! CocWarningSign guibg=#252429 guifg=#ff922b
	\ | hi! CocInfoSign guibg=#252429 guifg=#fab005
	\ | hi! CocHintSign guibg=#252429 guifg=#15aabf

" Update a buffer's contents on focus if it changed outside of Vim. {{{
au GeneralSettings FocusGained,BufEnter * :checktime
" }}}

" TERMINAL {{{
au GeneralSettings TermOpen * startinsert
" }}}

" RESIZE {{{
" Auto-resize splits when Vim gets resized.
au GeneralSettings VimResized * wincmd =
" }}}

" Reduce delay when switching between modes. {{{
au GeneralSettings InsertEnter * set ttimeoutlen=0
au GeneralSettings InsertLeave * set ttimeoutlen=50
" }}}
