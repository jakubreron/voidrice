dark_theme="mocha"
dark_theme_alternative="macchiato"
light_theme="latte"

# TODO: add neovim
# TODO: add git update-index assume-unchanged for all paths

# Dunst
for path in "${STANDARD_THEME_SWITCHER_PATHS[@]}"; do
  sed --in-place --follow-symlinks "s/$dark_theme/$light_theme/" "$path"
done

for path in "${ALTERNATIVE_THEME_SWITCHER_PATHS[@]}"; do
  sed --in-place --follow-symlinks "s/$dark_theme_alternative/$light_theme/" "$path"
done

# Dunst is different
ln -fs ~/.config/dunst/themes/catppuccin/src/$light_theme.conf ~/.config/dunst/dunstrc.d/99-theme.conf

# Reload all after paths changes
killall dunst && nohup dunst &
tmux source-file ~.config/tmux/tmux.conf
