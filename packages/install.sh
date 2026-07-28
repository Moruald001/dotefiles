#!/usr/bin/env bash

set -e

echo "Installing pacman packages..."
sudo pacman -S --needed - < pacman.txt

echo "Installing AUR packages..."
yay -S --needed - < aur.txt

echo "Installing npm global packages..."
while IFS= read -r package; do
    [[ -z "$package" ]] && continue
    npm install -g "$package"
done < npm-global.txt

echo "Installing Go tools..."
while IFS= read -r tool; do
    [[ -z "$tool" ]] && continue
    go install "${tool}@latest"
done < go-tools.txt

echo "Done!"
