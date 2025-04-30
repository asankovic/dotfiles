#!/usr/bin/env bash

PLUGIN_DIR="$HOME/.config/zellij/plugins"

mkdir -p "$PLUGIN_DIR"

declare -A plugins=(
  ["zellij_forgot"]="https://github.com/karimould/zellij-forgot/releases/download/latest/zellij_forgot.wasm"
  ["zjstatus"]="https://github.com/dj95/zjstatus/releases/latest/downloads/zjstatus.wasm"
)

for name in "${!plugins[@]}"; do
  url="${plugins[$name]}"
  file="$PLUGIN_DIR/$name.wasm"

  if [ -f "$file" ]; then
    echo "$file already exists. Skipping download."
  else
    echo "Downloading $name from $url..."
    curl -L -o "$file" "$url"
    if [ $? -eq 0 ]; then
      echo "$name downloaded successfully."
    else
      echo "Failed to download $name."
    fi
  fi
done
