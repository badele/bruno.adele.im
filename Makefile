PY=python
PELICAN=pelican
PELICANOPTS=

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py

# Pelican
summary:
	org2json -o /home/badele/docshare/documents/project.org -s projects.json
	githubsummary -t rst/index-fr.rst -j projects.json -s ./content/pages/about.rst
	githubsummary -t rst/projects-fr.rst -j projects.json -s ./content/pages/projets.rst

html:
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)
	cp static/gitcheck_verbose_v2.png $(OUTPUTDIR)/static/

doc:
	cd /LIVE/projects/pelican-theme-jesuislibre ; ./generate_pelicanconf-sample.py /LIVE/projects/blog.jesuislibre.org/pelicanconf.py | sort > pelicanconf-sample.py

clean:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)

regenerate:
	org2json -o /LIVE/documents/project.org -s projects.json
	githubsummary -t rst/index-en.rst -j projects.json -s ./content/pages/about.rst
	$(PELICAN) -r $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

serve:
ifdef PORT
	cd $(OUTPUTDIR) && $(PY) -m pelican.server $(PORT)
else
	cd $(OUTPUTDIR) && $(PY) -m pelican.server
endif

devserver:
ifdef PORT
	$(BASEDIR)/develop_server.sh restart $(PORT)
else
	$(BASEDIR)/develop_server.sh restart
endif

push:
	git push github master

upload:
	rsync -a output/ w4a153382@ssh.web4all.fr:/datas/vol3/w4a153382/var/www/bruno.adele.im/htdocs/
