#!/usr/bin/env bash

# theme="Catppuccin-Mocha-Standard-Blue-dark"
theme="adw-gtk3-dark"

"$XDG_BIN_HOME"/themes/set-gtk-theme $theme

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
