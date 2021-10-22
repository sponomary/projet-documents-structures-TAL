<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <style>
          table {
          border-collapse: collapse;
          width: 30%;
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
          max-width: 70%;
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
        <h2>question 9</h2>
        <p align="center">Afficher les quatrains en gras et les tercets en italiques au sein d'une page HTML bien formée.</p>
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
              <xsl:apply-templates select="/TEI/text/group/text/body/lg/lg"/>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="lg">
    <!-- On teste si <lg> (line groupe = une strophe) contient 4 lignes  -->
    <xsl:if test="count(child::*)=4">
      <xsl:for-each select="./l">
        <b>
          <xsl:value-of select="."/>
        </b>
        <br/>
      </xsl:for-each>
    <!-- On teste si <lg> (line groupe = une strophe) contient 4 lignes  -->  
    </xsl:if>
    <br/>
    <xsl:if test="count(child::*)=3">
      <xsl:for-each select="./l">
        <i>
          <xsl:value-of select="."/>
        </i>
        <br/>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>
  
  <!-- Transformation : xsltproc ex7-9.xsl dormeur-tei.xml > ex7-9.html -->
  
</xsl:stylesheet>
