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
