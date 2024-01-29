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
# Use the CLI ripgrep to respect ignore files (like '.gitignore'),
# display hidden files, and exclude the '.git' directory.
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git' 2>/dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"

# Starship config
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
