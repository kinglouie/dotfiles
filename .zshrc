
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

# Load plugins.
source ~/.zsh/plugins.zsh

# Load the theme.
source ~/.zsh/themes/powerlevel9k.zsh

# Tell Antigen that you're done.
antigen apply

# Load personal stuff

source ~/.zsh/plugin-settings.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/history.zsh
source ~/.zsh/init.zsh
source ~/.zsh/options.zsh
