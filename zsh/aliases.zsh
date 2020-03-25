# New commands
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"
alias lc='colorls -lA --sd'
alias ll="ls -lah --color=auto" # exa overrides if available
alias lsd="ls -la --color=auto | grep '^d'"
alias clean="find . -regex '.*\(.AppleDouble\|.DS_Store\)$' -ls -exec rm -r {} \;"

alias please='sudo $(fc -nl -1)' # Repeat last command with sudo

# Rewrites
alias df="df -h"
alias diff="git diff --no-index --color-words"
alias du="du -hc"
alias ping="ping -c 5" # Ping only 5 times
alias vi="vim"
alias grep='grep --color=auto'

# Enable aliases to be sudo’ed
alias sudo="sudo "


# List 10 biggest files in pwd.
alias bf="du -x | sort -nr | head -10"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# IP addresses
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# URL-encode strings
# https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

alias 2048="bash <(wget -q https://raw.githubusercontent.com/mydzor/bash2048/master/bash2048.sh -O -)"
