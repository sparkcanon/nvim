set laststatus=2
set showtabline=1
set guioptions-=e
set showmode
set statusline=%!ActiveStatus()

augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()
augroup END

function! ActiveStatus() abort
  let statusline=""
  let statusline.="%#Comment#\ ❮%*"
  let statusline.="%2*\ %{GitStatus()}%*"
  let statusline.="%#Comment#\ ∙"
  let statusline.="%#Comment#\ %{ProjectName()}\ ¬\ %t%m%*"
  let statusline.="%#Comment#\ ❯%*"
  let statusline.="%#Comment#\ %{coc#status()}%*%*"
  " switching to right side"
  let statusline.="%1*%=%*"
  let statusline.="%#Comment#\ ❮%*"
  let statusline.="%#Comment#\ %{Filetype()}%*"
  let statusline.="%#Comment#\ ∙"
  let statusline.="%#Comment#\ %{strftime('%R',getftime(expand('%')))}%*"
  let statusline.="%#Comment#\ ∙"
  let statusline.="%#Comment#\ %l×%c%*"
  let statusline.="%#Comment#\ ∙"
  let statusline.="%#Comment#\ %p%%%*"
  let statusline.="%#Comment#\ ❯\ %*"
  return statusline
endfunction

function! InactiveStatus() abort"
  let statusline=""
  let statusline.="%#SpecialKey#\ ❮%*"
  let statusline.="%#SpecialKey#\ %t%m%*"
  let statusline.="%#SpecialKey#\ ❯%*"
  let statusline.="%#SpecialKey#\ %{coc#status()}%*%*"
  " switching to right side"
  let statusline.="%1*%=%*"
  let statusline.="%#SpecialKey#\ ❮%*"
  let statusline.="%#SpecialKey#\ %{Filetype()}%*"
  let statusline.="%#SpecialKey#\ ∙"
  let statusline.="%#SpecialKey#\ %{strftime('%R',getftime(expand('%')))}%*"
  let statusline.="%#SpecialKey#\ ❯\ %"
  return statusline
endfunction

" stausline background
hi User1 guifg=#FFD7D7 guibg=NONE
" mode background
hi User2 guifg=#43dde6 guibg=NONE

function! Filetype() abort
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! GitStatus() abort
  let blame = get(g:, 'coc_git_status', '')
  let branch = blame == '' ? 'no git': blame
  return winwidth(0) > 70 ? branch : ''
endfunction

function! ProjectName() abort
  let path = split(getcwd(0), '/')
  let name = get(path, len(path) - 1, '')
  return winwidth(0) > 70 ? name : ''
endfunction
