VOL_DIR=/var/lib/docker/volumes/lus/_data
G_UID=10000

build:
	docker build -t learn-unix --build-arg D_UID=1001 --build-arg D_USERNAME=duser1 --build-arg D_GID=$(G_UID) .

$(VOL_DIR):
	docker volume create lus

createvolume: | $(VOL_DIR)
	./createGroup.sh $(G_UID)

	if [ -d "/var/lib/docker/volumes" ]
	then
		sudo chmod g+w $(VOL_DIR)
	else
		docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i mkdir -p /var/lib/docker/volumes/lus/_data/testuser
		docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i chgrp $(G_UID) /var/lib/docker/volumes/lus/_data/testuser
		docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i chmod g+w /var/lib/docker/volumes/lus/_data/testuser
	fi


createsharedvolume: | $(VOL_DIR)
	./createGroup.sh $(G_UID)
	sudo mkdir $(VOL_DIR)/shared
	sudo chown root:lus $(VOL_DIR)/shared
	sudo chmod g+w $(VOL_DIR)/shared
	sudo chmod +t $(VOL_DIR)/shared

run:
	docker run -it --rm --mount src=lus,target=/mnt/lus learn-unix
