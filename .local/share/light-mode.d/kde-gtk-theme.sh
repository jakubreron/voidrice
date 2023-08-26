#!/usr/bin/env bash

# GTK apps are not affected by the Plasma Global Theme, which only applies to Qt based programs.
# GTK themes can be installed here: Global Theme > Application Style > Configure GNOME/GTK Application Style.
# Reference: https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications

#!/usr/bin/env zsh

# NOTE: read once, at login (variables and settings that don't need to be updated frequently)

OS="$(uname -s)"

source $HOME/.config/shell/profile.all

case "$OS" in
  Linux)
    source $HOME/.config/shell/profile.linux
    ;;
  Darwin)
    source $HOME/.config/shell/profile.osx
    ;;
esac

unsetopt PROMPT_SP
dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:Catppuccin-Latte-Standard-Blue-light"
