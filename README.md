# Dotfiles

Personal desktop and terminal configuration files.

## Install

Run this from the repository root:

```bash
./install.sh
```

The script creates symbolic links in the home directory. It first moves an
existing file to `~/.dotfiles-backup/<date>/`, so it does not silently discard
your configuration.

## Intentionally excluded

This repository excludes application state and sensitive material, including
browser profiles, caches, cookies, tokens, SSH keys, KDE Connect certificates,
and PulseAudio cookies.
