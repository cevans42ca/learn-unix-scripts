#!/bin/bash

if which getent; then
	if [ $(getent group admin) ]; then
		echo "The group already exists."
	else
		sudo groupadd -G $1 lus
	fi
else
	echo "Didn't find getent, trying dscl."
	if dscl . list /Groups | grep -q "^lus$"; then
		echo "Group already exists."
	else
		sudo dscl . create /Groups/lus
		sudo dscl . create /Groups/lus RealName "Learn Unix Scripts"
		sudo dscl . create /Groups/lus passwd "*"
		sudo dscl . create /Groups/lus gid $1

		# https://apple.stackexchange.com/questions/307173/creating-a-group-via-users-groups-in-command-line
		# sudo dscl . create /Groups/servsupport GroupMembership admin
	fi
fi

