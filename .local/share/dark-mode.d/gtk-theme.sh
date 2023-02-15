gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark" # anki and other apps that depend on string "-dark" fix

# old apps fix
sed --in-place --follow-symlinks 's/"adw-gtk3"/"adw-gtk3-dark"/' ~/.xsettingsd 
killall -HUP xsettingsd

