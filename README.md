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

## Packages

The `packages/` directory records explicitly installed packages on this
Arch/EndeavourOS machine. Repository packages and AUR packages are deliberately
separate; `packages/install.sh` restores both (using `yay` for the AUR). It
also restores the Go command-line tools listed in `packages/go-tools.txt`.

```bash
./packages/install.sh
```

## GitHub over SSH

Fish starts an SSH agent using `~/.ssh/agent/ssh-agent.sock`. After creating
and adding your public key to GitHub, load the private key once per login:

```fish
ssh-add ~/.ssh/id_ed25519_github
```
 
