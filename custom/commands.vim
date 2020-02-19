iabbrev thsi this
iabbrev slient silent
iabbrev accross across
iabbrev cosnt const

function! SetupCommandAbbrs(from, to) abort
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call SetupCommandAbbrs('w', 'update')
call SetupCommandAbbrs('sov', 'source $MYVIMRC')
call SetupCommandAbbrs('bd', 'Bdelete')
call SetupCommandAbbrs('lk', 'Files')
call SetupCommandAbbrs('gr', 'grep')

" PLUG {{{
call SetupCommandAbbrs('pin', 'PlugInstall')
call SetupCommandAbbrs('pup', 'PlugUpdate')
call SetupCommandAbbrs('pcl', 'PlugClean')
" }}}

" COC {{{
call SetupCommandAbbrs('ccf', 'CocConfig')
call SetupCommandAbbrs('cr', 'CocRestart')
call SetupCommandAbbrs('cl', 'CocList')
call SetupCommandAbbrs('cL', 'CocListResume')
call SetupCommandAbbrs('ff', 'CocList files')
call SetupCommandAbbrs('fh', 'CocList mru')
call SetupCommandAbbrs('cc', 'CocList commands')
call SetupCommandAbbrs('cgc', 'CocList --normal commits')
call SetupCommandAbbrs('cgb', 'CocList --normal bcommits')
call SetupCommandAbbrs('jest', 'JestSingleFile')
" }}}

command! -nargs=0 Sload :call CocAction('runCommand', 'session.load')
command! -nargs=0 Ssave :call CocAction('runCommand', 'session.save')
" Run jest on current file
command! -nargs=0 JestSingleFile :call  CocAction('runCommand', 'jest.fileTest', ['%'])
command! -nargs=* -bang Files :call find_files#execute(<q-args>, 'qf', <bang>0)

" ----------------------------------------------------------------------------
" DiffRev
" ----------------------------------------------------------------------------
let s:git_status_dictionary = {
            \ "A": "Added",
            \ "B": "Broken",
            \ "C": "Copied",
            \ "D": "Deleted",
            \ "M": "Modified",
            \ "R": "Renamed",
            \ "T": "Changed",
            \ "U": "Unmerged",
            \ "X": "Unknown"
            \ }
function! s:get_diff_files(rev)
  let list = map(split(system(
              \ 'git diff --name-status '.a:rev), '\n'),
              \ '{"filename":matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
              \ )
  call setqflist(list)
  copen
endfunction

command! -nargs=1 DiffRev call s:get_diff_files(<q-args>)
