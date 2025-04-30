#!/usr/bin/env bash

if ! command -v bat &> /dev/null; then
    echo "bat is not installed. Please install bat first."
    exit 1
fi

THEME_URL="https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme"
THEME_DIR="$(bat --config-dir)/themes"
THEME_FILE="$THEME_DIR/Catppuccin Mocha.tmTheme"

mkdir -p "$THEME_DIR"

if [ -f "$THEME_FILE" ]; then
    echo "The theme is already downloaded."
    exit 0
fi

echo "Downloading the Catppuccin Mocha theme..."

if ! curl -L -o "$THEME_FILE" "$THEME_URL"; then
    echo "Error: Failed to download the theme." >&2
    exit 1
fi

echo "Theme downloaded successfully."

echo "Rebuilding bat cache..."
bat cache --build
