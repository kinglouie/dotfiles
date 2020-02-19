
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

#autosuggestions
zinit ice silent wait:1 atload:_zsh_autosuggest_start
zinit light zsh-users/zsh-autosuggestions

#completions
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

#syntax highlighting
zinit ice silent wait!1 atload"ZINIT[COMPINIT_OPTS]=-C; zpcompinit"
zinit light zdharma/fast-syntax-highlighting
