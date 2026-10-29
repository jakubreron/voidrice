#!/bin/sh

notify-send --app-name="darkman" "🌞 Switching to light mode"

gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

set-theme light
