<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <!-- Ex.15 XSLT-2 : Construire une feuille de styles pour afficher (au format HTML) le texte en insérant sur chaque item sa POS -->

  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Trame RHAPSODIE</title>
        <style>
          body {
            font-family: "Gill Sans", sans-serif;
            padding: 35px;
          }
          div.header {
            text-align: center;
          }
          h1 {
            text-align: center;
          }
        </style>
        <!-- CSS Stylesheets -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"/>
        <!-- Bootstrap Scripts -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
      </head>
      <body>
        <h1>Trame RHAPSODIE pour Le Trameur</h1>
        <div class="card text-center">
          <div class="card-header">
            Ex.15 XSLT-2 : Construire une feuille de styles pour afficher le texte en insérant sur chaque item sa POS
          </div>
          <div class="card-body">
            <p class="card-text">
              <xsl:for-each select="baselexicometrique/trame/items/item">
                <xsl:if test="@type = 'forme' and not(f='&amp;') and not(f='XXX')">
                  <item>
                    <xsl:value-of select="f"/>
                    (<span class="text-success"><xsl:value-of select="c"/></span>)
                    <xsl:text>&#160;</xsl:text>
                  </item>
                </xsl:if>
                <xsl:if test="f = '§'">
                  <br/><hr/>
                </xsl:if>
              </xsl:for-each>
            </p>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <!-- commande: xsltproc ex15-p1-q2.xsl baseTrameurFromRhapsodie.xml > ex15-p1-q2.html -->

</xsl:stylesheet>
