# homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# Zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

# External programs
# Starship
eval "$(starship init zsh)"
# pyenv
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Load and initialise completion system
autoload -Uz compinit && compinit

# plugins
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"

# if workrc (only for work related stuff)
if [ -f "$HOME/.workrc" ]; then
  source "$HOME/.workrc"
fi

# Secrets
[ -f "$HOME/.env" ] && source "$HOME/.env"


# fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Check if krabby exists to display the pokemon
if [ -x "$(command -v krabby)" ]
then
    krabby random -i
fi

