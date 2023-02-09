gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

sed '2s/.*/gtk-theme-name=adw-gtk3-dark/' ~/.config/gtk-3.0/settings.ini > temp.ini && \mv temp.ini ~/.config/gtk-3.0/settings.ini
