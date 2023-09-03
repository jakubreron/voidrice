#!/usr/bin/env zsh

# NOTE: read when interactive (completions, aliases, prompt, etc)
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

function __setup_defaults() {
  stty stop undef	# Disable ctrl-s to freeze terminal.
  setopt LIST_PACKED
}

function __setup_history() {
  setopt HIST_FCNTL_LOCK    # Use system’s fcntl call where available (better performance)
  setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
  setopt SHARE_HISTORY      # Share history between all sessions.
}

setup_functions=(
  __setup_defaults
  __setup_history
)

for func in "${setup_functions[@]}"; do
  "$func"
  unset -f "$func"
done
unset setup_functions

plug "$XDG_CONFIG_HOME/shell/aliasrc"
plug "$XDG_CONFIG_HOME/shell/shortcutrc"
plug "$XDG_CONFIG_HOME/shell/zshnameddirrc"

plug "$ZDOTDIR/zsh-plugins"
plug "$ZDOTDIR/zsh-functions"

OS="$(uname -s)"

case "$OS" in
  Linux)
    lfcd () {
      tmp="$(mktemp -uq)"
      trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
      $CLI_FILE_EXPLORER -last-dir-path="$tmp" "$@"
      if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
      fi
    }
    ;;
  Darwin)
    lfcd () {
      tmp="$(mktemp)"
      command $CLI_FILE_EXPLORER -last-dir-path="$tmp" "$@"
      if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
          if [ "$dir" != "$(pwd)" ]; then
            cd "$dir"
          fi
        fi
      fi
    }
    #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    # export SDKMAN_DIR="$HOME/.sdkman"
    # [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    ;;
esac

plug "$ZDOTDIR/zsh-keybinds"
