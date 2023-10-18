#!/usr/bin/env bash

# theme="Catppuccin-Mocha-Standard-Blue-dark"
theme="adw-gtk3-dark"

"$XDG_BIN_HOME"/themes/switch-gtk-theme-to "$theme"

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
