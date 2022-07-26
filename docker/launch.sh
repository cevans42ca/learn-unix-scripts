#!/bin/bash

if { [ -w "/mnt/vol/testuser" ] || [ -w "/mnt/vol/shared" ]; }; then
	echo
	echo
	echo 'Type the word "learn" and press Enter to begin.'
	exec bash
else
	echo "The volume hasn't been set up, which means you won't be able to save"
	echo "your progress.  What do you want to do?"
	echo
	echo "(1) Explore a little anyway"
	echo "(2) Find out how to set up the volume so you can save your progress"
	echo "(3) Quit"
	echo
	read -p "Please type 1, 2, or 3 and press Enter:  " choice

        if [[ "${choice}" =~ ^[\ ]*1[\ ]*$ ]]; then
		echo
		echo 'Type the word "learn" and press Enter to begin.'
		exec bash
	elif [[ "${choice}" =~ ^[\ ]*2[\ ]*$ ]]; then
		echo
		echo "Run the following commands."
		echo
		echo "docker volume create lus"
		echo "docker run --mount src=lus,target=/mnt/vol -u 0 alpine /bin/ash -c 'mkdir -p /mnt/vol/testuser;chgrp 1000 /mnt/vol/testuser;chmod g+w /mnt/vol/testuser'"
        fi
fi
