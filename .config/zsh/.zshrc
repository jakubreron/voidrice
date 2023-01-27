[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# some useful options (man zshoptions)
stty stop undef	# Disable ctrl-s to freeze terminal.

setopt glob_dots
setopt extendedglob nomatch menucomplete
setopt autocd		# Automatically cd into typed directory.
setopt interactive_comments

# Load shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

chpwd() {
  ls -la
}

# Normal files to source
if [[ $OSTYPE == 'darwin'* ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "hlissner/zsh-autopair"

# Files
plug "$ZDOTDIR/zsh-exports"
plug "$ZDOTDIR/zsh-prompt"
plug "$ZDOTDIR/zsh-vim-mode"
plug "$ZDOTDIR/zsh-keybinds"
plug "$ZDOTDIR/zsh-functions"
plug "$XDG_CONFIG_HOME/shell/aliasrc"

