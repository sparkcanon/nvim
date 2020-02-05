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
  let statusline.="\ ❮\ "
  let statusline.="%#Preproc#%{DiffName()}%{IfDiff()}%*\ ∙"
  let statusline.="\ %t\ %m"
  let statusline.="%="
  let statusline.="%\ %r\ %{Filetype()}\ ∙\ "
  let statusline.="\%l×%c"
  let statusline.="\ ❯\ "
  return statusline
endfunction

function! InactiveStatus() abort
  let statusline=""
  let statusline.="\ ❮\ "
  let statusline.="%#Preproc#%{DiffName()}%{IfDiff()}%*\ ∙"
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
  return winwidth(0) > 70 ? branch : ''
endfunction

function DiffName() abort
  let fullname = expand('%')
  let gitversion = ''
  if fullname =~? 'fugitive://.*/\.git//0/.*'
      let gitversion = 'git index'
  elseif fullname =~? 'fugitive://.*/\.git//2/.*'
      let gitversion = 'git target'
  elseif fullname =~? 'fugitive://.*/\.git//3/.*'
      let gitversion = 'git merge'
  elseif &diff == 1
      let gitversion = 'working copy'
  endif
  return gitversion
endfunction

function! IfDiff() abort
  return &diff ? '' : GitStatus()
endfunction
