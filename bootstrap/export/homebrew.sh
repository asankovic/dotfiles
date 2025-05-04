#!/usr/bin/env bash
set -euo pipefail

BREWFILE="$(chezmoi source-path)/bootstrap/track/homebrew/cli.Brewfile"

if ! command -v brew >/dev/null || ! command -v sd >/dev/null; then
  echo "Brewfile not exported. Please ensure both Homebrew and 'sd' are installed, then try again."
  exit 1
fi

echo "Starting Brewfile export and removing VS Code extensions from the dump..."

brew bundle dump --file="$BREWFILE" --describe --force
sd '^vscode.*\r?\n?' '' "$BREWFILE"

echo "Brewfile successfully exported to '$(realpath "$BREWFILE")'."
