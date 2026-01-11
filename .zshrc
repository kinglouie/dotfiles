source /opt/homebrew/opt/zinit/zinit.zsh

# THEME pure
zinit ice pick"async.zsh" src"pure.zsh" 
zinit light sindresorhus/pure

# z
zinit ice wait blockf lucid
zinit light rupa/z

# z tab completion
zinit ice wait lucid
zinit light changyuheng/fz

# cd
zinit ice wait lucid
zinit light changyuheng/zsh-interactive-cd

# syntax highlighting, completions, autosuggestions
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions


source <(fzf --zsh)

#ALIASES

alias ll="ls -lah --color=auto"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias please='sudo $(fc -nl -1)' # Repeat last command with sudo

alias vi="lvim"
alias vim="lvim"
alias nvim="lvim"

alias sudo="sudo "

alias localip="ipconfig getifaddr en0"

alias flushdns="sudo killall -HUP mDNSResponder"

#EXPORTS

export EDITOR="lvim"
export VISUAL="lvim"

# HISTORY

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_save_nodups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
# Lando
export PATH="/Users/mh/.lando/bin${PATH+:$PATH}"; #landopath
export COPYFILE_DISABLE=1;
export NODE_EXTRA_CA_CERTS="/opt/homebrew/etc/ca-certificates/cert.pem"  
