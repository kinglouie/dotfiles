export ZSH=$HOME/.oh-my-zsh

for file in ~/.zsh/*.zsh; do
    source $file
done
unset file

source $ZSH/oh-my-zsh.sh