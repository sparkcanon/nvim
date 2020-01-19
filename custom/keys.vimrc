" LEADER KEY {{{
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
" }}}

" INCSEARCH COMMANDS {{{
" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``
" }}}

" SOURCING {{{
nnoremap <leader>fr :source $MYVIMRC<CR>
nnoremap <leader>fe :edit $MYVIMRC<CR>
" }}}

" CUSTOM FUNCTIONS {{{
function! s:get_visual_selection()
   let l=getline("'<")
   let [line1,col1] = getpos("'<")[1:2]
   let [line2,col2] = getpos("'>")[1:2]
   return l[col1 - 1: col2 - 1]
endfunction

" CREATE A NEW DIR IF IT DOESNT EXISTS
augroup MakeUnavailableDir
    autocmd!
    autocmd BufWritePre *
        \ if '<afile>' !~ '^scp:' && !isdirectory(expand('<afile>:h')) |
            \ call mkdir(expand('<afile>:h'), 'p') |
        \ endif
augroup END
" }}}

" TABULARIZE {{{
xnoremap ga :Tabularize /
nnoremap ga :Tabularize /
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
nnoremap <silent> <leader>c[  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>c]  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>
" Marks
nnoremap <silent> <leader>cm  :<C-u>CocList marks<CR>

" Remap for do codeAction of current line
nmap <silent> <leader>ca  <Plug>(coc-codeaction)

vmap <silent> <leader>ca  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>cA  <Plug>(coc-codeaction-selected)

" Fix autofix problem of current line
nmap <silent> <leader>cq  <Plug>(coc-fix-current)

" Remap for format selected region
vmap <silent> <leader>cf  <Plug>(coc-format-selected)
nmap <silent> <leader>cf  <Plug>(coc-format-selected)

nmap <silent> <leader>cR <Plug>(coc-rename)<cr>
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
" nnoremap <leader>cco :cw<CR>
" nnoremap <leader>ccl :ccl<CR>
nnoremap <silent> <UP> :cope<CR>
nnoremap <silent> <DOWN> :cclose<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprev<CR>
nnoremap <silent> <RIGHT> :cnext<CR>
nnoremap <silent> <LEFT> :cprev<CR>
" }}}


" G: GIT {{{
nnoremap <silent> <leader>gs :CocList -A --normal gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
noremap <leader>gP :Gpush<CR>
noremap <leader>gp :Gpull<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gz :G stash list<CR>
nnoremap <silent> <leader>gad :exe 'G stash drop '.input('Drop stash number: ')<CR>
nnoremap <silent> <leader>gaa :exe 'G stash apply '.input('Apply stash number: ')<CR>
nnoremap <silent> <leader>gac :exe 'G stash clear'<CR>
" }}}

" W: WINDOW RELATED {{{
noremap <leader>wv :<C-u>vnew<CR>
noremap <leader>wh :<C-u>new<CR>
nnoremap <leader>w <C-w>
nnoremap <silent> <leader>wn :exe input('Window number: ').'wincmd w'<CR>
nnoremap <silent> <leader>wm :WinResizerStartFocus<CR>
nnoremap <silent> <leader>wM :WinResizerStartMove<CR>
nnoremap <silent>  <leader>we :WinResizerStartResize<CR>
nnoremap <silent> <leader>wco :only<cr>
nnoremap <silent> <leader>wcc :cclose<cr>
" }}}

" Set working directory
" nnoremap <leader>. :lcd %:p:h<CR>

" F: FINDING SOMETHING {{{
nnoremap <silent> <leader>fs :<C-u>CocList -I grep<CR>
nnoremap <silent> <leader>ff :<C-u>CocList files<CR>
nnoremap <silent> <leader>fl :<C-u>CocList -I lines<CR>
nnoremap <silent> <leader>fW :<C-u>CocList windows<CR>
nnoremap <silent> <leader>fw  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
nnoremap <silent> <leader>fh :<C-u>CocList mru<CR>
nnoremap <silent> <leader>fx :<C-u>CocList commands<CR>
nnoremap <silent> <leader>fm :<C-u>CocList maps<CR>
nnoremap <silent> <leader>fc :<C-u>CocList --normal commits<CR>
nnoremap <silent> <leader>fb :<C-u>CocList --normal bcommits<CR>
" }}}

" B: BUFFER RELATED {{{
noremap <leader>bp :bp<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>
noremap <silent> <leader>bf :<C-u>CocList buffers<CR>
noremap <silent> <leader>bq :%bd!\|e#<CR>
" }}}

" TERMINAL {{{
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <leader>te :terminal<CR>
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
