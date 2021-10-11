-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  { "BufWritePost", "bm-files,bm-dirs", "!shortcuts" },
  { "BufRead,BufNewFile", "Xresources,Xdefaults,xresources,xdefaults", "set filetype=xdefaults" },
  { "BufWritePost", "Xresources,Xdefaults,xresources,xdefaults", "!xrdb %" },
  { "BufWritePost", "~/.local/src/st/config.h", "!cd ~/.local/src/st/; sudo make install" },
  { "BufWritePost", "~/.local/src/dmenu/config.h", "!cd ~/.local/src/dmenu/; sudo make install" },
  {
    "BufWritePost",
    "~/.local/src/dwm/config.h",
    "!cd ~/.local/src/dwm/; sudo make install && kill -HUP $(pgrep -u $USER 'dwm$')",
  },
  {
    "BufWritePost",
    "~/.local/src/dwmblocks/config.h",
    "!cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }",
  },
  {
    "BufWritePost",
    "~/.local/src/sxiv-flexipatch/{config.def,patches.def}.h",
    "!cd ~/.local/src/sxiv-flexipatch/; sudo rm {config,patches}.h && sudo make install",
  },
  {
    "BufWritePost",
    "~/.local/bin/statusbar/*",
    "!{ killall -q dwmblocks;setsid -f dwmblocks }",
  },
  {
    "BufWritePost",
    "~/.config/personal/universal/vimwiki/*",
    "!cd ~/vimwiki; git add *; git commit -m 'docs(vimwiki)'; git push;",
  },
  {
    "BufWritePost",
    "~/.config/personal/arch/README.md",
    "!cd ~/.config/personal/arch; git add *; git commit -m 'docs(readme)'; git push;",
  },
  {
    "BufWritePost",
    "~/.config/personal/universal/README.md",
    "!cd ~/.config/personal/universal; git add .; git commit -m 'docs(readme)'; git push;",
  },
  {
    "BufWritePost",
    "~.config/personal/universal//.gitconfig",
    "!cd ~/.config/personal/universal; git add .; git commit -m 'feat(gitconfig)'; git push;",
  },
  {
    "BufWritePost",
    "~/.config/personal/universal/.ticker.yaml",
    "!cd ~/.config/personal/universal; git add .; git commit -m 'docs(ticker)'; git push;",
  },
  {
    "BufWritePost",
    "~/.config/personal/universal/.config/bookmarks",
    "!cd ~/.config/personal/universal; git add .; git commit -m 'docs(bookmarks)'; git push;",
  },
  {
    "BufWritePost",
    "~/.config/personal/voidrice/.config/shell/aliasrc",
    "!cd ~/.config/personal/voidrice; git add .; git commit -m 'feat(aliases)'; git push;",
  },
  {
    "BufWritePost",
    "~/.config/personal/voidrice/.config/newsboat/urls",
    "!cd ~/.config/personal/voidrice; git add .; git commit -m 'docs(newsboat)'; git push;",
  },
}
