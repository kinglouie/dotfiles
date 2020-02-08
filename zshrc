source ~/.zsh/antigen.zsh

antigen use oh-my-zsh
antigen bundles <<EOBUNDLES

    # oh my zsh bundles
    docker
    gem
    npm
    pip
    python
    vi-mode
    web-search

    # other bundles
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions
    zsh-users/zsh-autosuggestions
    mafredri/zsh-async
    sindresorhus/pure

EOBUNDLES



antigen apply
#autoload -U promptinit; promptinit

#prompt pure
# Load personal stuff
files=(
    plugin-settings
    aliases
    exports
    history
    init
    options
)

for file in $files; do
  source "$HOME/.zsh/$file.zsh"
done
