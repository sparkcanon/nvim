let g:lightline_foobar_bold = 1
let g:lightline = {
      \ 'colorscheme': 'pencil_alter',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitcocstatus', 'readonly', 'filename', 'modified', 'cocstatus' ] ],
      \   'right': [
      \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
      \   ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'cocstatus': 'coc#status',
      \   'gitcocstatus': 'LightlineGitStatus'
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

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineCocStatus()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineGitStatus() abort
  let blame = get(g:, 'coc_git_status', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

" 'filename': '%{winnr()} | %t'
