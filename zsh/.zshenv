# for dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# Change editor to nvim
export EDITOR="nvim"
export VISUAL="nvim"

# Personal dotfiles
export DOTFILES="$HOME/Dev/dotfiles"
# Zsh Dot dir
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$ZSHDOTDIR/.zhistory"
# Max internal history events
export HISTSIZE=10000
# Max events in history file
export SAVEHIST=10000

# Use RipGrep
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git' 2>/dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Starship config
export STARSHIP_CONFIG=/Users/crestrepo/.config/starship/starship.toml
