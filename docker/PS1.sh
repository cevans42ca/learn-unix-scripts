if [ "${DARK_MODE:-1}" -eq "1" ]; then
	export PS1="\033[38;5;075;48;5;000m\u@docker\[\033[00m\]:\033[38;5;082;48;5;000m\w\[\033[00m\]\$ "
else
	echo "Light mode."
fi
