#!/usr/bin/env zsh

# NOTE: this file is being read when interactive (completions, aliases, prompt, etc)
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# source all settings first
plug "$ZDOTDIR/zsh-settings"

OS="$(uname -s)"

source $HOME/.config/zsh/aliases/aliasrc.all

case "$OS" in
  Linux)
    source $HOME/.config/zsh/aliases/aliasrc.linux
    ;;
  Darwin)
    source $HOME/.config/zsh/aliases/aliasrc.osx
    ;;
esac

plug "$ZDOTDIR/shortcuts/shortcutrc"
plug "$ZDOTDIR/shortcuts/zshnameddirrc"

plug "$ZDOTDIR/zsh-functions"
plug "$ZDOTDIR/zsh-keybinds"
# source all plugins at the end
plug "$ZDOTDIR/zsh-plugins"
