gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme "$GTK_DARK_THEME" # anki and other apps that depend on string "-dark" fix

# old apps fix
sed --in-place --follow-symlinks "s/Catppuccin-Latte-Standard-Blue-light/Catppuccin-Mocha-Standard-Blue-dark/" ~/.xsettingsd 
sed --in-place --follow-symlinks "s/Catppuccin-Latte-Standard-Blue-light/Catppuccin-Mocha-Standard-Blue-dark/" ~/.config/gtk-4.0/settings.ini

# multiple gtk versions
ln -fs /usr/share/themes/$GTK_DARK_THEME/gtk-4.0/* ~/.config/gtk-4.0/
ln -fs /usr/share/themes/$GTK_DARK_THEME/gtk-3.0/* ~/.config/gtk-3.0/
ln -fs /usr/share/themes/$GTK_DARK_THEME/gtk-2.0/* ~/.config/gtk-2.0/

killall -hup xsettingsd
