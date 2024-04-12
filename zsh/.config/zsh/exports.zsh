#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export VI_MODE_ESC_INSERT="jj" 
export GOPATH=$HOME/go
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
