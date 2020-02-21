
#################################################################
# INSTALL `zinit` AND LOAD IT
#

# Install `zinit` if not installed
if [ ! -d "${HOME}/.zinit" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

# Load `zinit`
source "${HOME}/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit



# pure prompt
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure


# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
#zinit ice from"gh-r" as"program"
#zinit load junegunn/fzf-bin

# Additional completion definitions
zinit ice wait"0a" lucid blockf
zinit load zsh-users/zsh-completions

# History search by `Ctrl+R`
zinit ice wait"0b" lucid; zinit load zdharma/history-search-multi-word

# Syntax highlighting
# (compinit without `-i` spawns warning on `sudo -s`)
zinit ice wait"0a" lucid atinit"ZINIT[COMPINIT_OPTS]='-i' zpcompinit; zpcdreplay"
    zinit load zdharma/fast-syntax-highlighting

# Autosuggestions
# Note: should go _after_ syntax highlighting plugin
zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"; zinit load zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
