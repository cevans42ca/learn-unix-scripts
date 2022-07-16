G_UID=10000
DARK_MODE=1

flags/buildtarget: bin/learn bin/check bin/checkmain
	docker build -t learn-unix --build-arg D_UID=1001 --build-arg D_USERNAME=duser1 --build-arg D_GID=$(G_UID) --build-arg DARK_MODE=$(DARK_MODE) .
	touch flags/buildtarget

build: flags/buildtarget

flags/volumetarget:
	docker volume create lus
	touch flags/volumetarget

createvolume: flags/volumetarget

createuservolume: createvolume
	./createGroup.sh $(G_UID)
	./fixPermissions.sh $(G_UID) testuser

VOL_DIR=/var/lib/docker/volumes

createsharedvolume: createvolume
	./createGroup.sh $(G_UID)
	sudo mkdir $(VOL_DIR)/shared
	sudo chown root:lus $(VOL_DIR)/shared
	sudo chmod g+w $(VOL_DIR)/shared
	sudo chmod +t $(VOL_DIR)/shared

run: build
	docker run -it --rm --mount src=lus,target=/mnt/lus learn-unix
