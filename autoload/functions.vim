" Colors {{{
" Make buffer transparent
function! functions#modifyBufferColors() abort
 highlight! Normal guibg=NONE
 highlight! EndOfBuffer guibg=NONE
endfunction

" Lsp colors
" TODO: Add colors to the commented hl groups
function! functions#modifyLspColors() abort
 highlight! LspDiagnosticsError guifg=red
 highlight! LspDiagnosticsHint guifg=yellow
 highlight! LspDiagnosticsUnderlineError guifg=red
 highlight! LspDiagnosticsUnderlineHint guifg=yellow
 " highlight!  LspDiagnosticsInformation guifg=yellow
 " highlight!  LspDiagnosticsUnderline
 " highlight!  LspDiagnosticsUnderlineInformation
 " highlight!  LspDiagnosticsUnderlineWarning
 " highlight!  LspDiagnosticsWarning
endfunction
" }}}

" Grep {{{
" Perform the search in a sub-shell
function! functions#grep(args) abort
 let args = split(a:args, ' ')
 return system(join([&grepprg, shellescape(args[0]), len(args) > 1 ? join(args[1:-1], ' ') : ''], ' '))
endfunction
" }}}

" Visual {{{
" Get visual section
function! functions#getVisualSelection() abort
 let l=getline("'<")
 let [line1,col1] = getpos("'<")[1:2]
 let [line2,col2] = getpos("'>")[1:2]
 return l[col1 - 1: col2 - 1]
endfunction
" }}}

" Jest {{{
" TODO: Resolve root automatically
function! functions#jestRunForSingleFile() abort
 execute 'vnew | terminal cd node_modules/.bin && ./jest --watch '
endfunction
" }}}

" Sessions {{{
function! functions#sessionSave() abort
 let root = fnamemodify(getcwd(0), ':t')
 execute 'mks! $HOME/.config/nvim/tmp/dir_session/'.root.'.vim' | echo 'Session saved as '.root.'.vim'
endfunction

function! functions#sessionLoad(file) abort
 execute 'source $HOME/.config/nvim/tmp/dir_session/'.a:file | echo 'Session '.a:file.' has been loaded'
endfunction

function! functions#sessionCompletePath(A,L,P) abort
 let pathList =  split(globpath('$HOME/.config/nvim/tmp/dir_session/', '*.vim'), '\n')
 let emptyList = []
 for i in pathList
  let item = split(i, '/')[-1]
  let finalList = add(emptyList, item)
 endfor
 return finalList
endfunction
" }}}

" Abbrs {{{
function! functions#setupCommandAbbrs(from, to) abort
 exec 'cnoreabbrev <expr> '.a:from
    \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
    \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
" }}}

" Prettier {{{
function! functions#prettierFormat() abort
 let prettierPath = glob(getcwd().'/node_modules/.bin/prettier')
 if !empty(prettierPath)
  let getPath = system('prettier --find-config-path .')[:-2]
  let &l:makeprg = './node_modules/.bin/prettier --config ' . getPath . ' --write'
 endif
endfunction
" }}}

" Git stash
function functions#getGitStash() abort
	let stashList = systemlist('git stash list')
	call setqflist([], ' ', {'lines': systemlist('git stash list')}) | copen
endfunction
