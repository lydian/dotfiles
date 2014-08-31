[[ $- == *i* ]] || return

export PATH=~/.local/download/cmake-2.8.12.2-Linux-i386/bin/:/usr/local/bin:~/pg/yelp-main/tools/$PATH

function parse_current_tunnel() {
	if [[ -n "$YELP_SPAM_SANDBOX_TYPE" ]]; then
		echo "(realprod)"
  elif [[ "$YELP_IN_SANDBOX" -eq 1 ]]; then
			if grep -q "proddb" $YELP_TOPOLOGY_CONFIG_NEW 
			then 
				echo "(proddb)"
			else
				echo "(sandbox)"
			fi
	fi

}
function parse_inenv() {
	if [[ -n "$BASEPATH" ]]; then
		echo "(INENV)"
	fi
}

function parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$YELLOW\$(parse_inenv)\$(parse_current_tunnel)$GREEN\u$CYAN@\h$NO_COLOUR:\w$PURPLE\$(parse_git_branch)$NO_COLOUR\$ "

#export SSH_AUTH_SOCK=$(find /tmp/ssh-* -user `whoami` -name agent\* -printf '%T@ %p\n' 2>/dev/null | sort -k 1nr | sed 's/^[^ ]* //' | head -n 1)
#test $SSH_AUTH_SOCK && ln -sf "$SSH_AUTH_SOCK" "/tmp/ssh-agent-$USER-screen"



# Set symlink for forwarding agent in screen 
SSH_SOCK_PATH="$HOME/.ssh/ssh_auth_sock"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != "$SSH_SOCK_PATH" ]
then
	rm -f "$SSH_SOCK_PATH"
	ln -sf "$SSH_AUTH_SOCK" "$SSH_SOCK_PATH"
fi


shopt -s expand_aliases # To allow use the alias in screen

# Auto complete git
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

# Setup alias if any
if [ -f ~/.alias.bash ]; then
	source ~/.alias.bash
fi
