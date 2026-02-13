#!/bin/sh
HISTSIZE=1000000
SAVEHIST=1000000
# XDG Base directory specification
export XDG_CONFIG_HOME="$HOME/.config"         # Config files
export XDG_CACHE_HOME="$HOME/.cache"           # Cache files
export XDG_DATA_HOME="$HOME/.local/share"      # Application data
export XDG_STATE_HOME="$HOME/.local/state"     # Logs and state files
# Use Neovim as default editor
export EDITOR="nvim"
export VISUAL="nvim"
# Neovim as MANPAGER
export MANPAGER='nvim +Man!'

# Language specific
export GOPATH=$HOME/go

# Tools
export PYENV_ROOT="$HOME/.pyenv"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
