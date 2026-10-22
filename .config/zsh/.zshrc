#!/usr/bin/env zsh

# GPG auth for git, gpg encryption, etc...
export GPG_TTY=$(tty)

# source all settings first
source "$ZDOTDIR/zsh-settings"

OS="$(uname -s)"

source $ZDOTDIR/aliases/aliasrc.all

case "$OS" in
  Linux)
    source $ZDOTDIR/aliases/aliasrc.linux
    ;;
  Darwin)
    source $ZDOTDIR/aliases/aliasrc.osx
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
