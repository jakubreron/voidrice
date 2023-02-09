gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

sed --in-place --follow-symlinks 's/adw-gtk3/adw-gtk3-dark/' ~/.xsettingsd
killall -HUP xsettingsd

