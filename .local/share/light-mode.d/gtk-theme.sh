# theme="Catppuccin-Latte-Standard-Blue-light"
theme="adw-gtk3"

# old apps fix
sed --in-place --follow-symlinks "s/gtk-theme-name=.*/gtk-theme-name=$theme/" ~/.config/gtk-3.0/settings.ini
sed --in-place --follow-symlinks "s/gtk-theme-name=.*/gtk-theme-name=$theme/" ~/.config/gtk-4.0/settings.ini

# multiple gtk versions
ln -fs /usr/share/themes/$theme/gtk-4.0/* ~/.config/gtk-4.0/
ln -fs /usr/share/themes/$theme/gtk-3.0/* ~/.config/gtk-3.0/

import-gsettings
gsettings set org.gnome.desktop.interface color-scheme prefer-light
