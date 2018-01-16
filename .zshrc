
if [[ $(uname) == "Darwin" ]]; then
  IS_MACOS=true
fi

# Set default user so it gets hidden in the terminal windows
DEFAULT_USER="matthiashollerbach"

ZSH_THEME="powerlevel9k/powerlevel9k"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd.mm.yyyy"



# oh-my-zsh

export ZSH=$HOME/.oh-my-zsh

plugins=(
  zsh-syntax-highlighting
  zsh-completions
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh


source ~/.zsh/aliases.sh
source ~/.zsh/colors.sh
