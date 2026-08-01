# Dotfiles and scripts for managing them

My personal dotfiles managed with custom scripts.

## Clone repo

```bash
git clone https://github.com/Roddyck/dev-setup.git
```

## Install packages

Repo contains a `run` script that runs one or all of the scripts in the `runs` directory.
Each script installs (if not already installed) neccesary (for me) packages and might also do some configuration.

Requires [pacman](https://wiki.archlinux.org/title/Pacman) and [paru](https://github.com/Morganamilo/paru) to be present.

```bash
./run # runs all scripts
./run [script_name] # runs a single script

# for example:
./run neovim # will run neovim script that installs neovim, lua, lua lsp (see `runs/neovim`)
```

## Symlinking

`dev-env` script creates symlinks for subdirectories in `.config` and `.local` as well symlinks `qmk` configs
and `.zshenv` file (see the script for more details). Can accept `--force` flag to overwrite existing files.
Be careful with this as it will `rm -r` existing configurations.
