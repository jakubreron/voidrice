dark_theme="mocha"
dark_theme_alternative="macchiato"
light_theme="latte"

# Dunst
ln -fs ~/.config/dunst/themes/catppuccin/src/$light_theme.conf ~/.config/dunst/dunstrc.d/99-theme.conf
killall dunst && nohup dunst &

# Alacritty
sed --in-place --follow-symlinks "s/$dark_theme/$light_theme/" ~/.config/alacritty/alacritty.yml

# Lvim
sed --in-place --follow-symlinks "s/$dark_theme/$light_theme/" ~/.config/lvim/lua/user/builtin/init.lua

# Tmux
sed --in-place --follow-symlinks "s/$dark_theme_alternative/$light_theme/" ~/.config/tmux/tmux.conf
tmux source-file ~.config/tmux/tmux.conf

# Btop
sed --in-place --follow-symlinks "s/$dark_theme/$light_theme/" ~/.config/btop/btop.conf
