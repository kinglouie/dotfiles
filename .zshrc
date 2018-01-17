export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(

  # external
  zsh-syntax-highlighting
  zsh-completions
  zsh-autosuggestions
  notify

  # from oh my zsh
  docker
  gem
  npm
  pip
  python

)
autoload -U compinit && compinit


source $ZSH/oh-my-zsh.sh


source ~/.zsh/aliases.zsh
#source ~/.zsh/colors.zsh
source ~/.zsh/history.zsh
source ~/.zsh/options.zsh