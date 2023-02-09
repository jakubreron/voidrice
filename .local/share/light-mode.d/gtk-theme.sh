gsettings set org.gnome.desktop.interface color-scheme prefer-light

sed --in-place --follow-symlinks 's/adw-gtk3-dark/adw-gtk3/' ~/.xsettingsd
killall -HUP xsettingsd

