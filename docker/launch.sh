#!/bin/bash

if { [ -w "/mnt/vol/testuser" ] || [ -w "/mnt/vol/shared" ]; }; then
	echo
	echo
	echo 'Type the word "learn" and press Enter to begin.'
	exec bash
else
	echo "Unable to save progress.  Please run the following commands."
	echo
	echo "docker volume create lus"
	echo "docker run --mount src=lus,target=/mnt/vol -u 0 learn-unix /bin/bash -c 'mkdir -p /mnt/vol/testuser;chgrp 1000 /mnt/vol/testuser;chmod g+w /mnt/vol/testuser'"
fi
