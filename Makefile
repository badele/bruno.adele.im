all: build upload

clean:
	rm -rf _build

build:
	run-rstblog build
	cp _build/a-propos/index.html _build/index.html

serve:
	run-rstblog serve

push:
	git push github master

upload:
	rsync -a _build/ bruno.adele@10.0.0.6:/home/bruno.adele/public_html/
	@echo "Done..."
