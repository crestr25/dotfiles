#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
# Mine
export EDITOR="nvim"

# zshvim escape insert
# export VI_MODE_ESC_INSERT="jj" 
# Language specific
export GOPATH=$HOME/go

# Tools
export PYENV_ROOT="$HOME/.pyenv"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
