<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <!-- Définir une feuille de style dont le résultat est un document TXT contenant la liste des séquences NOM PREP NOM -->
    
    <xsl:template match="/">
        <xsl:text>Affichage en texte du patron NOM-PREP-NOM&#xa;&#xa;</xsl:text>
        <xsl:for-each select="//w[categorie/text()='PREP'][preceding-sibling::*[1][substring(categorie/text(),1,1)='N'] and following-sibling::*[1][substring(categorie/text(),1,1)='N']]">
            <xsl:choose>
                <xsl:when test="preceding-sibling::*[1]/forme[contains(text(),'.')]|preceding-sibling::*[1]/forme[contains(text(),'?')]|preceding-sibling::*[1]/forme[contains(text(),'!')]">
                </xsl:when>
                <xsl:when test="following-sibling::*[1]/forme[contains(text(),'.')]">
                    <xsl:value-of select="concat(preceding-sibling::*[1]/forme/text(),' ',forme/text(),' ',substring-before(following-sibling::*[1]/forme/text(),'.'))"/>
                    <xsl:text>&#xa;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(preceding-sibling::*[1]/forme/text(),' ',forme/text(),' ',following-sibling::*[1]/forme/text())"/>
                    <xsl:text>&#xa;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <!-- xsltproc ex5-7.xsl duchn.xml > ex5-7.txt -->
    
</xsl:stylesheet>