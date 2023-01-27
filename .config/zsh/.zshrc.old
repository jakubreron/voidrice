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

source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
source "$ZDOTDIR/zsh-functions"

chpwd() {
  ls -la
}

# Normal files to source
if [[ $OSTYPE == 'darwin'* ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-history-substring-search"
zsh_add_plugin "hlissner/zsh-autopair"


zsh_add_file "zsh-exports"
zsh_add_file "zsh-prompt"
# Normal files to source that depend on some plugins
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-keybinds"
