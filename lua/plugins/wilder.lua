vim.cmd([[
 call wilder#setup({
       \ 'modes': [':', '/', '?'],
       \ 'next_key': '<Tab>',
       \ 'previous_key': '<S-Tab>',
       \ 'accept_key': '<Down>',
       \ 'reject_key': '<Up>',
       \ })

 " 'file_command' : for ripgrep : ['rg', '--files']
 "                : for fd      : ['fd', '-tf']
 " 'dir_command'  : for fd      : ['fd', '-td']
 " 'filters'      : use ['cpsm_filter'] for performance, requires cpsm vim plugin
 "                  found at https://github.com/nixprime/cpsm
 call wilder#set_option('pipeline', [
       \   wilder#branch(
       \     wilder#python_file_finder_pipeline({
       \       'file_command': {_, arg -> arg[0:1] ==# './' ? v:false : arg[0] ==# '.' ? ['fd', '-tf', '-H'] : ['fd', '-tf']},
       \       'dir_command': ['fd', '-td'],
       \       'filters': ['fuzzy_filter', 'difflib_sorter'],
       \     }),
       \     wilder#cmdline_pipeline({'fuzzy': 1}),
       \     wilder#python_search_pipeline({'pattern': 'fuzzy'}),
       \   ),
       \ ])

 " 'highlighter' : applies highlighting to the candidates
 call wilder#set_option('renderer', wilder#popupmenu_renderer({
       \ 'highlighter': wilder#basic_highlighter(),
       \ }))
]])
