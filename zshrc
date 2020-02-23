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

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
fi
