" In a location/quickfix window, navigate to an older or newer list.
nmap <buffer> <Left>  <Plug>(qf_older)
nmap <buffer> <Right> <Plug>(qf_newer)

" In a location/quickfix window, jump to the next group of lines corresponding to a file.
nmap <buffer> { <Plug>(qf_previous_file)
nmap <buffer> } <Plug>(qf_next_file)
