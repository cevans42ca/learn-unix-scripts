.PHONY: dist clean

run: configure install dockerrun

flags/configuretarget:
	./configure
	touch flags/configuretarget

configure: flags/configuretarget

replace: replace-master configure

clean:
	sed -i '' 's/^DARK_MODE=.*/DARK_MODE=1/' docker/Makefile 
	rm -f bin/learn
	rm -f bin/check
	rm -f bin/checkmain
	rm -f flags/configuretarget
	rm -f flags/replacetarget
	rm -f replace
	cd docker && make clean

scripts = master-scripts/learn-master master-scripts/checkmain-master master-scripts/check-master
replaced_scripts = bin/learn bin/checkmain bin/check

flags/replacetarget: $(scripts) configure
	./replace-all
	touch flags/replacetarget

replacetarget: flags/replacetarget

install: replacetarget
	cp bin/* docker/bin

dockerrun: install
	cd docker && make createuservolume
	cd docker && make run

dist:
	mkdir -p dist
	zip dist/learn-unix-scripts-dist.zip bin/learn bin/check bin/checkmain LICENSE dist-readme
	tar czvf dist/learn-unix-scripts-dist.tar.gz bin/learn bin/check bin/checkmain LICENSE dist-readme

distclean:
	rm -Rf dist
