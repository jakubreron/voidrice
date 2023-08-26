gsettings set org.gnome.desktop.interface color-scheme prefer-light
gsettings set org.gnome.desktop.interface gtk-theme "$GTK_LIGHT_THEME" # anki and other apps that depend on string "-dark" fix

# old apps fix
sed --in-place --follow-symlinks "s/'$GTK_DARK_THEME'/'$GTK_LIGHT_THEME'/" ~/.xsettingsd 

# multiple gtk versions
ln -fs /usr/share/themes/Catppuccin-Latte-Standard-Blue-light/gtk-4.0/* ~/.config/gtk-4.0/
ln -fs /usr/share/themes/Catppuccin-Latte-Standard-Blue-light/gtk-3.0/* ~/.config/gtk-3.0/
ln -fs /usr/share/themes/Catppuccin-Latte-Standard-Blue-light/gtk-2.0/* ~/.config/gtk-2.0/

if [[ "$STARTUP_DESKTOP" = "X11" ]]; then
  killall -hup xsettingsd
fi
