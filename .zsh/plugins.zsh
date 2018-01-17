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


# plugin settings

zstyle ':notify:*' notifier /usr/local/bin/terminal-notifier
zstyle ':notify:*' command-complete-timeout 15