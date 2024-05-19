#!/bin/sh
# Starship

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

# External programs
eval "$(starship init zsh)"
eval "$(atuin init zsh)"


# plugins
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "zap-zsh/supercharge"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# if workrc (only for work related stuff)
if [ -f "$HOME/.workrc" ]; then
  source "$HOME/.workrc"
fi

# Load and initialise completion system
autoload -Uz compinit
compinit

# pyenv
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
