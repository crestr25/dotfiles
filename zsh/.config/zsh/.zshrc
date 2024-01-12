
# ZSH reads config files in the following order 
# 1. .zshenv, user environment variables
# 2. .zprofile, Can be used to execute commands just after logging in
# 3. .zshrc, Configure the shell itself and running commands
# 4. .zshlogin, Same as zprofile but runs after zshrc
# 5. .zlogout, Can be used to execute commands when a shell exists


# Starship start
eval "$(starship init zsh)"

# Include external folder in zsh config
fpath=($ZDOTDIR/external $fpath)

######## VI Mode ########

# Activate vi mode
bindkey -v
export KEYTIMEOUT=1

# Vim mapping for completion
# Use complist to access menuselect and map the keys
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Make the cursor behave like in nvim
autoload -Uz cursor_mode && cursor_mode

######### Vi Comand Edit ########

# Use edit-command-line from zshcontrib
autoload -Uz edit-command-line
zle -N edit-command-line
# set command v in normal mode to edit in nvim(or $EDITOR)
bindkey -M vicmd v edit-command-line

######## Auto Completion ########

# Zsh completion system
autoload -U compinit; compinit

# Auto coplete hidden files
_comp_options+=(globdots)

# Auto completion but prettier
source "$ZDOTDIR/external/completion.zsh"
# autoload -Uz completion && completion

######## Directory Stack ########

# Keep a stack of directories
# 1. keep the current directory visited on to the stack
setopt AUTO_PUSHD
# 2. Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# 3. Do not print the directory after using pushd or popd
setopt PUSHD_SILENT

######## FZF ########
if [ $(command -v "fzf") ]; then
    source /opt/homebrew/Cellar/fzf/0.42.0/shell/key-bindings.zsh
    source /opt/homebrew/Cellar/fzf/0.42.0/shell/completion.zsh
fi

######## Plugins ########

# Syntax Highlighting
source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# Auto Suggestions
source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Source my scripts
source "$ZDOTDIR/scripts.sh"
source "$ZDOTDIR/aliases"

# Pyenv
command -v pyenv >/dev/null
eval "$(pyenv init -)"

# Work file if exists
if [ -f ~/.workrc ]; then
    source "$HOME/.workrc"
fi
