# Dotfiles and scripts for managing them

Includes my personal dotfiles in `env/.config` and local scripts in `env/.local`

## Clone repo

```bash
git clone https://github.com/Roddyck/dev-setup.git
```

## Copy config files and scripts

`dev-env` script will copy or update files from `env`. Needs `$DEV_EVN` 
environment variable to be set to the path to this directory.

You can optionally pass argument to the script to specify which config to copy
or update.

```bash
DEV_ENV=PATH_TO_THIS_DIR_ON_YOUR_SYSTEM ./dev-env [config_name]
```

## Install packages

to install all packages run the `run` script (requires paru to be installed).
It runs all scripts in `runs/` directory and logs stuff to terminal

You can optionally pass argument to the script to specify which script to run

For now you need to run zsh script first and reload your shell to properly set
xdg style paths for stuff like rust, node, etc.

```bash
./run [script_name]
```
