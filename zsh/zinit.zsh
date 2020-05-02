
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





#################################################################
# FUNCTIONS TO MAKE CONFIGURATION LESS VERBOSE
#

turbo0()   { zinit ice wait"0a" lucid             "${@}"; }
turbo1()   { zinit ice wait"0b" lucid             "${@}"; }
turbo2()   { zinit ice wait"0c" lucid             "${@}"; }
zcommand() { zinit ice wait"0b" lucid as"command" "${@}"; }
zload()    { zinit load                           "${@}"; }
zsnippet() { zinit snippet                        "${@}"; }
















# pure prompt
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure





#################################################################
# FUZZY SEARCH AND MOVEMENT
#
# Install a fuzzy finder (fzf/fzy) and necessary completions
# and key bindings.
#

# Install `fzf` bynary and tmux helper script
zcommand from"gh-r";         zload junegunn/fzf-bin
zcommand pick"bin/fzf-tmux"; zload junegunn/fzf
# Create and bind multiple widgets using fzf
turbo0 multisrc"shell/{completion,key-bindings}.zsh" \
        id-as"junegunn/fzf_completions" pick"/dev/null"
    zload junegunn/fzf

# Fuzzy movement and directory choosing
turbo1; zload rupa/z               # autojump command
turbo0; zload andrewferrier/fzf-z  # Pick from most frecent folders with `Ctrl+g`
turbo0; zload changyuheng/fz       # lets z+[Tab] and zz+[Tab]

# Like `z` command, but opens a file in vim based on frecency
zcommand pick"v"; zload rupa/v

# Install `fzy` fuzzy finder, if not yet present in the system
# Also install helper scripts for tmux and dwtm
turbo0 as"command" if'[[ -z "$commands[fzy]" ]]' \
       make"!PREFIX=$ZPFX install" atclone"cp contrib/fzy-* $ZPFX/bin/" pick"$ZPFX/bin/fzy*"
    zload jhawthorn/fzy
# Install fzy-using widgets
turbo0 silent; zload aperezdc/zsh-fzy
bindkey '\ec' fzy-cd-widget
bindkey '^T'  fzy-file-widget

# Fuzzy search by `Ctrl+P` a file and open in `$EDITOR`
# Implements it's own fuzzy search
turbo0; zload mafredri/zsh-async
turbo0; zload seletskiy/zsh-fuzzy-search-and-edit
bindkey '^P' fuzzy-search-and-edit
export EDITOR=${EDITOR:-vim}








#################################################################
# IMPORTANT PLUGINS
#

# Additional completion definitions
turbo0 blockf
zload zsh-users/zsh-completions

# History search by `Ctrl+R`
turbo1; zload zdharma/history-search-multi-word

# Syntax highlighting
# (compinit without `-i` spawns warning on `sudo -s`)
turbo0 atinit"ZINIT[COMPINIT_OPTS]='-i' zpcompinit; zpcdreplay"
    zload zdharma/fast-syntax-highlighting

# Autosuggestions
# Note: should go _after_ syntax highlighting plugin
turbo0 atload"_zsh_autosuggest_start"; zload zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1




# For GNU ls (the binaries can be gls, gdircolors, e.g. on OS X when installing the
# coreutils package from Homebrew; you can also use https://github.com/ogham/exa)
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS




#################################################################
# REMOVE TEMPORARY FUNCTIONS
#
unset -f turbo0
unset -f zload
unset -f zsnippet
