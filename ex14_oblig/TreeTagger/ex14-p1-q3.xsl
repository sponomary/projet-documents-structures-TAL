<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
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
                    .ptr1 {background-color: #F3F781;}
                    .ptr2 {background-color: #d3e0ea;}
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
                    <h1>Les patrons dans un arbre de fils RSS étiqueté avec TreeTagger</h1>
                </div>
                <p><center>
                    Patrons <span class="ptr1">DET-ADJ-NOM</span> et <span class="ptr2">VERBE-PRP-DET-NOM</span>
                </center>
                </p>	
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Item</th>
                            <th scope="col">Titre</th>
                            <th scope="col">Description</th>
                        </tr>
                    </thead>
                            <xsl:apply-templates select="PARCOURS/FILTRAGE/item"/>
                </table>            
            </body>
        </html> 
    </xsl:template>
    
    <xsl:template match="PARCOURS/FILTRAGE/item">
        <tbody>
            <tr>
                <th scope="row">
                    <xsl:value-of select="@number" />
                </th>
                <div class="item">
                <td>
                    <!-- Pour chaque titre -->
                    <xsl:for-each select="./titre">
                        <p>
                            <xsl:for-each select="./article/element">
                                <xsl:choose>
                                    
                                    <xsl:when test="./data[contains(@type,'type')][contains(text(),'DET')] and following-sibling::element[1]/data[contains(@type,'type')][contains(text(),'ADJ')] and following-sibling::element[2]/data[contains(@type,'type')][contains(text(),'NOM')]">
                                        <span class="ptr1"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>	
                                    </xsl:when>
                                    <xsl:when test="./data[contains(@type,'type')]='ADJ' and preceding-sibling::element[1]/data[contains(@type,'type')][contains(text(),'DET')] and following-sibling::element[1]/data[contains(@type,'type')][contains(text(),'NOM')]">
                                        <span class="ptr1"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>			
                                    </xsl:when>
                                    <xsl:when test="./data[contains(@type,'type')]='NOM' and preceding-sibling::element[1]/data[contains(@type,'type')][contains(text(),'ADJ')] and preceding-sibling::element[2]/data[contains(@type,'type')][contains(text(),'DET')]">
                                        <span class="ptr1"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>		
                                    </xsl:when>
                                    
                                    <xsl:when test="./data[contains(@type,'type')][contains(text(),'VER')] and following-sibling::element[1]/data[contains(@type,'type')][contains(text(),'PRP')] and following-sibling::element[2]/data[contains(@type,'type')][contains(text(),'DET')] and following-sibling::element[3]/data[contains(@type,'type')][contains(text(),'NOM')]">
                                        <span class="ptr2"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>	
                                    </xsl:when>
                                    <xsl:when test="./data[contains(@type,'type')][contains(text(),'PRP')] and preceding-sibling::element[1]/data[contains(@type,'type')][contains(text(),'VER')] and following-sibling::element[2]/data[contains(@type,'type')][contains(text(),'NOM')] and following-sibling::element[1]/data[contains(@type,'type')][contains(text(),'DET')]">
                                        <span class="ptr2"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>			
                                    </xsl:when>
                                    <xsl:when test="./data[contains(@type,'type')][contains(text(),'DET')] and preceding-sibling::element[1]/data[contains(@type,'type')][contains(text(),'PRP')] and preceding-sibling::element[2]/data[contains(@type,'type')][contains(text(),'VER')] and following-sibling::element[1]/data[contains(@type,'type')][contains(text(),'NOM')]">
                                        <span class="ptr2"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>		
                                    </xsl:when>
                                    <xsl:when test="./data[contains(@type,'type')][contains(text(),'NOM')] and preceding-sibling::element[1]/data[contains(@type,'type')][contains(text(),'DET')] and preceding-sibling::element[2]/data[contains(@type,'type')][contains(text(),'PRP')] and preceding-sibling::element[3]/data[contains(@type,'type')][contains(text(),'VER')]">
                                        <span class="ptr2"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>		
                                    </xsl:when>
                                    
                                    <xsl:otherwise>
                                        <xsl:value-of select="./data[contains(@type,'string')]"/><xsl:text> </xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </p>   
                    </xsl:for-each>          
                </td>
                <td>
                    <!-- Pour chaque description -->
                    <xsl:for-each select="./description">
                        <p>
                            <xsl:for-each select="./article/element">
                                <xsl:choose>
                                    
                                    <xsl:when test="./data[contains(@type,'type')][contains(text(),'DET')] and following-sibling::element[1]/data[contains(@type,'type')][contains(text(),'ADJ')] and following-sibling::element[2]/data[contains(@type,'type')][contains(text(),'NOM')]">
                                        <span class="ptr1"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>	
                                    </xsl:when>
                                    <xsl:when test="./data[contains(@type,'type')]='ADJ' and preceding-sibling::element[1]/data[contains(@type,'type')][contains(text(),'DET')] and following-sibling::element[1]/data[contains(@type,'type')][contains(text(),'NOM')]">
                                        <span class="ptr1"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>			
                                    </xsl:when>
                                    <xsl:when test="./data[contains(@type,'type')]='NOM' and preceding-sibling::element[1]/data[contains(@type,'type')][contains(text(),'ADJ')] and preceding-sibling::element[2]/data[contains(@type,'type')][contains(text(),'DET')]">
                                        <span class="ptr1"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>		
                                    </xsl:when>
                                    
                                    
                                    <xsl:when test="./data[contains(@type,'type')][contains(text(),'VER')] and following-sibling::element[1]/data[contains(@type,'type')][contains(text(),'PRP')] and following-sibling::element[2]/data[contains(@type,'type')][contains(text(),'DET')] and following-sibling::element[3]/data[contains(@type,'type')][contains(text(),'NOM')]">
                                        <span class="ptr2"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>	
                                    </xsl:when>
                                    <xsl:when test="./data[contains(@type,'type')][contains(text(),'PRP')] and preceding-sibling::element[1]/data[contains(@type,'type')][contains(text(),'VER')] and following-sibling::element[2]/data[contains(@type,'type')][contains(text(),'NOM')] and following-sibling::element[1]/data[contains(@type,'type')][contains(text(),'DET')]">
                                        <span class="ptr2"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>			
                                    </xsl:when>
                                    <xsl:when test="./data[contains(@type,'type')][contains(text(),'DET')] and preceding-sibling::element[1]/data[contains(@type,'type')][contains(text(),'PRP')] and preceding-sibling::element[2]/data[contains(@type,'type')][contains(text(),'VER')] and following-sibling::element[1]/data[contains(@type,'type')][contains(text(),'NOM')]">
                                        <span class="ptr2"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>		
                                    </xsl:when>
                                    <xsl:when test="./data[contains(@type,'type')][contains(text(),'NOM')] and preceding-sibling::element[1]/data[contains(@type,'type')][contains(text(),'DET')] and preceding-sibling::element[2]/data[contains(@type,'type')][contains(text(),'PRP')] and preceding-sibling::element[3]/data[contains(@type,'type')][contains(text(),'VER')]">
                                        <span class="ptr2"><patron><xsl:value-of select="./data[contains(@type,'string')]"/></patron> (<pos><xsl:value-of select="./data[contains(@type,'type')]"/></pos>, <lemme><xsl:value-of select="./data[contains(@type,'lemma')]"/></lemme>)<xsl:text> </xsl:text></span>		
                                    </xsl:when>
                                    
                                    <xsl:otherwise>
                                        <xsl:value-of select="./data[contains(@type,'string')]"/><xsl:text> </xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </p>
                    </xsl:for-each>
                </td>
                </div>
            </tr>
        </tbody>
    </xsl:template>
</xsl:stylesheet>