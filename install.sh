#!/bin/bash

##########
## NVIM ##
##########

mkdir -p $HOME/.config/nvim

ln -sf $HOME/dotfiles/nvim/init.lua $HOME/.config/nvim
ln -sf $HOME/dotfiles/nvim/lua $HOME/.config/nvim

#########
## X11 ##
#########

rm -rf $HOME/.config/X11
ln -s $HOME/dotfiles/X11 $HOME/.config
