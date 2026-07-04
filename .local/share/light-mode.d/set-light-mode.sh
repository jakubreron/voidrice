#!/bin/sh

notify-send --app-name="darkman" "🌞 Switching to light mode"

gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

"$XDG_BIN_HOME"/set-theme light
