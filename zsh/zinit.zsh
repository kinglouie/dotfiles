
#################################################################
# INSTALL `zinit` AND LOAD IT
#

# Install `zinit` if not installed
if [ ! -d "${HOME}/.zinit" ]; then
  $HOME/.zsh/zinit_install.zsh
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
zinit ice wait"0b" lucid as"command" from"gh-r"
zinit load junegunn/fzf-bin

zinit ice wait"0b" lucid as"command" pick"bin/fzf-tmux"
zinit load junegunn/fzf

zinit ice wait"0a" lucid multiscr"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
zinit load junegunn/fzf

#autojunp command
zinit ice wait"0b" lucid
zinit load rupa/z

#Pick from most frecent folder with ctrl+g
zinit ice wait"0a" lucid
zinit load andrewferrier/fzf-z

#lets z+tab and zz+tab
zinit ice wait"0a" lucid
zinit load changyuheng/fz

#like z but opens in vim
zinit ice wait"0b" lucid as"command" pick"v"
zinit load rupa/v








# Additional completion definitions
zinit ice wait"0a" lucid blockf
zinit load zsh-users/zsh-completions

# History search by `Ctrl+R`
zinit ice wait"0b" lucid
zinit load zdharma/history-search-multi-word

# Syntax highlighting
# (compinit without `-i` spawns warning on `sudo -s`)
zinit ice wait"0a" lucid atinit"ZINIT[COMPINIT_OPTS]='-i' zpcompinit; zpcdreplay"
zinit load zdharma/fast-syntax-highlighting

# Autosuggestions
# Note: should go _after_ syntax highlighting plugin
zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"; zinit load zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# For GNU ls (the binaries can be gls, gdircolors, e.g. on OS X when installing the
# coreutils package from Homebrew; you can also use https://github.com/ogham/exa)
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS
