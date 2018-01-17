HIST_STAMPS="dd.mm.yyyy"
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000


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
