" LEADER KEY
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" SOURCING
nnoremap <leader>fr :source $MYVIMRC<CR>
nnoremap <leader>fe :edit $MYVIMRC<CR>

" CUSTOM FUNCTIONS {{{
function! s:get_visual_selection()
   let l=getline("'<")
   let [line1,col1] = getpos("'<")[1:2]
   let [line2,col2] = getpos("'>")[1:2]
   return l[col1 - 1: col2 - 1]
endfunction
" }}}

" EASY ALIGN {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" UTILITIES {{{
nnoremap ; :
nnoremap : ;
nnoremap / /\v
inoremap kj <Esc>
nnoremap <leader>, :nohlsearch<CR>
" }}}

" C: COC {{{
nnoremap <silent> <leader>cl :<C-u>CocList<cr>
" Show all diagnostics
nnoremap <silent> <leader>cd :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <leader>cc :<C-u>CocList commands<cr>
" Search workspace symbols
nnoremap <silent> <leader>cS  :<C-u>CocList -I symbols<cr>
" Search workspace for word
nnoremap <silent> <leader>cs :<C-u>CocSearch <C-R><C-W><CR>
" Search workspace for word
xnoremap <script> <leader>cs <Esc>:CocSearch <C-R><C-R>=<SID>get_visual_selection()<CR>
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Do default action for next item.
" nnoremap <silent> <leader>c[  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <leader>c]  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>
" Marks
nnoremap <silent> <leader>cm  :<C-u>CocList marks<CR>

" Remap for do codeAction of current line
nmap <leader>ca  <Plug>(coc-codeaction)

vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>cA  <Plug>(coc-codeaction-selected)

" Fix autofix problem of current line
nmap <leader>cfc  <Plug>(coc-fix-current)

" Remap for format selected region
vmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

nmap <leader>cR <Plug>(coc-rename)<cr>
" nmap <leader>ci <Plug>(coc-diagnostic-info)

" }}}

" G: CODE SHANANIGANS {{{
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}

" S: REPLACE SHANANIGANS {{{
nnoremap <Leader>sf :%s/<C-r><C-w>//gc<Left><Left><Left>
xnoremap <Leader>sf <Esc>:%s/<C-R><C-R>=<SID>get_visual_selection()<CR>//gc<Left><Left><Left>

nnoremap <leader>sr :cfdo %s/<C-r><C-w>//g \| update<S-Left><Left><Left><Left><Left><Left>
xnoremap <leader>sr :cfdo %s/<C-R><C-R>=<SID>get_visual_selection()<CR>//gc \| update<S-Left><S-Left><Left><Left><Left><Left>
" }}}

" SEARCHING GOODIES {{{
" Center search result line in screen
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
nnoremap # #zvzz
" }}}

" Open and close quickfix menu {{{
" Open a quickfix window for last search
nnoremap <silent> <leader><UP> :execute 'vimgrep /'.@/.'/g %'<CR>
" nnoremap <leader>cco :cw<CR>
" nnoremap <leader>ccl :ccl<CR>
nnoremap <silent> <UP> :cope<CR>
nnoremap <silent> <DOWN> :cclose<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprev<CR>
nnoremap <silent> <RIGHT> :cnext<CR>
nnoremap <silent> <LEFT> :cprev<CR>
" }}}


" G: GIT STUFF {{{
nnoremap <leader>gs :CocList -A --normal gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
noremap <Leader>gP :Gpush<CR>
noremap <Leader>gp :Gpull<CR>
nnoremap <leader>gf :Gfetch<CR>
" }}}

" W: WINDOW RELATED {{{
noremap <Leader>wd :<C-u>split<CR>
noremap <Leader>wv :<C-u>vsplit<CR>
nnoremap <Leader>w <C-w>
nnoremap <leader>wm :WinResizerStartFocus<CR>
nnoremap <leader>wM :WinResizerStartMove<CR>
nnoremap <leader>we :WinResizerStartResize<CR>
nnoremap <leader>wco :only<cr>
nnoremap <leader>wcc :cclose<cr>
" }}}

" Set working directory
" nnoremap <leader>. :lcd %:p:h<CR>

" F: FINDING RELATED {{{
nnoremap <silent> <leader>fs :<C-u>CocList -I grep<CR>
nnoremap <silent> <leader>ff :<C-u>CocList files<CR>
nnoremap <silent> <leader>fl :<C-u>CocList -I lines<CR>
nnoremap <silent> <leader>fW :<C-u>CocList windows<CR>
nnoremap <silent> <leader>fw  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
nnoremap <silent> <leader>fh :<C-u>CocList mru<CR>
nnoremap <silent> <leader>fx :<C-u>CocList commands<CR>
nnoremap <silent> <leader>fm :<C-u>CocList maps<CR>
nnoremap <silent> <leader>fC :<C-u>CocList --normal commits<CR>
nnoremap <silent> <leader>fc :<C-u>CocList --normal bcommits<CR>
" }}}

" B: BUFFER RELATED {{{
noremap <leader>bp :bp<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bd :Bdelete<CR>
noremap <leader>bD :bufdo :Bdelete<CR>
noremap <silent> <leader>bf :<C-u>CocList buffers<CR>
" }}}

" Y: YANKING RELATED {{{
" relative path  (src/foo.txt)
nnoremap <leader>yf :let @*=expand("%")<CR>
" absolute path  (/something/src/foo.txt)
nnoremap <leader>yF :let @*=expand("%:p")<CR>
" filename       (foo.txt)
nnoremap <leader>yt :let @*=expand("%:t")<CR>
" directory name (/something/src)
nnoremap <leader>yh :let @*=expand("%:p:h")<CR>
" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>ye :e <C-R>=expand("%:p:h") . "/" <CR>
" cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" }}}

" O: OTHER STUFF {{{
nnoremap <silent> <leader>om :MundoToggle<CR>
" }}}

" HIGHLIGHT {{{
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
" }}}

" TABS {{{
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR><Paste>
" }}}
