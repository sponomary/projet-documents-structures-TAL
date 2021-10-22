<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <style>
          table {
          border-collapse: collapse;
          width: 60%;
          table-layout: fixed;
          }
          td {
          padding: 20px;
          border: none;
          }
          th {
          padding: 10px 15px;
          }
          img {
          max-width: 45%;
          height: auto;
          }
          h1, h2 {
          font-family: 'Rock Salt', cursive;
          text-align: center;
          }
          .rel {
          margin-left: auto;
          margin-right: auto;
          width: 24em;
          }
        </style>
        <title>Exercice 7 : Exploration d’un fichier TEI</title>
      </head> 
      <body>
        <h1>Exercice 7</h1>
        <h2>question 6</h2>
        <p align="center">Afficher chaque vers précédé de son numéro d'ordre au sein du groupe de vers (&lt;lg&gt;) en ajoutant aussi à chaque groupe de vers son numéro d'ordre.</p>
        <table align="center" border="3">
          <tr>
            <th>
              <img src="dormeur.jpeg" alt="Le Dormeur du Val"/>
            </th>
          </tr>
          <tr>
            <td>
              <center>
                <h3><xsl:value-of select="TEI/text/group/text/front/head"/></h3>
                <h4><xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/author"/></h4> 
              </center>
            </td>
          </tr>
          <tr>
            <td> 
              <div class="rel">
                <xsl:apply-templates select="/TEI/text/group/text/body/lg/lg"/>
              </div>
              <center>
                <i>
                  <xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/title"/>
                </i>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="TEI/text/group/text/front/dateline"/>
              </center>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="lg">
    <b>
      Groupe n°
      <xsl:value-of select="count(preceding::lg)+1"/>
    </b>
    <!-- La liste des strophes -->
    <ol>
      <xsl:apply-templates select="./l"/>
      <br />
    </ol>  
  </xsl:template>
  <xsl:template match="l">
    <li>
      <xsl:value-of select="."/>
    </li>
  </xsl:template>
  
  <!-- Transformation : xsltproc ex7-6.xsl dormeur-tei.xml > ex7-6.html -->
  
</xsl:stylesheet>
