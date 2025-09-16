#!/usr/bin/env zsh

# source all settings first
source "$ZDOTDIR/zsh-settings"

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

source "$ZDOTDIR/shortcuts/shortcutrc"
source "$ZDOTDIR/shortcuts/zshnameddirrc"

function lf () {
  # `command` is needed in case `lfcd` is aliased to `lf`
  cd "$(command lf -print-last-dir "$@")"
}

source "$ZDOTDIR/zsh-keybinds"
source "$ZDOTDIR/zsh-vim"
