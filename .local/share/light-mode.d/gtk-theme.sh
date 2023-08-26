light_theme="Catppuccin-Latte-Standard-Blue-light"
dark_theme="Catppuccin-Mocha-Standard-Blue-dark"

gsettings set org.gnome.desktop.interface color-scheme prefer-light
gsettings set org.gnome.desktop.interface gtk-theme "$light_theme" # anki and other apps that depend on string "-dark" fix

# old apps fix
sed --in-place --follow-symlinks "s/$dark_theme/$light_theme/" ~/.xsettingsd 
sed --in-place --follow-symlinks "s/$dark_theme/$light_theme/" ~/.config/gtk-4.0/settings.ini

# multiple gtk versions
ln -fs /usr/share/themes/$light_theme/gtk-4.0/* ~/.config/gtk-4.0/
ln -fs /usr/share/themes/$light_theme/gtk-3.0/* ~/.config/gtk-3.0/
ln -fs /usr/share/themes/$light_theme/gtk-2.0/* ~/.config/gtk-2.0/
