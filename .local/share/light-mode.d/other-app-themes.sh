dark_theme="mocha"
dark_theme_alternative="macchiato"
light_theme="latte"

# Alacritty
sed --in-place --follow-symlinks "s/$dark_theme/$light_theme/" ~/.config/alacritty/alacritty.yml

# Lvim
sed --in-place --follow-symlinks "s/$dark_theme/$light_theme/" ~/.config/lvim/lua/user/builtin/init.lua

# Tmux
sed --in-place --follow-symlinks "s/$dark_theme_alternative/$light_theme/" ~/.config/tmux/tmux.conf
tmux source-file ~.config/tmux/tmux.conf

