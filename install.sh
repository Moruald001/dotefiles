#!/usr/bin/env bash

set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

echo "======================================"
echo " Installing dotfiles"
echo "======================================"

# Vérifier GNU Stow
if ! command -v stow >/dev/null 2>&1; then
    echo "GNU Stow n'est pas installé."
    echo "Installe-le puis relance ce script."
    exit 1
fi

# Installer les paquets
if [[ -f "$repo_dir/packages/install.sh" ]]; then
    echo
    echo "Installing packages..."
    bash "$repo_dir/packages/install.sh"
fi

echo
echo "Creating symlinks with GNU Stow..."

cd "$repo_dir"

stow home
stow config

echo
echo "Installation completed successfully!"
