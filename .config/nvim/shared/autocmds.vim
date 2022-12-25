" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

" Ensure files are read as what I want:
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd VimLeave bm-files,bm-dirs,bm-websites !shortcuts; git add .; git commit -m 'config(bm-{dirs,files,websites}): ⚙️ auto-commit changes'; git push
" Auto commit dotfiles changes
autocmd VimLeave $DOTFILES_DIR/voidrice/.config/lf/lfrc !git add .; git commit -m 'config(lfrc): ⚙️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/voidrice/.config/picom.conf !git add .; git commit -m 'config(picom): ⚙️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/voidrice/.config/shell/profile* !git add .; git commit -m 'config(profile): ⚙️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/voidrice/.config/newsboat/urls !git add .; git commit -m 'docs(newsboat): ✏️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/voidrice/.config/zsh/.zshrc !git add .; git commit -m 'config(zshrc): ⚙️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/voidrice/.config/shell/aliasrc* !git add .; git commit -m 'config(aliases): ⚙️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/universal/Documents/vimwiki/* !git add *; git commit -m 'docs(vimwiki): ✏️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/universal/.ticker.yaml !git add .; git commit -m 'docs(ticker): ✏️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/universal/.config/git/config !git add .; git commit -m 'config(git): ⚙️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/universal/.config/git/.gitignore_global !git add .; git commit -m 'config(gitignore_global): ⚙️ auto-commit changes'; git push;
autocmd VimLeave $DOTFILES_DIR/universal/.config/bookmarks !git add .; git commit -m 'docs(bookmarks): ✏️ auto-commit changes'; git push;

" Recompile suckless scripts on save
autocmd VimLeave ~/.local/src/st/config.h !cd ~/.local/src/st/; sudo make install
autocmd VimLeave ~/.local/src/dmenu/config.h !cd ~/.local/src/dmenu/; sudo make install
autocmd VimLeave ~/.local/src/dwm/config.h !cd ~/.local/src/dwm/; sudo make install && kill -HUP $(pgrep -u $USER "\bdwm$")
autocmd VimLeave ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }
autocmd VimLeave ~/.local/bin/statusbar/* !{ killall -q dwmblocks;setsid -f dwmblocks }

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
