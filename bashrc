export PATH=/usr/local/bin:$PATH

function parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u@\h$NO_COLOUR:\w$PURPLE\$(parse_git_branch)$NO_COLOUR\$ "

export SSH_AUTH_SOCK=$(find /tmp/ssh-* -user `whoami` -name agent\* -printf '%T@ %p\n' 2>/dev/null | sort -k 1nr | sed 's/^[^ ]* //' | head -n 1)
test $SSH_AUTH_SOCK && ln -sf "$SSH_AUTH_SOCK" "/tmp/ssh-agent-$USER-screen"




shopt -s expand_aliases # To allow use the alias in screen
alias sb='sandbox --minimal bash'
