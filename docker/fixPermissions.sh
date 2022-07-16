#!/bin/bash

vol_dir=/var/lib/docker/volumes
full_vol_dir="$vol_dir/lus/_data/$2"

if [ -d "$vol_dir" ]
then
	if [[ "$3" == "shared" ]]; then
	        sudo mkdir $(full_vol_dir)
		sudo chgrp $1 $(full_vol_dir)
		sudo chmod g+w $(full_vol_dir)
		sudo chmod +t $(full_vol_dir)
	else
		sudo chmod g+w "$full_vol_dir"
	fi
else
	docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i mkdir -p "$full_vol_dir"
	docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i chgrp $1 "$full_vol_dir"
	docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i chmod g+w "$full_vol_dir"
fi
