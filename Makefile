.PHONY: dist clean

configuretarget:
	./configure
	touch configuretarget

configure: configuretarget

replace: replace-master configure

clean:
	sed -i '' 's/^DARK_MODE=.*/DARK_MODE=1/' docker/Makefile 
	rm -f bin/learn
	rm -f bin/check
	rm -f bin/checkmain
	rm -f configuretarget
	rm -f replacetarget
	rm -f replace

scripts = master-scripts/learn-master master-scripts/checkmain-master master-scripts/check-master

replacetarget: $(scripts) replace
	./replace-all
	touch replacetarget

install:
	cp bin/* docker/bin

dist:
	mkdir -p dist
	zip dist/learn-unix-scripts-dist.zip bin/learn bin/check bin/checkmain LICENSE dist-readme
	tar czvf dist/learn-unix-scripts-dist.tar.gz bin/learn bin/check bin/checkmain LICENSE dist-readme

distclean:
	rm -Rf dist
