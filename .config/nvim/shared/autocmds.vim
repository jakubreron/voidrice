" autocmd VimLeave $DOTFILES_DIR/voidrice/.config/shell/profile* !git add .; git commit -m 'config(profile): ⚙️ auto-commit changes'; git push;
" autocmd VimLeave $DOTFILES_DIR/voidrice/.config/zsh/.zshrc !git add .; git commit -m 'config(zshrc): ⚙️ auto-commit changes'; git push;
" autocmd VimLeave $DOTFILES_DIR/voidrice/.config/shell/aliasrc* !git add .; git commit -m 'config(aliases): ⚙️ auto-commit changes'; git push;
" autocmd VimLeave $DOTFILES_DIR/universal/.config/git/config !git add .; git commit -m 'config(git): ⚙️ auto-commit changes'; git push;
" autocmd VimLeave $DOTFILES_DIR/universal/.config/git/.gitignore_global !git add .; git commit -m 'config(gitignore_global): ⚙️ auto-commit changes'; git push;
" autocmd VimLeave $DOTFILES_DIR/universal/.config/bookmarks !git add .; git commit -m 'docs(bookmarks): ✏️ auto-commit changes'; git push;

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
