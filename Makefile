all: index.html gallery.html
index.html: index.xsl index.xml; xsltproc $^ > $@
gallery.html: gallery.xsl index.xml; xsltproc $^ > $@
