<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/table">
    <html>
      <head>
        <style>
          body {
          background-color: #EDDCD2}
          table {
          background-color: #FFFFFF;
          border-collapse: collapse;
          width: 90%;
          }
          th, td {
          border: 1px solid black;
          padding: 10px;
          }
          h1 {
          font-family: 'Rock Salt', cursive;
          text-shadow: -1px -1px 1px #aaa,
          0px 4px 1px rgba(0,0,0,0.5),
          4px 4px 5px rgba(0,0,0,0.7),
          0px 0px 7px rgba(0,0,0,0.4);
          }
          footer {
          font: italic 1em 'Georgia';
          }
          .header {
          background-color: #DDBEA9;
          }
        </style>
        <title>Exercice 8 : Regrouper des éléments</title>
      </head>
      <body>
        <h1 align="center">Infirmières</h1>
        <table align="center">
          <tr bgcolor="CB997E">
            <th>Numéro</th>
            <th>Âge</th>
            <th>Années d'étude</th>
            <th>Diplôme</th>
            <th>Ancienneté</th>
            <th>Service</th>
          </tr>
          <xsl:for-each select="ligne">
            <xsl:if test="not(preceding-sibling::ligne/classe_anciennete=./classe_anciennete)">
              <tr align="center">
                <th class="header" colspan="6">
                  <xsl:value-of select="./classe_anciennete"/>
                </th>
              </tr>
            </xsl:if>
          <tr>
            <td>
              <xsl:value-of select="./*[1]"/>
            </td>
            <td align="center">
              <xsl:value-of select="./*[2]"/>
            </td>
            <td align="center">
              <xsl:value-of select="./*[3]"/>
            </td>
            <td align="center">
              <xsl:value-of select="./*[4]"/>
            </td>
            <td align="center">
              <xsl:value-of select="./*[5]"/>
            </td>
            <td align="center">
              <xsl:value-of select="./*[7]"/>
            </td>
          </tr>
          </xsl:for-each>
        </table>
        <br />
        <hr />
      </body>
      <footer>
        <center>Alexandra PONOMAREVA (M1 TAL)</center>
      </footer>
    </html>    
    </xsl:template>
</xsl:stylesheet>
