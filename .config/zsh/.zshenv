dynamic_bin_list=(
  "$HOME/.local/share/cargo/bin"
  )

for extra in "${dynamic_bin_list[@]}"; do
  PATH=$extra:$PATH
done
export PATH
unset dynamic_bin_list

if [[ $OSTYPE == 'linux'* ]]; then
  dynamic_bin_list=(
    "${$(find $HOME/.local/bin -type d -printf %p:)%%:}"
    )

  for extra in "${dynamic_bin_list[@]}"; do
    PATH=$extra:$PATH
  done
  export PATH
  unset dynamic_bin_list
else
  dynamic_bin_list=(
    "/opt/local/bin:/opt/local/sbin"
    "${$(gfind $HOME/.local/bin -type d -printf %p:)%%:}"
    )

  for extra in "${dynamic_bin_list[@]}"; do
    PATH=$extra:$PATH
  done
  export PATH
  unset dynamic_bin_list
fi
