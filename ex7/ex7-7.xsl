<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>
  <!-- La règle principale -->
  <xsl:template match="/">
    <html>
      <head>
        <style>
          table {
          border-collapse: collapse;
          width: 25%;
          table-layout: fixed;
          }
          td {
          padding: 5px;
          border: normal;
          }
          th {
          padding: 10px 15px;
          }
          img {
          width: 500px;
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
        <h2>question 7</h2>
        <p align="center">Engendrer une page HTML bien formée dans laquelle le poème (seul, sans titre) est au sein
          d'un tableau, <br />avec une ligne par vers, et une ligne entre chaque strophe. Penser à aligner les
          lignes à gauche.<br />
          <img src="dormeur.jpeg" alt="Le Dormeur du Val"/>
        </p>
        <table align="center" border="3">
          <caption>
            <i>
              <xsl:value-of select="TEI/text/group/text/front/head"/>
            </i>
            -
            <xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/author"/>
          </caption>
          <xsl:apply-templates select="/TEI/text/group/text/body/lg/lg"/>
        </table>
      </body>
    </html>
  </xsl:template>
  <!-- La règle pour afficher la ligne vide après chaque strophe -->
  <xsl:template match="lg">
    <xsl:apply-templates select="./l"/>
    <tr>
      <td align="center">***</td>
    </tr>
  </xsl:template>
  <!-- La règle pour imprimer les vers -->
  <xsl:template match="l">
    <tr>
      <td>
        <xsl:value-of select="."/>
      </td>
    </tr>
  </xsl:template>
  
  <!-- Transformation : xsltproc ex7-7.xsl dormeur-tei.xml > ex7-7.html -->
  
</xsl:stylesheet>
