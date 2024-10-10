#!/usr/bin/env zsh

# NOTE: this file is being read when interactive (completions, aliases, prompt, etc)
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# General
stty stop undef	# Disable ctrl-s to freeze terminal.

setopt LIST_PACKED # Try to make the completion list smaller (occupying less lines) by printing the matches in columns with different widths.
setopt HIST_FCNTL_LOCK  # Use system’s fcntl call where available (better performance)

plug "$XDG_CONFIG_HOME/shell/aliasrc"
plug "$XDG_CONFIG_HOME/shell/shortcutrc"
plug "$XDG_CONFIG_HOME/shell/zshnameddirrc"

plug "$ZDOTDIR/zsh-plugins"
plug "$ZDOTDIR/zsh-functions"
plug "$ZDOTDIR/zsh-keybinds"

if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi
