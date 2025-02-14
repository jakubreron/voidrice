#!/usr/bin/env zsh

# NOTE: this file is being read once, at login (variables and settings that don't need to be updated frequently)

OS="$(uname -s)"

source $HOME/.config/zsh/profile/profile.all

case "$OS" in
  Linux)
    source $HOME/.config/zsh/profile/profile.linux
    ;;
  Darwin)
    source $HOME/.config/zsh/profile/profile.osx
    ;;
esac

unsetopt PROMPT_SP
