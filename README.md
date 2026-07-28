
# Dotfiles

Personal desktop and terminal configuration files managed with GNU Stow.

## Install

Clone the repository and run the installer from the repository root:

```bash
./install.sh
```

The installation script:

* installs packages listed in `packages/`
* restores development tools
* creates symbolic links using GNU Stow

Existing configuration files should be moved or removed before running Stow if they conflict with managed files.

## Structure

```
.dotfiles
├── config/
│   └── .config/
│       ├── fish/
│       ├── hypr/
│       ├── nvim/
│       ├── waybar/
│       └── ...
├── home/
│   └── .gitconfig
├── packages/
│   ├── pacman.txt
│   ├── aur.txt
│   ├── npm-global.txt
│   ├── go-tools.txt
│   └── install.sh
└── install.sh
```

## GNU Stow

This repository uses GNU Stow to manage symbolic links.

Configuration files stored in:

```
config/.config/
```

are linked into:

```
~/.config/
```

with:

```bash
stow config
```

Files stored in:

```
home/
```

are linked directly into:

```
~/
```

with:

```bash
stow home
```

## Packages

The `packages/` directory contains the packages required for this Arch/EndeavourOS setup.

Packages are separated into different categories:

* `pacman.txt` → official repository packages
* `aur.txt` → AUR packages installed with `yay`
* `npm-global.txt` → global npm packages
* `go-tools.txt` → Go command-line tools

To restore the configuration on another machine:

```bash
git clone <repository>
cd .dotfiles
./install.sh
```

