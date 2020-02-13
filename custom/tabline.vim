" pathshorten - shorten file path
if exists("+showtabline")
  function MyTabLine() abort
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= (i == t ? '%#PmenuSbar#' : '%#TabLineFill#')
      let s .= ' ' . i . ' '
      let rawFile = bufname(buflist[winnr - 1])
      let projectName = fnamemodify(fnamemodify(rawFile, ':t'), ':p:h:t').' '
      if empty(projectName)
        let projectName = '[No Name]'
      endif
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= '%=%#TabLine#%999X'.projectName
    return s
  endfunction
  set showtabline=2
  set tabline=%!MyTabLine()
endif
