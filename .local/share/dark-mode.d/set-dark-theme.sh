#!/bin/sh

notify-send --app-name="darkman" "🌙 Switching to dark mode"

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

set-theme dark
