.PHONY: dist

replace: master-scripts/learn-master master-scripts/checkmain-master master-scripts/check-master
	./replace-all

install:
	cp bin/* "${LEARN_INSTALL_DIR}/bin"

dist:
	mkdir -p dist
	zip dist/learn-unix-scripts-dist.zip bin/learn bin/check bin/checkmain LICENSE dist-readme
	tar czvf dist/learn-unix-scripts-dist.tar.gz bin/learn bin/check bin/checkmain LICENSE dist-readme

distclean:
	rm -Rf dist
