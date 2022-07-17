.PHONY: clean

G_UID=10000
DARK_MODE=1

run: build
	@echo
	@echo Starting docker.  Once it starts, type the word \"learn\" and press Enter.
	docker run -it --rm --mount src=lus,target=/mnt/vol learn-unix

flags/buildtarget: bin/learn bin/check bin/checkmain etc-profile.sh Dockerfile
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

createsharedvolume: createvolume
	./createGroup.sh $(G_UID)
	./fixPermissions.sh $(G_UID) testuser shared

clean:
	rm -f flags/buildtarget
	rm -f flags/volumetarget

