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
        <h2>question 3</h2>
        <p align="center">Afficher le 1er et le 3ème vers de chaque groupe de vers au sein d'une page HTML bien formée.</p>
        <table align="center" border="3">
          <tr>
            <th>
              <img src="dormeur.jpeg" alt="Le Dormeur du Val"/>
            </th>
          </tr>
          <tr>
            <td align="center"> <xsl:apply-templates select="TEI/text/group/text/body/lg/lg"/></td>
          </tr>
        </table>
      </body>
    </html>
 </xsl:template>
 <xsl:template match="lg">
  <xsl:value-of select="l[1]"/>
   <br/>
  <xsl:value-of select="l[3]"/>
   <br/>
 </xsl:template>
  
  <!-- Transformation : xsltproc ex7-3.xsl dormeur-tei.xml > ex7-3.html -->
  
</xsl:stylesheet>
