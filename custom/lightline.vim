let g:lightline = {
      \ 'colorscheme': 'srcery_drk',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitcocstatusoverall', 'filename', 'modified', 'cocstatus' ] ],
      \   'right': [
      \     [ 'filetype', 'readonly', 'fileencoding', 'lineinfo', 'percent' ],
      \   ]
      \ },
      \ 'component_function': {
      \   'filetype': 'LLFiletype',
      \   'cocstatus': 'coc#status',
      \   'gitcocstatusoverall': 'LLGitStatus',
      \ },
      \ 'subseparator': { 'left': '░', 'right': '░' },
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
      \   'filename': '%{LLProjectName()} ¬ %f'
      \ },
      \ }

function! LLFileFormat() abort
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LLCocStatus() abort
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LLFiletype() abort
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LLGitStatus() abort
  let blame = get(g:, 'coc_git_status', '')
  return winwidth(0) > 70 ? blame : ''
endfunction

function! LLProjectName() abort
	let path = split(getcwd(0), '/')
	let name = get(path, len(path) - 1, '')
	return winwidth(0) > 70 ? name : ''
endfunction

" 'filename': '%{winnr()} | %t'
" \   'gitbranch': 'fugitive#head',
