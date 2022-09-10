if which tput >/dev/null 2>&1; then
	if [ "$(tput colors)" -le "8" ]; then
		if [ "${DARK_MODE:-1}" -eq "1" ]; then
			export PS1="\[\033[38;5;075;48;5;000m\]\u@docker\[\033[00m\]:\[\033[38;5;082;48;5;000m\]\w\[\033[00m\]\$ "
		else
			export PS1="\[\033[38;5;020m\]\u@docker\[\033[00m\]:\[\033[38;5;022m\]\w\[\033[00m\]\$ "
		fi
	else
		export PS1="[\u@docker:\w] \$ "
	fi
fi

alias ls='ls --color'

export INSIDE_DOCKER=1
export SHARED_VOLUME=1
export LUS_DOCKER_BASE=/mnt/vol/lus/$(whoami)
export LUS_PROGRESS=/mnt/vol/lus/$(whoami)/.learnUnixScripts
