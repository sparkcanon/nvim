"Define the dictionary
let g:which_key_map =  {}

nnoremap <leader>1 :1wincmd w<CR>
let g:which_key_map.1 = 'which_key_ignore'

" Second level dictionaries:
" 'name' is a special field. It will define the name of the group, e.g., leader-f is the "+file" group.
" Unnamed groups will show a default empty string.

" =======================================================
" Create menus based on existing mappings
" =======================================================
" You can pass a descriptive text to an existing mapping.

let g:which_key_map.f = { 'name' : '+file' }

nnoremap <silent> <leader>fs :update<CR>
let g:which_key_map.f.s = 'save-file'

nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
let g:which_key_map.f.d = 'open-vimrc'

nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ }

let g:which_key_map.f.i = {
      \ 'name': '+fzf',
      \ 'c': ['plug#fzf#FZFCmd()', 'fzf-cmd'],
      \ 'f': ['plug#fzf#Func()', 'fzf-related-function'],
      \ }

" =======================================================
" Create menus not based on existing mappings:
" =======================================================
" Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.) and descriptions for existing mappings
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

let g:which_key_map.l = {
      \ 'name' : '+coc'                                            ,
      \ 'd' : ["CocAction('jumpDefinition')"     , 'definition']       ,
      \ 't' : ["CocAction('jumpTypeDefinition', 'drop')" , 'type-definition']  ,
      \ 'i' : ["CocAction('jumpImplementation', 'drop')"  , 'implementation']  ,
      \ 'f' : ["CocAction('jumpReferences', 'drop')"  , 'references']  ,
      \ 'h' : ["CocAction('doHover', 'drop')"  , 'hover']  ,
      \ 'r' : ["CocAction('rename', 'drop')"  , 'rename-symbol']  ,
      \ 'F' : ["CocAction('format', 'drop')"  , 'format']  ,
      \ }


let g:which_key_map.j = {
      \ 'name' : '+jump/json'              ,
      \ 'j' : 'easymotion-goto-char'       ,
      \ 'J' : 'easymotion-goto-char-2'     ,
      \ 'l' : 'jump-linewise'              ,
      \ 'w' : 'jump-to-word-bidirectional' ,
      \ 'f' : 'jump-forward-wordwise'      ,
      \ 'b' : 'jump-backword-wordwise'     ,
      \ 'F' : ['execute line(".")."!python -m json.tool"', 'format-current-raw-oneline-json'],
      \ }
