
source /usr/local/share/antigen/antigen.zsh

# Antigen Bundles

    source ~/.zsh/plugins.zsh

# Theme
# "antigen apply" is called in the theme files

    #source ~/.zsh/themes/powerlevel9k.zsh
    source ~/.zsh/themes/pure.zsh


# Load personal stuff
files=(
    colors
    plugin-settings
    aliases
    exports
    history
    init
    options
    path
)

for file in $files; do
  source "$HOME/.zsh/$file.zsh"
done
