if [ "${DARK_MODE:-1}" -eq "1" ]; then
	export PS1="\033[38;5;075;48;5;000m\u@docker\[\033[00m\]:\033[38;5;082;48;5;000m\w\[\033[00m\]\$ "
else
	export PS1="\033[38;5;020m\u@docker\[\033[00m\]:\033[38;5;022m\w\[\033[00m\]\$ "
fi

export INSIDE_DOCKER=1
export LUS_DOCKER_BASE=/mnt/vol/testuser
export LUS_PROGRESS=/mnt/vol/testuser/.learnUnixScripts

# If someone is connecting to Docker with "xterm", it's pretty much guaranteed to be a modern one.
# By setting 256 colours, we can give tput more to work with.
if [[ "$TERM" -eq "xterm" ]]; then
	export TERM=xterm-256color
fi
