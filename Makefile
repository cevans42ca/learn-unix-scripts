.PHONY: dist clean

config:
	./configure

clean:
	sed -i '' 's/^DARK_MODE=.*/DARK_MODE=1/' docker/Makefile 
	rm bin/learn
	rm bin/check
	rm bin/checkmain

replacetarget: master-scripts/learn-master master-scripts/checkmain-master master-scripts/check-master
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
