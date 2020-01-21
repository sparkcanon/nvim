let g:lightline = {
      \ 'colorscheme': 'srcery_drk',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitcocstatusoverall', 'readonly', 'filename', 'modified', 'cocstatus' ] ],
      \   'right': [
      \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
      \   ]
      \ },
      \ 'component_function': {
      \   'filetype': 'LightlineFiletype',
      \   'cocstatus': 'coc#status',
      \   'gitcocstatusoverall': 'LightlineGitStatusOverall'
      \ },
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \ },
      \ }

function! LightlineFileformat() abort
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineCocStatus() abort
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype() abort
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineGitStatusOverall() abort
  let blame = get(g:, 'coc_git_status', '')
  " return blame
  return winwidth(0) > 70 ? blame : ''
endfunction

" 'filename': '%{winnr()} | %t'
" \   'gitbranch': 'fugitive#head',
