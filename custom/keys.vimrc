" leader key stuff
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" Custom functions {{{
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

" Utilities {{{
nnoremap ; :
nnoremap : ;
nnoremap / /\v
inoremap kj <Esc>
nnoremap <leader>q :q<CR>
nnoremap <leader>, :nohlsearch<CR>
" }}}

" C: coc {{{
nnoremap <silent> <leader>cl :<C-u>CocList<cr>
" Show all diagnostics
nnoremap <silent> <leader>cd :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <leader>cc :<C-u>CocList commands<cr>
" Search workspace symbols
nnoremap <silent> <leader>cS  :<C-u>CocList -I symbols<cr>
" Search workspace for word
nnoremap <silent> <leader>cs :CocSearch <C-R><C-W><CR>
" Search workspace for word
vnoremap <script> <leader>cs <Esc>:CocSearch <C-R><C-R>=<SID>get_visual_selection()<CR>
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Do default action for next item.
nnoremap <silent> <leader>c[  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>c]  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cR  :<C-u>CocListResume<CR>

" Remap for do codeAction of current line
nmap <leader>ca  <Plug>(coc-codeaction)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>cas  <Plug>(coc-codeaction-selected)
nmap <leader>cas  <Plug>(coc-codeaction-selected)

" Fix autofix problem of current line
nmap <leader>cfc  <Plug>(coc-fix-current)

" Remap for format selected region
vmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

nnoremap <leader>cr <Plug>(coc-rename)<cr>
" nmap <leader>ci <Plug>(coc-diagnostic-info)

" }}}

" G: code shananigans {{{
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}

" S: replace shananigans {{{
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
" nnoremap <Leader>sf :%s///g<Left><Left>
function! CallSubstitube()
  return ':%s/'.expand("<cword>").'/'.input('Enter query: ').'/gc'
endfunction

nnoremap <expr> <Leader>sf CallSubstitube()
vnoremap <script> <Leader>sf <Esc>:%s/<C-R><C-R>=<SID>get_visual_selection()<CR>//gc<Left><Left><Left>
" vnoremap <script> <Leader>sF <Esc>:%s/<C-R><C-R>=<SID>get_visual_selection()<CR>//g<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
" xnoremap <Leader>sr :s///g<Left><Left><left>
" xnoremap <Leader>src :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
" nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
" xnoremap <silent> s* "sy:let @/=@s<CR>cgn

function! CallCfdo()
  return ':cfdo %s/'.expand("<cword>").'/'.input("Enter query: ").'/g | update'
endfunction

nnoremap <expr> <leader>sR CallCfdo()
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
nnoremap <leader>cco :cw<CR>
nnoremap <leader>ccl :ccl<CR>
nnoremap <silent> <UP> :cope<CR>
nnoremap <silent> <DOWN> :cclose<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprev<CR>
nnoremap <silent> <RIGHT> :cnext<CR>
nnoremap <silent> <LEFT> :cprev<CR>
" }}}


" Git mappings {{{
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
" }}}

" vim-test mappings
" nnoremap <silent> <leader>tt :TestFile<CR>
" nnoremap <silent> <leader>tn :TestNearest<CR><Paste>

"" W: window related {{{
noremap <Leader>wd :<C-u>split<CR>
noremap <Leader>wv :<C-u>vsplit<CR>
noremap <leader>wj <C-w>j
noremap <leader>wk <C-w>k
noremap <leader>wl <C-w>l
noremap <leader>wh <C-w>h<Plug>_"
nnoremap <leader>wco :only<cr>
nnoremap <leader>wcc :cclose<cr>
" }}}


"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
" noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
" noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR<Plug>_"

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" F: finding related {{{
" FZF
nnoremap <silent> <leader>fo :Clap<CR>
nnoremap <silent> <leader>fs :Find<CR>
nnoremap <silent><leader>fS :Find <C-R><C-W><CR>
vnoremap <script> <leader>fS <Esc>:Find <C-R><C-R>=<SID>get_visual_selection()<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fl :Lines<CR>
nnoremap <silent> <leader>fw :Windows<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fx :Commands<CR>
nnoremap <silent> <leader>fm :Maps<CR>
nnoremap <silent> <leader>fC :Commits<CR>
nnoremap <silent> <leader>fc :BCommits<CR>
nnoremap <silent> <leader>fu :Snippets<CR>

" sourcing
nnoremap <leader>fr :source $MYVIMRC<CR>

" ranger
nnoremap <leader>fD :RangerNewTab<CR> 
nnoremap <leader>ft :NERDTreeToggle<CR>
" }}}

"" B: buffer related {{{
noremap <leader>bp :bp<CR>
noremap <leader>bn :bn<CR>
" noremap <leader>bc :bd<CR>
noremap <leader>bd :Bdelete<CR>
" noremap <leader>q :Bdelete<CR>
noremap <leader>bC :bufdo :Bdelete<CR>
noremap <silent> <leader>bf :Buffers<CR>
" }}}

" Y: yanking related {{{
" relative path  (src/foo.txt)
nnoremap <leader>yf :let @*=expand("%")<CR>
" absolute path  (/something/src/foo.txt)
nnoremap <leader>yF :let @*=expand("%:p")<CR>
" filename       (foo.txt)
nnoremap <leader>yt :let @*=expand("%:t")<CR>
" directory name (/something/src)
nnoremap <leader>yh :let @*=expand("%:p:h")<CR>
" }}}

" G: git stuff {{{
nnoremap <leader>gs :15Gstatus<CR>
nnoremap <leader>gP :Gpush<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gf :Gfetch<CR>
" }}}

" O: other stuff {{{
nnoremap <silent> <leader>om :MundoToggle<CR>
" }}}

" highlight {{{
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
" }}}

"" Tabs {{{
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR><Paste>
" }}}
