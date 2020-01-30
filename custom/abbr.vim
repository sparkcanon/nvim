iabbrev thsi this
iabbrev slient silent
iabbrev accross across
iabbrev cosnt const

function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call SetupCommandAbbrs('C', 'CocConfig')
call SetupCommandAbbrs('cr', 'CocRestart')
call SetupCommandAbbrs('F', 'Format')
call SetupCommandAbbrs('w', 'update')
call SetupCommandAbbrs('sov', 'source $MYVIMRC')
call SetupCommandAbbrs('Pi', 'PlugInstall')
call SetupCommandAbbrs('Pu', 'PlugUpdate')
call SetupCommandAbbrs('Pc', 'PlugClean')
