files=(
    aliases
    exports
    history
    options
    zinit
)

for file in $files; do
  source "$HOME/.zsh/$file.zsh"
done
