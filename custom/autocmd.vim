augroup GeneralSettings
	autocmd!
augroup END

" \ | highlight cursorline guibg=#333333
au GeneralSettings ColorScheme * call ModifyGeneralColors()
au GeneralSettings ColorScheme * call ModifyStatuslineColors()
au GeneralSettings ColorScheme * call ModifyTablineColors()
au GeneralSettings ColorScheme * call ModifyCocSignColors()
au GeneralSettings ColorScheme * call ModifySignifyColors()

" General color modifications
function! ModifyGeneralColors() abort
	highlight SignColumn guibg=NONE ctermbg=NONE
	highlight VertSplit guibg=NONE ctermbg=NONE
	highlight LineNr guibg=NONE ctermbg=NONE
endfunction

" Statusline color mods
function! ModifyStatuslineColors() abort
	highlight StatusLine guibg=NONE guifg=#00EA9E ctermbg=NONE
	highlight StatusLineNc guibg=NONE guifg=#4C4C4C ctermbg=NONE
endfunction

" tabline color mods
function! ModifyTablineColors() abort
	highlight TabLineFill guibg=NONE gui=NONE ctermbg=NONE
	" highlight TabLineSel guibg=NONE guifg=#fcedda ctermbg=NONE
	highlight TabLine guibg=NONE ctermbg=NONE
endfunction

" Coc signs color mods
function! ModifyCocSignColors() abort
	highlight CocErrorSign guibg=NONE guifg=#ff0000 ctermbg=NONE
	highlight CocWarningSign guibg=NONE guifg=#ff922b ctermbg=NONE
	highlight CocInfoSign guibg=NONE guifg=#fab005 ctermbg=NONE
	highlight CocHintSign guibg=NONE guifg=#15aabf ctermbg=NONE
endfunction

" Signify color mods
function! ModifySignifyColors() abort
	highlight SignifySignAdd guifg=yellow guibg=NONE ctermbg=NONE
	highlight SignifySignDelete guifg=red  guibg=NONE ctermbg=NONE
	highlight SignifySignChange guifg=green guibg=NONE ctermbg=NONE
endfunction

" Update a buffer's contents on focus if it changed outside of Vim. {{{
au GeneralSettings FocusGained,BufEnter * :checktime
" }}}

" TERMINAL {{{
if has('nvim')
	au GeneralSettings TermOpen * startinsert
endif
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

" CREATE A NEW DIR IF IT DOESNT EXISTS {{{
au GeneralSettings BufWritePre *
	\ if '<afile>' !~ '^scp:' && !isdirectory(expand('<afile>:h')) |
		\ call mkdir(expand('<afile>:h'), 'p') |
	\ endif
" }}}

au GeneralSettings BufLeave * let b:last_cwd = getcwd()
au GeneralSettings BufEnter * if exists('b:last_cwd')
			\|   execute 'lcd' b:last_cwd
			\| else
			\|   silent! Glcd
			\| endif
