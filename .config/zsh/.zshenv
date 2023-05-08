# NOTE: read every time (variables that need to be updated frequently, like new scripts, packages)

if [[ $OSTYPE == 'linux'* ]]; then
  bin_list=(
    "${$(find $HOME/.local/bin -type d -printf %p:)%%:}"
    )

  for extra in "${bin_list[@]}"; do
    PATH=$extra:$PATH
  done
  export PATH
  unset bin_list
else
  eval $(/opt/homebrew/bin/brew shellenv)
  bin_list=(
    "${$(gfind $HOME/.local/bin -type d -printf %p:)%%:}"
    )

  for extra in "${bin_list[@]}"; do
    PATH=$extra:$PATH
  done
  export PATH
  unset bin_list
fi
