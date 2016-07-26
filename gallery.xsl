<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output
      method="html"
      indent="yes"
      doctype-system="about:legacy-compat"
      encoding="utf-8"/>

  <xsl:template match="site">
    <html>
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport"
              content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="index.css"/>
        <title>
          Gallery <xsl:value-of select="title"/>
        </title>
      </head>
      <body>
        <script>
          document.body.classList.add("js")
        </script>

        <xsl:apply-templates select="*/gallery"/>
      </body>

      <script src="gallery.js">
      </script>
    </html>
  </xsl:template>

  <xsl:template match="gallery">
    <div class="lightbox">
      <div class="zoomed">
        <xsl:apply-templates/>
      </div>
      <!-- <div class="list-container"> -->
      <!--   <div class="list"> -->
      <!--     <xsl:apply-templates mode="small"/> -->
      <!--   </div> -->
      <!-- </div> -->
    </div>
  </xsl:template>

  <xsl:template match="photo">
    <div class="photo" id="{@id}">
      <img src="{@src}"/>
    </div>
  </xsl:template>

  <xsl:template match="photo" mode="small">
    <div class="photo">
      <img src="{@src}&amp;resizefit=130x98"/>
    </div>
  </xsl:template>
</xsl:stylesheet>
