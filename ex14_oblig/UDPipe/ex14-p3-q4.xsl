<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <!-- Construire une feuille de styles pour afficher les contenus étiquetés en mettant au jour un patron morphosyntaxique sur les « titres » uniquement puis sur les « descriptions » uniquement -->
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <title>Exercice 14</title>
                <style>
                    body {padding: 35px;}
                    div.header {text-align: center; font-size:11px;}
                    div.item {text-align: justify; margin-left:150px; margin-right: 250px;}
                    lemme {font-size: 10px; font-weight:bold; color: #6e7c7c;}
                    pos {font-size: 10px; font-weight:bold; color: #29bb89;}
                    .ptr {background-color: #F3F781;}
                </style>
                <!-- CSS Stylesheets -->
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
                <!-- Bootstrap Scripts -->
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
            </head>
            <body>
                <div class="header">
                    <h1>Étiquetage UDPipe des résultats d'extraction de la rubrique : Culture 2020</h1> 
                    <h3>Affichage du contenu des titres étiquetés et puis des descriptions étiquetées</h3>
                </div>
                <p><center>Patron <span class="ptr">DET-NOM-ADJ</span></center></p>	
                
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Titre</th>
                            <th scope="col">Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <div class="item">
                            <td><xsl:for-each select="//titre"><span style="color: blue"><xsl:apply-templates select=".//element" mode="patron"/><xsl:text> &#xa;</xsl:text><hr/></span></xsl:for-each></td>
                            <td><xsl:for-each select="//description"><xsl:apply-templates select=".//element" mode="patron"/><xsl:text> &#xa;</xsl:text><hr/></xsl:for-each></td>
                            </div>
                        </tr>
                    </tbody>
                </table>            
            </body>
        </html> 
    </xsl:template>
    
    <xsl:template match="element" mode="patron">
        <xsl:choose>
            
            <xsl:when test="./data[contains(@type,'upos')][contains(text(),'DET')] and following-sibling::element[1]/data[contains(@type,'upos')][contains(text(),'NOUN')] and following-sibling::element[2]/data[contains(@type,'upos')][contains(text(),'ADJ')]">
                <span class="ptr"><patron><xsl:value-of select="./data[contains(@type,'form')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'upos')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>	
            </xsl:when>
            <xsl:when test="./data[contains(@type,'upos')][contains(text(),'NOUN')] and preceding-sibling::element[1]/data[contains(@type,'upos')][contains(text(),'DET')] and following-sibling::element[1]/data[contains(@type,'upos')][contains(text(),'ADJ')]">
                <span class="ptr"><patron><xsl:value-of select="./data[contains(@type,'form')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'upos')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>			
            </xsl:when>
            <xsl:when test="./data[contains(@type,'upos')][contains(text(),'ADJ')] and preceding-sibling::element[1]/data[contains(@type,'upos')][contains(text(),'NOUN')] and preceding-sibling::element[2]/data[contains(@type,'upos')][contains(text(),'DET')]">
                <span class="ptr"><patron><xsl:value-of select="./data[contains(@type,'form')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'upos')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>		
            </xsl:when>

            <xsl:otherwise>
                <xsl:value-of select="./data[contains(@type,'form')]"/><xsl:text> </xsl:text>
            </xsl:otherwise>
            
        </xsl:choose>
    </xsl:template>
    
    <!-- xsltproc ex14-p3-q4.xsl sortieUD-regex_3246.xml > ex14-p3-q4.html  -->
    
</xsl:stylesheet>