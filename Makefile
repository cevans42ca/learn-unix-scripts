.PHONY: dist

dist:
	mkdir -p dist
	zip dist/learn-unix-scripts-dist.zip bin/learn bin/check bin/checkmain LICENSE dist-readme
	tar czvf dist/learn-unix-scripts-dist.tar.gz bin/learn bin/check bin/checkmain LICENSE dist-readme

distclean:
	rm -Rf dist
