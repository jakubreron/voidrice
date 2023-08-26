dark_theme="mocha"
dark_theme_alternative="macchiato"
light_theme="latte"

# Alacritty
sed --in-place --follow-symlinks "s/$light_theme/$dark_theme/" ~/.config/alacritty/alacritty.yml

# Lvim
sed --in-place --follow-symlinks "s/$light_theme/$dark_theme/" ~/.config/lvim/lua/user/builtin/init.lua

# Tmux
sed --in-place --follow-symlinks "s/$light_theme/$dark_theme_alternative/" ~/.config/tmux/tmux.conf
tmux source-file ~.config/tmux/tmux.conf

