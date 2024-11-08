#!/usr/bin/env bash

gtk_theme="adw-gtk3"
kvantum_theme="KvLibadwaita"

"$XDG_BIN_HOME"/themes/set-kde-gtk-theme $gtk_theme 
"$XDG_BIN_HOME"/themes/set-kde-kvantum-theme $kvantum_theme
