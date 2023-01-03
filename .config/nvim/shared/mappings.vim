" Jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count: "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count: "") . 'j'

" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>

" Save file as sudo on files that require root permission
" cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Copy to end on Y
nnoremap Y y$

" Keep it center
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
