#!/usr/bin/env bash

theme="adw-gtk3"

"$XDG_BIN_HOME"/themes/set-gtk-theme $theme

gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
