<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">
    
    <!-- Peut-on envisager de construire une feuille de styles pour afficher chaque « titre » en regard de sa « description » : par exemple un tableau avec 2 colonnes, à gauche les titres et à droite les descriptions (un alignement en somme) ? si cela n’est pas possible directement, quel est l’alignement minimal que l’on peut mettre en œuvre ? Construire cet alignement minimal... -->
    
    <xsl:template match="/">     
        <html>    
            <head>
                <meta charset="UTF-8" />
                <title>Exercice 14</title>
                <style>
                    body {font-family: "Gill Sans", sans-serif; padding: 35px;}
                    div.header {text-align: center;}
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
                    <h3>Alignement titre-description</h3>
                </div>
                    <table class="table table-sm">
                        <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Titres</th>
                                    <th scope="col">Descriptions</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <xsl:for-each select="//article">
                                    <tr>                                      
                                        <xsl:for-each select="titre">
                                        <td>
                                            <xsl:call-template name="stringjoin">
                                                <xsl:with-param name="valueList" select="element/data[2]/text()"/>
                                                <xsl:with-param name="separator" select="' '"/>
                                            </xsl:call-template>
                                        </td>
                                        </xsl:for-each>
                                        <xsl:for-each select="description">
                                        <td>
                                            <xsl:call-template name="stringjoin">
                                                <xsl:with-param name="valueList" select="element/data[2]/text()"/>
                                                <xsl:with-param name="separator" select="' '"/>
                                            </xsl:call-template>
                                   
                                        </td>
                                        </xsl:for-each>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    <hr/>
                    <hr/>
            </body>  
        </html>
        
    </xsl:template>
    
    <xsl:template name="stringjoin">
        <xsl:param name="valueList" select="''"/>
        <xsl:param name="separator" select="','"/>
        <xsl:for-each select="$valueList">
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($separator, .)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <!-- xsltproc ex14-p3-q2.xsl sortieUD-regex_3246.xml > ex14-p3-q2.html -->
    
</xsl:stylesheet>