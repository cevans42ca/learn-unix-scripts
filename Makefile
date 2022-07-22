.PHONY: clean dist distclean install configure run replacetarget

run: configure install dockerrun

flags/configuretarget:
	./configure
	touch flags/configuretarget

configure: flags/configuretarget

replace: replace-master flags/configuretarget

clean: gitclean
	rm -f bin/learn
	rm -f bin/check
	rm -f bin/checkmain
	rm -f flags/replacetarget
	rm -f replace
	cd docker && make clean

gitclean:
	sed -i '' 's/^DARK_MODE=.*/DARK_MODE=1/' docker/Makefile 
	rm -f flags/configuretarget

scripts = master-scripts/learn-master master-scripts/checkmain-master master-scripts/check-master
replaced_scripts = bin/learn bin/checkmain bin/check

flags/replacetarget: $(scripts) replacements/* flags/configuretarget
	./replace-all
	touch flags/replacetarget

replacetarget: flags/replacetarget

docker/bin/%: bin/%
	cp bin/$* docker/bin/$*

install: flags/replacetarget docker/bin/*

dockerrun: install
	cd docker && make createuservolume
	cd docker && make run

dist:
	mkdir -p dist
	zip dist/learn-unix-scripts-dist.zip bin/learn bin/check bin/checkmain LICENSE dist-readme
	tar czvf dist/learn-unix-scripts-dist.tar.gz bin/learn bin/check bin/checkmain LICENSE dist-readme

distclean:
	rm -Rf dist
