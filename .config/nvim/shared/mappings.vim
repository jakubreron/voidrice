" Jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count: "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count: "") . 'j'

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
