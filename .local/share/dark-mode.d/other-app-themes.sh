#!/bin/sh

dark_theme="mocha"
light_theme="latte"

paths="$HOME/.config/alacritty/alacritty.yml
  $HOME/.config/rofi/config.rasi
  $HOME/.config/lvim/lua/user/builtin/init.lua
  $HOME/.config/btop/btop.conf
  $HOME/.config/fcitx5/conf/classicui.conf
  $HOME/.config/waybar/style.css
  $HOME/.config/tmux/tmux.conf
"

# TODO: add neovim
# TODO: add git update-index assume-unchanged for all paths
# TODO: try to integrate dunst import into the loop

for path in "${paths[@]}"; do
  sed --in-place --follow-symlinks "s/$light_theme/$dark_theme/" $path
done

ln -fs ~/.config/dunst/themes/catppuccin/src/$dark_theme.conf ~/.config/dunst/dunstrc.d/99-theme.conf

# Reload all after paths changes
killall dunst && sleep 1 && nohup dunst &

if pgrep -f "tmux" > /dev/null; then
  tmux source-file ~/.config/tmux/tmux.conf
fi
