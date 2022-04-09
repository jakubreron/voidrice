# some useful options (man zshoptions)
stty stop undef		# Disable ctrl-s to freeze terminal.

setopt extendedglob nomatch menucomplete
setopt autocd		# Automatically cd into typed directory.
setopt interactive_comments

# Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ZSH_THEME="powerlevel10k/powerlevel10k"

# Path to oh-my-zsh installation.
# source $ZDOTDIR/.oh-my-zsh/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.config/personal/universal/shell/.p10k.zsh.
# [[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# eval "$(oh-my-posh --init --shell zsh --config ~/.config/zsh/theme.omp.json)"

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
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

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Useful Functions
source "$ZDOTDIR/zsh-functions"

chpwd() {
  ls -la
}

# Normal files to source
if [[ $OSTYPE == 'darwin'* ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_completion "esc/conda-zsh-completion" false

# Key bindings
bindkey -s '^o' '${CLI_FILE_EXPLORER}\n' # open
bindkey -s '^b' '${GUI_FILE_EXPLORER} .\n' # browse
bindkey -s '^g' '${GIT_CLIENT}\n' # git
bindkey -s '^d' '${DOCKER_CLIENT}\n' # docker
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n' # find
bindkey '^[[P' delete-char
