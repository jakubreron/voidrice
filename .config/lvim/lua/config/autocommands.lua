-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWritePost", "bm-files,bm-dirs", "!shortcuts" },
  { "BufRead,BufNewFile", "Xresources,Xdefaults,xresources,xdefaults", "set filetype=xdefaults" },
  { "BufWritePost", "Xresources,Xdefaults,xresources,xdefaults", "!xrdb %" },
  { "VimLeave", "~/.local/src/st/config.h", "!cd ~/.local/src/st/; sudo make install" },
  { "VimLeave", "~/.local/src/dmenu/config.h", "!cd ~/.local/src/dmenu/; sudo make install" },
  {
    "VimLeave",
    "~/.local/src/dwm/config.h",
    "!cd ~/.local/src/dwm/; sudo make install && kill -HUP $(pgrep -u $USER 'dwm$')",
  },
  {
    "BufWritePost",
    "~/.local/src/dwmblocks/config.h",
    "!cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }",
  },
  {
    "VimLeave",
    "~/.local/src/sxiv-flexipatch/{config.def,patches.def}.h",
    "!cd ~/.local/src/sxiv-flexipatch/; sudo rm {config,patches}.h && sudo make install",
  },
  {
    "VimLeave",
    "~/.local/bin/statusbar/*",
    "!{ killall -q dwmblocks;setsid -f dwmblocks }",
  },
  {
    "VimLeave",
    "~/.config/personal/universal/vimwiki/*",
    "!cd ~/vimwiki; git add *; git commit -m 'docs(vimwiki)'; git push;",
  },
  {
    "VimLeave",
    "~/.config/personal/arch/README.md",
    "!cd ~/.config/personal/arch; git add *; git commit -m 'docs(readme)'; git push;",
  },
  {
    "VimLeave",
    "~/.config/personal/universal/README.md",
    "!cd ~/.config/personal/universal; git add .; git commit -m 'docs(readme)'; git push;",
  },
  {
    "VimLeave",
    "~.config/personal/universal/.gitconfig",
    "!cd ~/.config/personal/universal; git add .; git commit -m 'feat(gitconfig)'; git push;",
  },
  {
    "VimLeave",
    "~/.config/personal/universal/.ticker.yaml",
    "!cd ~/.config/personal/universal; git add .; git commit -m 'docs(ticker)'; git push;",
  },
  {
    "VimLeave",
    "~/.config/personal/universal/.config/bookmarks",
    "!cd ~/.config/personal/universal; git add .; git commit -m 'docs(bookmarks)'; git push;",
  },
  {
    "VimLeave",
    "~/.config/personal/voidrice/.config/shell/aliasrc",
    "!cd ~/.config/personal/voidrice; git add .; git commit -m 'feat(aliases)'; git push;",
  },
  {
    "VimLeave",
    "~/.config/personal/voidrice/.config/newsboat/urls",
    "!cd ~/.config/personal/voidrice; git add .; git commit -m 'docs(newsboat)'; git push;",
  },
}
