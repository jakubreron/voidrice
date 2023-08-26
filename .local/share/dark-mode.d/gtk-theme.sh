gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme "$GTK_DARK_THEME" # anki and other apps that depend on string "-dark" fix

# old apps fix
sed --in-place --follow-symlinks "s/$GTK_LIGHT_THEME/$GTK_DARK_THEME/" ~/.xsettingsd 

if [[ "$STARTUP_DESKTOP" = "X11" ]]; then
  killall -hup xsettingsd
fi

