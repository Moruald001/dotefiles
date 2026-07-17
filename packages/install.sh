#!/usr/bin/env bash

# Restore the packages recorded on this Arch/EndeavourOS installation.
set -euo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

sudo pacman -S --needed - < "$script_dir/pacman.txt"

if [[ -s "$script_dir/aur.txt" ]]; then
  if ! command -v yay >/dev/null; then
    echo "yay is required to install AUR packages listed in aur.txt." >&2
    exit 1
  fi
  yay -S --needed - < "$script_dir/aur.txt"
fi

if [[ -s "$script_dir/npm-global.txt" ]]; then
  xargs -r npm install --global < "$script_dir/npm-global.txt"
fi
