autocmd VimLeave $DOTFILES_DIR/voidrice/.config/shell/profile* !git add .; git commit -m 'config(profile): ⚙️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/voidrice/.config/zsh/.zshrc !git add .; git commit -m 'config(zshrc): ⚙️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/voidrice/.config/shell/aliasrc* !git add .; git commit -m 'config(aliases): ⚙️ auto-commit changes'; git push;
autocmd VimLeave $VIMWIKI_DIR/* !git add *; git commit -m 'docs(vimwiki): ✏️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/universal/.config/git/config !git add .; git commit -m 'config(git): ⚙️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/universal/.config/git/.gitignore_global !git add .; git commit -m 'config(gitignore_global): ⚙️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/universal/.config/bookmarks !git add .; git commit -m 'docs(bookmarks): ✏️ auto-commit changes'; git push;

" Recompile suckless scripts on save
autocmd VimLeave ~/.local/src/st/config.h !cd ~/.local/src/st/; sudo make install
autocmd VimLeave ~/.local/src/dmenu/config.h !cd ~/.local/src/dmenu/; sudo make install
autocmd VimLeave ~/.local/src/dwm/config.h !cd ~/.local/src/dwm/; sudo make install && kill -HUP $(pgrep -u $USER "\bdwm$")
autocmd VimLeave ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }
autocmd VimLeave ~/.local/bin/statusbar/* !{ killall -q dwmblocks;setsid -f dwmblocks }

" Turns off highlighting on the bits of code that are changed, 
" so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Set to auto read when a file is changed from the outside
autocmd FocusGained,BufEnter * checktime

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
