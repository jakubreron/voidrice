gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3
gsettings set org.gnome.desktop.interface color-scheme prefer-light

sed '2s/.*/gtk-theme-name=adw-gtk3/' ~/.config/gtk-3.0/settings.ini > temp.ini && \mv temp.ini ~/.config/gtk-3.0/settings.ini
