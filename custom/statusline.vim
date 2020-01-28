set laststatus=2
set showtabline=1
set guioptions-=e
set showmode
set statusline=%!ActiveStatus()

augroup status
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()
augroup END

function! ActiveStatus() abort
  let statusline=""
  let statusline.="%#SpecialKey#\ ❮%*"
  let statusline.="%#Preproc#%{GitStatus()}%*"
  let statusline.="%#SpecialKey#\ ∙%*"
  let statusline.="%#SpecialKey#%{ProjectName()}\ %t%m%*"
  let statusline.="%#SpecialKey#\ ❯%*"
  let statusline.="%#SpecialKey#\ %{CocStatus()}%*%*"
  " switching to right side"
  let statusline.="%1*%=%*"
  let statusline.="%#SpecialKey#\ ❮%*"
  let statusline.="%#SpecialKey#\ %{Filetype()}%*"
  let statusline.="%#SpecialKey#%{strftime('%R',getftime(expand('%')))}%*"
  let statusline.="%#SpecialKey#\ ∙%*"
  let statusline.="%#SpecialKey#\ %l×%c%*"
  let statusline.="%#SpecialKey#\ ∙%*"
  let statusline.="%#SpecialKey#\ %p%%%*"
  let statusline.="%#SpecialKey#\ ❯\ %*"
  return statusline
endfunction

function! InactiveStatus() abort
  let statusline=""
  let statusline.="%#Comment#\ ❮%*"
  let statusline.="%#Comment#\ %t%m%*"
  let statusline.="%#Comment#\ ❯%*"
  " switching to right side"
  let statusline.="%1*%=%*"
  let statusline.="%#Comment#\ ❮%*"
  let statusline.="%#Comment#\ %{Filetype()}%*"
  let statusline.="%#Comment#%{strftime('%R',getftime(expand('%')))}%*"
  let statusline.="%#Comment#\ ❯\ %*"
  return statusline
endfunction

" stausline background
hi User1 guibg=NONE

function! Filetype() abort
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype.' ∙ ' : 'no ft ∙ ') : ''
endfunction

function! CocStatus() abort
  let status = get(g:, 'coc_status', '')
  return winwidth(0) > 105 ? status : ''
endfunction

function! GitStatus() abort
  let blame = get(g:, 'coc_git_status', '')
  let branch = blame == '' ? 'no git': blame
  return winwidth(0) > 70 ? ' '.branch : ''
endfunction

function! ProjectName() abort
  let path = split(getcwd(0), '/')
  let name = get(path, len(path) - 1, '')
  return winwidth(0) > 105 ? ' '.name.' ¬' : ''
endfunction
