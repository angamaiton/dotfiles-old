" ----------------------------------------------------------------------------
" Movement
" ----------------------------------------------------------------------------

" Up and down by visual lines, not literal lines
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
vnoremap gj j
vnoremap gk k
vnoremap j gj
vnoremap k gk

" ----------------------------------------------------------------------------
" Search
" ----------------------------------------------------------------------------

" Use Silver Searcher to search globally
nnoremap \ :Ag<CR>

" ----------------------------------------------------------------------------
" Utility
" ----------------------------------------------------------------------------

" Insert current file directory path (without file name)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Get dot command repeatability in visual mode
xnoremap . :normal.<CR>

" Comment/un-comment like Sublime
nnoremap <C-\> :TComment<CR>
vnoremap <C-\> :TComment<CR>

" Complete from open tmux panes (from @junegunn)
inoremap <expr> <C-X><C-K> fzf#complete('cat /usr/share/dict/words')

" Bind K to grep word under cursor
nnoremap K :set nois<CR> :StaticAg <C-R><C-W><CR>

" Re-select prior selection in visual mode
nnoremap gv `[v`]

vmap <silent> <expr> p paste#ReplaceVisualSelectionWithYankRegister()
nnoremap Q :echoe "Disabled Ex mode"<CR>

nnoremap U :echoe "Disabled lowercasing"<CR>
vnoremap U :echoe "Disabled lowercasing"<CR>

" additional vim-rspec mapping
nnoremap <Leader>a :TestSuite<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
noremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Fix indentation across file
nnoremap <Leader>i mmgg=G`m<CR>

" http://robots.thoughtbot.com/faster-grepping-in-vim changed from the above blog post to use ag.vim hello
nnoremap <Leader>o :call quickfix#ToggleLocationList()<CR>
nnoremap <Leader>m :w<CR>:Move <C-R>%
nnoremap <Leader>p "*p
nnoremap <Leader>q :call quickfix#ToggleQuickfixList()<CR>
vnoremap <Leader>y "*y
