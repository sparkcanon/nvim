" LEADER KEY {{{
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
" }}}

" INCSEARCH: COMMANDS {{{
" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``
" }}}

" CUSTOM FUNCTIONS {{{
function! s:get_visual_selection()
   let l=getline("'<")
   let [line1,col1] = getpos("'<")[1:2]
   let [line2,col2] = getpos("'>")[1:2]
   return l[col1 - 1: col2 - 1]
endfunction
" }}}

" TABULARIZE {{{
xnoremap ga :Tabularize /
nnoremap ga :Tabularize /
" }}}

" UTILITIES {{{
nnoremap ; :
nnoremap : ;

" Set working directory
nnoremap <leader>ro :lcd %:p:h<CR>

" Enter a line after brackets
inoremap {<Enter> {<Enter>}<Esc>O<tab>
inoremap [<Enter> [<Enter>]<Esc>O<tab>

" Stay in visual mode after indenting
vnoremap > >gv
vnoremap < <gv
" }}}

" HIGHLIGHT {{{
" Very magic mode for search
nnoremap g/ /\v
nnoremap ? ?\v
nnoremap g? /\<\><left><left>

" Clear highlights
nnoremap <leader>/ :nohlsearch<CR>
" }}}

" C: COC {{{
" Search workspace for word
nnoremap <silent> <leader>cs :<C-u>CocSearch <C-R><C-W><CR>
" Search workspace for word
xnoremap <script> <leader>cs <Esc>:CocSearch <C-R><C-R>=<SID>get_visual_selection()<CR>
" Do default action for next item.
nnoremap <silent> <leader>c[  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>c]  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>

" Remap for do codeAction of current line
nmap <silent> <leader>ca  <Plug>(coc-codeaction)

vmap <silent> <leader>ca  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>cA  <Plug>(coc-codeaction-selected)

" Fix autofix problem of current line
nmap <silent> <leader>cq  <Plug>(coc-fix-current)

" Remap for format selected region
vmap <silent> <leader>cf  <Plug>(coc-format-selected)
nmap <silent> <leader>cf  <Plug>(coc-format-selected)

nmap <silent> <leader>cR <Plug>(coc-rename)
" nmap <leader>ci <Plug>(coc-diagnostic-info)

" }}}

" G: CODE RELATED {{{
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}

" S: REPLACE RELATED {{{
nnoremap <leader>sr :%s/<C-r><C-w>//gc<Left><Left><Left>
xnoremap <leader>sr <Esc>:%s/<C-R><C-R>=<SID>get_visual_selection()<CR>//gc<Left><Left><Left>

nnoremap <leader>sc :cfdo %s/<C-r><C-w>//g \| update<S-Left><Left><Left><Left><Left><Left>
xnoremap <leader>sc :cfdo %s/<C-R><C-R>=<SID>get_visual_selection()<CR>//gc \| update<S-Left><S-Left><Left><Left><Left><Left>
" }}}

" SEARCHING GOODIES {{{
" Center search result line in screen
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
nnoremap # #zvzz
" }}}

" QUICKFIX RELATED {{{
" Open a quickfix window for last search
nnoremap <silent> <leader><UP> :execute 'vimgrep /'.@/.'/g %'<CR>
nnoremap <silent> <UP> :cope<CR>
nnoremap <silent> <DOWN> :cclose<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprev<CR>
nnoremap <silent> <RIGHT> :cnext<CR>
nnoremap <silent> <LEFT> :cprev<CR>
nnoremap <silent> <S-RIGHT> :cnewer<CR>
nnoremap <silent> <S-LEFT> :colder<CR>
" }}}

" G: GIT {{{
nnoremap <silent> <leader>gs :CocList -A --normal gstatus<CR>
nnoremap <leader>gz :G stash list<CR>
nnoremap <silent> <leader>gad :exe 'G stash drop '.input('Drop stash number: ')<CR>
nnoremap <silent> <leader>gaa :exe 'G stash apply '.input('Apply stash number: ')<CR>
nnoremap <silent> <leader>gac :exe 'G stash clear'<CR>
" }}}

" W: WINDOW RELATED {{{
nnoremap <leader>w <C-w>
nnoremap <silent> <leader>wL :call SwapTo('right')<CR>
nnoremap <silent> <leader>wH :call SwapTo('left')<CR>
nnoremap <silent> <leader>wK :call SwapTo('up')<CR>
nnoremap <silent> <leader>wJ :call SwapTo('down')<CR>
nnoremap <silent> <leader>wcc :cclose<cr>
" }}}

" B: BUFFER RELATED {{{
noremap <leader>bp :bp<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bD :Bdelete!<CR>
noremap <silent> <leader>bb :<C-u>CocList buffers<CR>
noremap <backspace> <C-^>
" }}}

" TERMINAL {{{
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <leader>te :tabe <bar> terminal<CR>
" }}}

" Y: YANKING RELATED {{{
" relative path  (src/foo.txt)
nnoremap <leader>yr :let @*=expand("%")<CR>
" absolute path  (/something/src/foo.txt)
nnoremap <leader>yR :let @*=expand("%:p")<CR>
" filename       (foo.txt)
nnoremap <leader>yf :let @*=expand("%:t")<CR>
" directory name (/something/src)
nnoremap <leader>yd :let @*=expand("%:p:h")<CR>
" Opens an edit command with the path of the currently edited file filled in
nnoremap <leader>ye :e <C-R>=expand("%:p:h") . "/" <CR>
" cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" }}}

" TABS {{{
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR><Paste>
" }}}
