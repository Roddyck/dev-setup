export VISUAL=nvim
export EDITOR="$VISUAL"

# XDG Paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# Fix paths
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_CACHE_HOME"/zsh/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GOPATH="$XDG_DATA_HOME"/go
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export N_PREFIX=$XDG_DATA_HOME/n

. "$CARGO_HOME/env"

# Some other stuff
export DEV_ENV=$HOME/personal/dev
