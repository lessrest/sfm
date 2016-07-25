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
        <script src="dash.all.min.js"></script>
        <title>
          <xsl:value-of select="title"/>
        </title>
      </head>
      <body>
        <script>
          document.body.classList.add("js")
        </script>

        <xsl:apply-templates
            select="video-background"
            mode="background" />
        <div class="fade"/>

        <nav>
          <xsl:apply-templates select="/site/logo" />
          <ul>
            <xsl:apply-templates select="section" mode="menu"/>
          </ul>
        </nav>

        <div id="content">
          <header>
            <xsl:apply-templates select="logo"/>
            <xsl:apply-templates select="teaser"/>
            <p class="arrow">
              <a href="#menu">▼</a>
            </p>
          </header>

          <main id="main">
            <xsl:apply-templates select="section | aside | footer"/>
          </main>
        </div>
      </body>

      <script src="index.js">
      </script>
    </html>
  </xsl:template>

  <xsl:template match="section" mode="menu">
    <li>
      <a href="#{@id}">
        <xsl:value-of select="title"/>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="video-background" mode="background">
    <video data-src="{@src}" autoplay="true" loop="true"/>
  </xsl:template>

  <xsl:template match="video-background">
  </xsl:template>

  <xsl:template match="logo">
    <div class="logo">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="logo/brand">
    <h1><xsl:apply-templates/></h1>
  </xsl:template>

  <xsl:template match="logo/brand/thin">
    <span><xsl:apply-templates/></span>
  </xsl:template>

  <xsl:template match="logo/subtitle">
    <h2><xsl:apply-templates/></h2>
  </xsl:template>

  <xsl:template match="h2">
    <h2><xsl:apply-templates/></h2>
  </xsl:template>

  <xsl:template match="p">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="abbr">
    <abbr><xsl:apply-templates/></abbr>
  </xsl:template>

  <xsl:template match="a">
    <a href="{@href}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>

  <xsl:template match="lines">
    <ul class="simple">
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="lines/line">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <xsl:template match="teaser">
    <section class="teaser">
      <div class="section-part">
        <div class="content">
          <xsl:apply-templates/>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="compact-list">
    <p>
      <ul class="wrap">
        <xsl:apply-templates/>
      </ul>
    </p>
  </xsl:template>

  <xsl:template match="list">
    <p>
      <ul>
        <xsl:apply-templates/>
      </ul>
    </p>
  </xsl:template>

  <xsl:template match="item">
    <li><xsl:apply-templates/></li>
  </xsl:template>

  <xsl:template match="section">
    <section id="{@id}">
      <div class="section-part">
        <xsl:apply-templates mode="title" select="title" />
        <div class="content">
          <xsl:apply-templates/>
        </div>
      </div>
      <xsl:apply-templates mode="subsections" select="subsection"/>
    </section>
  </xsl:template>

  <xsl:template match="section/title" mode="title">
    <h2><xsl:apply-templates/></h2>
  </xsl:template>

  <xsl:template match="subsection/title" mode="title">
    <h3><xsl:apply-templates/></h3>
  </xsl:template>

  <xsl:template match="title">
  </xsl:template>

  <xsl:template match="aside">
    <aside id="{@id}">
      <div class="summary">
        <xsl:value-of select="summary"/>
      </div>
      <div class="details">
        <div class="content">
          <xsl:apply-templates/>
        </div>
      </div>
    </aside>
  </xsl:template>

  <xsl:template match="aside/summary">
  </xsl:template>

  <xsl:template match="subsection">
  </xsl:template>

  <xsl:template match="subsection" mode="subsections">
    <div class="subsection section-part">
      <xsl:apply-templates mode="title" select="title"/>
      <div class="content">
        <xsl:apply-templates/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="news">
    <dl>
      <xsl:apply-templates/>
    </dl>
  </xsl:template>

  <xsl:template match="news/item">
    <dt><xsl:value-of select="@date"/></dt>
    <dd><xsl:apply-templates/></dd>
  </xsl:template>

  <xsl:template match="contact-details">
    <table class="contactinfo">
      <xsl:apply-templates/>
    </table>
  </xsl:template>

  <xsl:template match="contact-details/section">
    <tbody>
      <xsl:apply-templates/>
    </tbody>
  </xsl:template>

  <xsl:template match="contact-details/section/field">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>

  <xsl:template match="field/name">
    <td><xsl:apply-templates/></td>
  </xsl:template>

  <xsl:template match="field/value">
    <td><xsl:apply-templates/></td>
  </xsl:template>

  <xsl:template match="field/number">
    <td class="mono"><xsl:apply-templates/></td>
  </xsl:template>

  <xsl:template match="staff-group">
    <h3>
      <xsl:apply-templates select="title"/>
    </h3>
    <div class="cardgroup">
      <xsl:apply-templates select="person"/>
    </div>
  </xsl:template>

  <xsl:template match="person">
    <div class="card">
      <img src="{photo}"/>
      <div class="info">
        <h3>
          <xsl:apply-templates select="name"/>
        </h3>
        <h4>
          <xsl:apply-templates select="occupation"/>
        </h4>
        <table>
          <xsl:apply-templates select="mobile | phone | email | skype" />
        </table>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="person/mobile">
    <tr>
      <td>Mob.</td>
      <td class="mono">
        <xsl:apply-templates/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="person/phone">
    <tr>
      <td>Tel/Fax</td>
      <td class="mono">
        <xsl:apply-templates/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="person/email">
    <tr>
      <td>Email</td>
      <td class="mono">
        <xsl:apply-templates/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="person/skype">
    <tr>
      <td>Skype</td>
      <td class="mono">
        <xsl:apply-templates/>
      </td>
    </tr>
  </xsl:template>

  <!-- <xsl:template match="prefetch"> -->
  <!--   <link rel="prefetch" href="{@src}"/> -->
  <!-- </xsl:template> -->

  <xsl:template match="gallery">
    <ul class="gallery">
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="photo">
    <li>
      <img src="{@src}&amp;resizefit=130x98"/>
    </li>
  </xsl:template>

  <xsl:template match="footer">
    <footer>
      <xsl:apply-templates/>
    </footer>
  </xsl:template>

  <xsl:template match="click-to-play-video">
    <a href="#" class="click-to-play-video">
      <xsl:apply-templates/>
    </a>
  </xsl:template>
</xsl:stylesheet>
