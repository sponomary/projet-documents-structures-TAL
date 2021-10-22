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
          .right {
          text-align: right;
          font-weight: bold;
          }
        </style>
        <title>Exercice 7 : Exploration d’un fichier TEI</title>
      </head>
      <body>
        <h1>Exercice 7</h1>
        <h2>question 1</h2>
        <p align="center">Afficher le nom de l'auteur, le titre du poème, la date, et le recueil, dans cet ordre et au sein d'une page HTML bien formée.</p>
        <table align="center" border="3">
          <tr>
            <th colspan="2">
              <img src="dormeur.jpeg" alt="Le Dormeur du Val"/>
            </th>
          </tr>
          <tr>
            <td class="right">Auteur :</td>
            <td> <xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/author"/></td>
          </tr>
          <tr>
            <td class="right">Titre :</td>
            <td><xsl:value-of select="TEI/text/group/text/front/head"/></td>
          </tr>
          <tr>
            <td class="right">Date :</td>
            <td><xsl:value-of select="TEI/text/group/text/front/dateline"/></td>
          </tr>
          <tr>
            <td class="right">Recueil :</td>
            <td><xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/title"/></td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
  
  <!-- Transformation : xsltproc ex7-1.xsl dormeur-tei.xml > ex7-1.html -->
  
</xsl:stylesheet>
