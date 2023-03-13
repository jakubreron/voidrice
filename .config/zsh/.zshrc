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
plug "$ZDOTDIR/zsh-keybinds"
plug "$ZDOTDIR/zsh-functions"

if [[ $(uname) == "Darwin" ]]; then
  #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
