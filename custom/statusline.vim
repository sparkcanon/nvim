set laststatus=2
set showtabline=1
set guioptions-=e
set showmode

set statusline=
" set statusline+=%2*\ %{ModeCurrent()}%*
set statusline+=%2*\ %{GitStatus()}\ %*
set statusline+=%#Comment#\ ❮\ %*
set statusline+=%#Comment#%{ProjectName()}\ ¬\ %t%m%*
set statusline+=%#Comment#\ ❯\ %*
set statusline+=%#Comment#%{coc#status()}%*%*

" switching to right side
set statusline+=%1*%=%*
set statusline+=%#SpecialKey#\ ❮%*
set statusline+=%#SpecialKey#\ %{Filetype()}\ ∙%*
set statusline+=%#SpecialKey#\ %{strftime('%R',getftime(expand('%')))}\ ∙%*
set statusline+=%#SpecialKey#\ %l×%c\ ∙%*
set statusline+=%#SpecialKey#\ %p%%%*
set statusline+=%#SpecialKey#\ ❯\ %*

" stausline background
hi User1 guifg=#FFD7D7 guibg=NONE
" mode background
hi User2 guifg=#000000 guibg=#f2f2f2

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
