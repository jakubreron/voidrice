dark_theme="mocha"
dark_theme_alternative="macchiato"
light_theme="latte"

# TODO: add neovim

# Dunst
ln -fs ~/.config/dunst/themes/catppuccin/src/$dark_theme.conf ~/.config/dunst/dunstrc.d/99-theme.conf
killall dunst && nohup dunst &

# Alacritty
sed --in-place --follow-symlinks "s/$light_theme/$dark_theme/" ~/.config/alacritty/alacritty.yml

# Lvim
sed --in-place --follow-symlinks "s/$light_theme/$dark_theme/" ~/.config/lvim/lua/user/builtin/init.lua

# Tmux
sed --in-place --follow-symlinks "s/$light_theme/$dark_theme_alternative/" ~/.config/tmux/tmux.conf
tmux source-file ~.config/tmux/tmux.conf

# Btop
sed --in-place --follow-symlinks "s/$light_theme/$dark_theme/" ~/.config/btop/btop.conf

# SDDM
sudo sed --in-place --follow-symlinks "s/$light_theme/$dark_theme/" /etc/sddm.conf.d/autologin.conf

# Waybar
sed --in-place --follow-symlinks "s/light-theme/dark-theme/" ~/.config/waybar/style.css

# Fcitx5
sed --in-place --follow-symlinks "s/$light_theme/$dark_theme/" ~/.config/fcitx5/conf/classicui.conf

# Hyprland
if [[ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]];then
  hyprctl hyprpaper wallpaper ",$DARK_MODE_WALLPAPER"
fi
