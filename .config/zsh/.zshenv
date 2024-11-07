#!/usr/bin/env zsh

# NOTE: this file is read every time (variables that need to be updated frequently, like new scripts, packages)

OS="$(uname -s)"

if [[ -d "$HOME/.local/share/cargo/bin" ]]; then
  export PATH=$HOME/.local/share/cargo/bin:$PATH
fi

case "$OS" in
  Linux)
    linux_bin_list=(
      "${$(find $HOME/.yarn/bin -type d -printf %p:)%%:}"
      "${$(find $HOME/.local/bin -type d -printf %p:)%%:}"
    )

    for extra in "${linux_bin_list[@]}"; do
      PATH=$extra:$PATH
    done
    export PATH
    unset linux_bin_list
    ;;
  Darwin)
    macos_bin_list=(
      "/opt/local/bin:/opt/local/sbin"
      "$(brew --prefix mysql-client)/bin"
      "${$(gfind $HOME/.local/bin -type d -printf %p:)%%:}"
    )

    for extra in "${macos_bin_list[@]}"; do
      PATH=$extra:$PATH
    done
    export PATH
    unset macos_bin_list
    ;;
esac

unsetopt PROMPT_SP
