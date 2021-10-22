<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent ="yes"/>
  
  <!-- Construire une feuille de styles pour afficher les contenus étiquetés avec TreeTagger -->

  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Exercice 14</title>
        <style>
          body {
            font-family: "Gill Sans", sans-serif;
            padding: 35px;
            margin: 15px;
          }
          div.header {
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
        <div class="header">
          <h1>Étiquetage TreeTagger des résultats d'extraction de la rubrique : À la une 2017</h1>
          <h5>Affichage des contenus étiquetés des RSS extraits par

            <xsl:value-of select="PARCOURS/NOM"/>
          </h5>
        </div>
        <br/>
        <table class="table">
          <thead class="thead-dark">
            <tr>
              <th scope="col">Item</th>
              <th scope="col">Titre</th>
              <th scope="col">Description</th>
            </tr>
          </thead>

          <xsl:for-each select="PARCOURS/FILTRAGE/item">
            <tbody>
              <tr>
                <th scope="row">
                  <xsl:value-of select="@number"/>
                </th>
                <td>
                  
                  <!-- Pour chaque titre -->
                  <xsl:for-each select="titre/article/element">
                    
                    <!-- On affiche les données -->
                    <xsl:call-template name="getValues"/>
                  </xsl:for-each>
                </td>
                <td>
                  
                  <!-- Pour chaque description -->
                  <xsl:for-each select="description/article/element">
                    
                    <!-- On affiche les données -->
                    <xsl:call-template name="getValues"/>
                  </xsl:for-each>
                </td>
              </tr>
            </tbody>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="getValues">

    <xsl:value-of select="data[@type = 'string']"/>
    <span>
      (<span class="text-success">
        <xsl:value-of select="data[@type = 'type']"/></span>|<span class="text-muted">
        <xsl:value-of select="data[@type = 'lemma']"/></span>)
    </span>
  </xsl:template>
  
  <!-- Transformation: xsltproc ex14-p1-q1.xsl 3208-2017-v2.xml > ex14-p1-q1.html -->
    
</xsl:stylesheet>
