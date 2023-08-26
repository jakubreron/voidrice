gsettings set org.gnome.desktop.interface color-scheme prefer-light
gsettings set org.gnome.desktop.interface gtk-theme "$GTK_LIGHT_THEME" # anki and other apps that depend on string "-dark" fix

# old apps fix
sed --in-place --follow-symlinks "s/Catppuccin-Mocha-Standard-Blue-dark/Catppuccin-Latte-Standard-Blue-light/" ~/.xsettingsd 
sed --in-place --follow-symlinks "s/Catppuccin-Mocha-Standard-Blue-dark/Catppuccin-Latte-Standard-Blue-light/" ~/.config/gtk-4.0/settings.ini

# multiple gtk versions
ln -fs /usr/share/themes/$GTK_LIGHT_THEME/gtk-4.0/* ~/.config/gtk-4.0/
ln -fs /usr/share/themes/$GTK_LIGHT_THEME/gtk-3.0/* ~/.config/gtk-3.0/
ln -fs /usr/share/themes/$GTK_LIGHT_THEME/gtk-2.0/* ~/.config/gtk-2.0/

killall -hup xsettingsd
