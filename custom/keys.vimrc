" leader key stuff
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" Which key {{{
" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
" vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
" }}}

" Utilities {{{
nnoremap ; :
nnoremap : ;
inoremap jj <Esc>
nnoremap <leader>q :q<CR>
nnoremap <leader>, :nohlsearch<CR>
" }}}

" S: replace shananigans {{{
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>sr :%s///g<Left><Left>
nnoremap <Leader>src :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>sr :s///g<Left><Left>
xnoremap <Leader>src :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

nmap <leader>sf <Plug>(FerretAck)
nmap <leader>sF <Plug>(FerretAckWord) 
let g:FerretMap=0

" vim grepper
xmap sgr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>sgR
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" }}}

" L: Code related {{{

" Visa stuff {{{
nnoremap <leader>lv :Vista!!<CR>
" }}}


" SEARCHING GOODIES {{{
" Center search result line in screen
nnoremap n nzz
nnoremap N Nzz
" }}}

" nnoremap <leader>f :vim<SPACE>

" Open and close quickfix menu {{{
" Open a quickfix window for last search
nnoremap <silent> <leader><UP> :execute 'vimgrep /'.@/.'/g %'<CR>
nnoremap <leader>co :cw<CR>
nnoremap <leader>cc :ccl<CR>
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
noremap <Leader>wh :<C-u>split<CR>
noremap <Leader>wv :<C-u>vsplit<CR>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h<Plug>_"
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
nnoremap <silent> <leader>fs :Find<CR>
nnoremap <silent><leader>fS :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>ff :FZF -m<CR>
nnoremap <silent> <leader>fl :Lines<CR>
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
noremap <leader>bc :Bdelete<CR>
noremap <leader>q :Bdelete<CR>
noremap <leader>bC :bufdo :Bdelete<CR>
noremap <silent> <leader>b :Buffers<CR>
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
