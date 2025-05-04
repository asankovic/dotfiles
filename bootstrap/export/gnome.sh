#!/usr/bin/env bash

CHEZMOI_GNOME_TRACK_DIR="$(chezmoi source-path)/bootstrap/track/gnome"

# gnome extensions
gnome-extensions list > "$CHEZMOI_GNOME_TRACK_DIR/gnome-extensions.txt"

# dconf
dconf dump /org/gnome/desktop/wm/ > "$CHEZMOI_GNOME_TRACK_DIR/wm.ini"
dconf dump /org/gnome/desktop/background/ > "$CHEZMOI_GNOME_TRACK_DIR/background.ini"
dconf dump /org/gnome/desktop/screensaver/ > "$CHEZMOI_GNOME_TRACK_DIR/screensaver.ini"
dconf dump /org/gnome/desktop/interface/ > "$CHEZMOI_GNOME_TRACK_DIR/interface.ini"
dconf dump /org/gnome/shell/ > "$CHEZMOI_GNOME_TRACK_DIR/shell.ini"

echo "Exported gnome extension list and dconfs to '$CHEZMOI_GNOME_TRACK_DIR'"
