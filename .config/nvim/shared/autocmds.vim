" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd VimLeave bm-files,bm-dirs !shortcuts; git add .; git commit -m 'config(bm-dirs/files): ⚙️ auto-commit changes'; git push

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

" Ensure files are read as what I want:
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Auto commit vimwiki changes
autocmd VimLeave $DOTFILES_DIR/universal/Documents/vimwiki/* !git add *; git commit -m 'docs(vimwiki): ✏️ auto-commit changes'; git push;

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Recompile suckless scripts on save
autocmd VimLeave ~/.local/src/st/config.h !cd ~/.local/src/st/; sudo make install
autocmd VimLeave ~/.local/src/dmenu/config.h !cd ~/.local/src/dmenu/; sudo make install
autocmd VimLeave ~/.local/src/dwm/config.h !cd ~/.local/src/dwm/; sudo make install && kill -HUP $(pgrep -u $USER "\bdwm$")
autocmd VimLeave ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }
autocmd VimLeave ~/.local/bin/statusbar/* !{ killall -q dwmblocks;setsid -f dwmblocks }

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
