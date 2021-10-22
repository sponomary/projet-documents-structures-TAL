<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <style>
          body {
          text-align: center;
          }
          img {
          max-width: 35%;
          height: auto;
          }
          h1, h2 {
          font-family: 'Rock Salt', cursive;
          text-align: center;
          }
        </style>
        <title>Exercice 7 : Exploration d’un fichier TEI</title>       
      </head>
      <body>
        <h1>Exercice 7</h1>
        <h2>question 4</h2>
        <p align="center">Afficher seulement le 1er et le 3ème quatrain au sein d'une page HTML bien formée.</p>
        <center>
          <img src="dormeur.jpeg" alt="Le Dormeur du Val"/>
        </center>
        <br/>
        <xsl:apply-templates select="TEI/text/group/text/body/lg/lg"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="lg">
      <xsl:for-each select=".">
        <xsl:if test="count(preceding::lg)=0">
          <p>
            <b>Premier quatrain</b>
          </p>
            <xsl:for-each select="./l">
              <xsl:value-of select="."/>
              <br/>
            </xsl:for-each>
          <br/>
        </xsl:if>
      </xsl:for-each>
    
      <xsl:for-each select=".">
        <xsl:if test="count(preceding::lg)=2">
          <p>
            <b>Troisième quatrain (tercet ?)</b>
          </p>
            <xsl:for-each select="./l">
              <xsl:value-of select="."/>
              <br/>
            </xsl:for-each>
          <br/>
        </xsl:if> 
      </xsl:for-each>
  </xsl:template>
  
  <!-- Transformation : xsltproc ex7-4.xsl dormeur-tei.xml > ex7-4.html -->
  
</xsl:stylesheet>
