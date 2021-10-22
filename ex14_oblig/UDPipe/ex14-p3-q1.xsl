<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">
    
    <!-- Construire une feuille de styles pour afficher les contenus étiquetés des «titres» uniquement -->
    
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
                    <h3>Affichage du contenu des titres étiquetés</h3>
                </div>
                <xsl:for-each select="//titre">
                    <table class="table table-sm">
                        <thead class="thead-dark">
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Form</th>
                                    <th scope="col">Lemma</th>
                                    <th scope="col">UPOS</th>
                                    <th scope="col">XPOS</th>
                                    <th scope="col">Feats</th>
                                    <th scope="col">Head</th>
                                    <th scope="col">DEPREL</th>
                                    <th scope="col">DEPS</th>
                                    <th scope="col">Misc</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="element">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="./data[1]"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="./data[2]"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="./data[3]"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="./data[4]"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="./data[5]"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="./data[6]"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="./data[7]"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="./data[8]"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="./data[9]"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="./data[10]"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    
                    <hr/>
                    <hr/>
                </xsl:for-each>

            </body>
            
        </html>
        
    </xsl:template>
    
    <!-- xsltproc ex14-p3-q1.xsl sortieUD-regex_3246.xml > ex14-p3-q1.html -->
    
</xsl:stylesheet>