" Purpose: Lightline

" Desc: Lightline config {{{
let g:lightline = {
      \ 'colorscheme': 'iceberg',
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
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lspstatus' ],
      \		     [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightLineGitBranch',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'lspstatus': 'LspStatus'
      \ },
      \ }
" }}}

" Desc: Utilities {{{
function! LightlineFileformat() abort
  return winwidth(0) > 85 ? &fileformat : ''
endfunction

function! LightlineFiletype() abort
  return winwidth(0) > 85 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineGitBranch() abort
  return winwidth(0) > 85 ? FugitiveHead() : ''
endfunction
" }}}

" vim:foldmethod=marker
