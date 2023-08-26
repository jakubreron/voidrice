light_theme="Catppuccin-Latte-Standard-Blue-light"
dark_theme="Catppuccin-Mocha-Standard-Blue-dark"

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme "$dark_theme" # anki and other apps that depend on string "-dark" fix

# old apps fix
sed --in-place --follow-symlinks "s/$light_theme/$dark_theme/" ~/.config/gtk-4.0/settings.ini

# multiple gtk versions
ln -fs /usr/share/themes/$dark_theme/gtk-4.0/* ~/.config/gtk-4.0/
ln -fs /usr/share/themes/$dark_theme/gtk-3.0/* ~/.config/gtk-3.0/
ln -fs /usr/share/themes/$dark_theme/gtk-2.0/* ~/.config/gtk-2.0/

if [[ "$STARTUP_DESKTOP" = "X11" ]]; then
sed --in-place --follow-symlinks "s/$light_theme/$dark_theme/" ~/.xsettingsd 
  killall -hup xsettingsd
fi
