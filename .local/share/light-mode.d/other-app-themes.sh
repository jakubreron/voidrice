dark_theme="mocha"
dark_theme_alternative="macchiato"
light_theme="latte"

# TODO: add neovim
# TODO: add git update-index assume-unchanged for all paths

printf "%s" "$STANDARD_THEME_SWITCHER_PATHS" | while read -r path; do
  sed --in-place --follow-symlinks "s/$dark_theme/$light_theme/" "$path"
done >/dev/null 2>&1

printf "%s" "$ALTERNATIVE_THEME_SWITCHER_PATHS" | while read -r path; do
  sed --in-place --follow-symlinks "s/$dark_theme_alternative/$light_theme/" "$path"
done >/dev/null 2>&1

# Dunst is different
ln -fs ~/.config/dunst/themes/catppuccin/src/$light_theme.conf ~/.config/dunst/dunstrc.d/99-theme.conf

# Reload all after paths changes
killall dunst && nohup dunst &
tmux source-file ~.config/tmux/tmux.conf
