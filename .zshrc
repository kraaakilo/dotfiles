(cat ~/.cache/wal/sequences &)

export ZSH="$HOME/.oh-my-zsh"

# ZSH theme
ZSH_THEME="steeef"

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
