#!/usr/bin/env zsh

# NOTE: this file is being read when interactive (completions, aliases, prompt, etc)
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# General
stty stop undef	# Disable ctrl-s to freeze terminal.
setopt LIST_PACKED

# History
setopt HIST_FCNTL_LOCK    # Use system’s fcntl call where available (better performance)
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY      # Share history between all sessions.

plug "$XDG_CONFIG_HOME/shell/aliasrc"
plug "$XDG_CONFIG_HOME/shell/shortcutrc"
plug "$XDG_CONFIG_HOME/shell/zshnameddirrc"

plug "$ZDOTDIR/zsh-plugins"
plug "$ZDOTDIR/zsh-functions"
plug "$ZDOTDIR/zsh-keybinds"

if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi
