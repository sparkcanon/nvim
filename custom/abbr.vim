iabbrev thsi this
iabbrev slient silent
iabbrev accross across
iabbrev cosnt const

" CUSTOM FUNCTIONS {{{
function! SetupCommandAbbrs(from, to) abort
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
" }}}

call SetupCommandAbbrs('w', 'update')
call SetupCommandAbbrs('sov', 'source $MYVIMRC')
call SetupCommandAbbrs('bd', 'Bdelete')

" GREP {{{
call SetupCommandAbbrs('fd', 'Files')
call SetupCommandAbbrs('gr', 'Grep')
call SetupCommandAbbrs('grw', 'GrepCursorWord')
" }}}

" PLUG {{{
call SetupCommandAbbrs('pin', 'PlugInstall')
call SetupCommandAbbrs('pup', 'PlugUpdate')
call SetupCommandAbbrs('pcl', 'PlugClean')
" }}}

" COC {{{
call SetupCommandAbbrs('cf', 'CocConfig')
call SetupCommandAbbrs('cr', 'CocRestart')
call SetupCommandAbbrs('cl', 'CocList')
call SetupCommandAbbrs('cs', 'CocList sessions')
call SetupCommandAbbrs('cL', 'CocListResume')
call SetupCommandAbbrs('cc', 'CocList commands')
" }}}

