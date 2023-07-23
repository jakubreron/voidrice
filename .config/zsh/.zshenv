#!/usr/bin/env zsh

# NOTE: read every time (variables that need to be updated frequently, like new scripts, packages)

OS="$(uname -s)"

case "$OS" in
  Linux)
    bin_list=(
      "${$(find $HOME/.yarn/bin -type d -printf %p:)%%:}"
      "${$(find $HOME/.local/bin -type d -printf %p:)%%:}"
    )

    for extra in "${bin_list[@]}"; do
      PATH=$extra:$PATH
    done
    export PATH
    unset bin_list
    ;;
  Darwin)
    bin_list=(
      "${$(gfind $HOME/.local/bin -type d -printf %p:)%%:}"
    )

    for extra in "${bin_list[@]}"; do
      PATH=$extra:$PATH
    done
    export PATH
    unset bin_list
    ;;
esac
