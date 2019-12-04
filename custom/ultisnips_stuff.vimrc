command! -nargs=1 -complete=file ConvertVSCodeSnippets call ConvertVSCodeSnippets(<q-args>, 1)

fun! ConvertVSCodeSnippets(file, to_buffer)
  let file = join(readfile(expand(a:file)), "\n")
  let data = json_decode(file)
  
  let snippets = keys(data)
  let converted = {}

  if a:to_buffer
    new
    setfiletype snippets
  endif

  for snip in snippets
    let trigger = data[snip]['prefix']
    let body = data[snip]['body']
    let desc = get(data[snip], 'description', '')
    if desc == ''
      let first_line = 'snippet ' . trigger
    else
      let first_line = printf("snippet %s \"%s\"", trigger, escape(desc, '"'))
    endif
    let converted[snip] = [first_line] + body + ['endsnippet', '']
    if a:to_buffer
      silent put =converted[snip]
    endif
  endfor
  return converted
endfun
