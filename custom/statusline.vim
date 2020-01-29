set laststatus=2
set guioptions-=e
set showtabline=2
let g:tabprefix=""
set showmode " Show mode in echo line
set statusline=%!ActiveStatus()

augroup status
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()
augroup END


function! ActiveStatus() abort
  let statusline=""
  let statusline.="\ ❮"
  let statusline.="%#Preproc#%{GitStatus()}%*\ ∙"
  let statusline.="\ %t\ %m"
  let statusline.="%="
  let statusline.="%{Filetype()}\ ∙\ "
  let statusline.="\%l×%c"
  let statusline.="\ ❯\ "
  return statusline
endfunction

function! InactiveStatus() abort
  let statusline=""
  let statusline.="\ ❮"
  let statusline.="\ %t"
  let statusline.="%="
  let statusline.="%{Filetype()}"
  let statusline.="\ ❯\ "
  return statusline
endfunction

function! Filetype() abort
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! GitStatus() abort
  let blame = get(g:, 'coc_git_status', '')
  let branch = blame == '' ? 'no git': blame
  return winwidth(0) > 70 ? ' '.branch : ''
endfunction
