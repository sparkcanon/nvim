set laststatus=2
set showtabline=1
set guioptions-=e

set statusline=
set statusline+=%2*\ %{ModeCurrent()}%*
set statusline+=%1*\ %{GitStatus()}
set statusline+=\ ❮\ 
set statusline+=%{FileName()}%m
set statusline+=\ ❯\ 
set statusline+=\ %{coc#status()}%*

" switching to right side
set statusline+=%1*%=%*
set statusline+=\ ❮
set statusline+=\ %{Filetype()}\ ∙
set statusline+=\ %{strftime('%R',getftime(expand('%')))}\ ∙
set statusline+=\ %l×%c\ ∙
set statusline+=\ %p%%
set statusline+=\ ❯\ 

" Dictionary: take mode() input -> longer notation of current mode
" mode() is defined by Vim
let g:currentmode={
 \	'n'  : 'N ',
 \	'no' : 'N·Operator Pending ',
 \	'v'  : 'V ',
 \	'V'  : 'V·Line ',
 \	'^V' : 'V·Block ',
 \	's'  : 'S ',
 \	'S'  : 'S·Line ',
 \	'^S' : 'S·Block ',
 \	'i'  : 'I ',
 \	'R'  : 'R ',
 \	'Rv' : 'V·Replace ',
 \	'c'  : 'C ',
 \	'cv' : 'Vim Ex ',
 \	'ce' : 'Ex ',
 \	'r'  : 'Prompt ',
 \	'rm' : 'More ',
 \	'r?' : 'Confirm ',
 \	'!'  : 'Shell ',
 \	't'  : 'T '
 \ }

" stausline background
hi User1 guifg=#FFD7D7 guibg=NONE
" mode background
hi User2 guifg=#000000 guibg=#959ca6

" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

function! FileName() abort
  let fname = expand('%t')
  let finalPath = ProjectName().' ¬ '.fname
  return winwidth(0) > 70 ? finalPath : fname
endfunction

function! Filetype() abort
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! GitStatus() abort
  let blame = get(g:, 'coc_git_status', '')
  return winwidth(0) > 70 ? blame : ''
endfunction

function! ProjectName() abort
  let path = split(getcwd(0), '/')
  let name = get(path, len(path) - 1, '')
  return winwidth(0) > 70 ? name : ''
endfunction
