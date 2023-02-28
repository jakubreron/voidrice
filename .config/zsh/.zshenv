# NOTE: read every time (variables that need to be updated frequently, like new scripts, packages)

bin_list=(
  "$HOME/.local/share/cargo/bin"
  )

for extra in "${bin_list[@]}"; do
  PATH=$extra:$PATH
done
export PATH
unset bin_list

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
  bin_list=(
    "/opt/local/bin:/opt/local/sbin"
    "${$(gfind $HOME/.local/bin -type d -printf %p:)%%:}"
    )

  for extra in "${bin_list[@]}"; do
    PATH=$extra:$PATH
  done
  export PATH
  unset bin_list
fi
