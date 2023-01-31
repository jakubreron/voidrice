[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

function __setup_defaults() {
  stty stop undef	# Disable ctrl-s to freeze terminal.

  setopt GLOB_DOTS
  setopt EXTENDED_GLOB NOMATCH MENU_COMPLETE
  setopt AUTO_CD
  setopt INTERACTIVE_COMMENTS
  setopt LIST_PACKED
}

function __setup_history() {
  setopt EXTENDED_HISTORY   # Write the history file in the ":start:elapsed;command" format.
  setopt HIST_FCNTL_LOCK    # Use  system’s fcntl call where available (better performance)
  setopt HIST_IGNORE_SPACE  # Do not record an entry starting with a space.
  setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry.
  setopt HIST_VERIFY        # Do not execute immediately upon history expansion.
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
plug "$ZDOTDIR/zsh-vim-mode"
plug "$ZDOTDIR/zsh-keybinds"
plug "$ZDOTDIR/zsh-functions"
