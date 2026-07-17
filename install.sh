#!/usr/bin/env bash

# Link the tracked dotfiles into $HOME. Existing files are kept in a dated
# backup directory so this script can be run safely on a configured machine.
set -euo pipefail

repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
backup_dir="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

files=(
  "home/.bashrc:.bashrc"
  "config/fastfetch/config.jsonc:.config/fastfetch/config.jsonc"
  "config/fish/config.fish:.config/fish/config.fish"
  "config/gtk-3.0/settings.ini:.config/gtk-3.0/settings.ini"
  "config/gtk-4.0/settings.ini:.config/gtk-4.0/settings.ini"
  "config/hypr/hyprland.conf:.config/hypr/hyprland.conf"
  "config/hypr/hyprland-gui.lua:.config/hypr/hyprland-gui.lua"
  "config/hypr/hyprland.lua:.config/hypr/hyprland.lua"
  "config/hypr/hyprlock.conf:.config/hypr/hyprlock.conf"
  "config/hyprlock/colors.conf:.config/hyprlock/colors.conf"
  "config/hyprlock/music.conf:.config/hyprlock/music.conf"
  "config/kitty/kitty.conf:.config/kitty/kitty.conf"
  "config/mimeapps.list:.config/mimeapps.list"
  "config/mpv/mpv.conf:.config/mpv/mpv.conf"
  "config/nvim/init.lua:.config/nvim/init.lua"
  "config/rofi/config.rasi:.config/rofi/config.rasi"
  "config/starship.toml:.config/starship.toml"
  "config/swaync/config.json:.config/swaync/config.json"
  "config/swaync/style.css:.config/swaync/style.css"
  "config/user-dirs.dirs:.config/user-dirs.dirs"
  "config/waybar/config.jsonc:.config/waybar/config.jsonc"
  "config/waybar/style.css:.config/waybar/style.css"
)

for entry in "${files[@]}"; do
  source_path="$repo_dir/${entry%%:*}"
  target_path="$HOME/${entry#*:}"

  mkdir -p "$(dirname -- "$target_path")"
  if [[ -e "$target_path" || -L "$target_path" ]]; then
    if [[ "$(readlink -f -- "$target_path")" == "$source_path" ]]; then
      continue
    fi
    mkdir -p "$backup_dir/$(dirname -- "${entry#*:}")"
    mv -- "$target_path" "$backup_dir/${entry#*:}"
  fi
  ln -s -- "$source_path" "$target_path"
done

echo "Dotfiles linked. Previous files, if any, are in: $backup_dir"
