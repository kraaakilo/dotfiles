export ZSH="$HOME/.oh-my-zsh"
export FPATH="/home/kraaakilo/apps/cli/completions/zsh:$FPATH"

# ZSH plugins
plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    laravel
)

source $ZSH/oh-my-zsh.sh

# Custom configuration
if [ -f ~/.triplea.zsh ]; then
    source ~/.triplea.zsh
fi

# Fuzzy search history
source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# PYENV Support
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# StarShip.rs
eval "$(starship init zsh)"