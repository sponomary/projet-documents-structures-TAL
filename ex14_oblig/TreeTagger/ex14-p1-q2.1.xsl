<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="utf-8"/>
    
    <!-- Construire des feuilles de style pour extraire le patron NOM-ADJ -->
    
    <xsl:template match="/">
        <xsl:text>Étiquetage TreeTagger des résultats d'extraction de la rubrique 3208 "À la une" 2017</xsl:text>
        <xsl:text> &#xa;</xsl:text><xsl:text> &#xa;</xsl:text>
        <xsl:text>Affichage en texte simple du patron NOM—ADJ</xsl:text>
        <xsl:text> &#xa;</xsl:text><xsl:text> &#xa;</xsl:text>
            <xsl:apply-templates select="//element" />
        </xsl:template>
        <xsl:template match="element">
            <xsl:choose>
                <xsl:when test="(./data[1][contains(text(),'NOM')]) and (following-sibling::element[1][./data[contains(text(),'ADJ')]])">
                    <xsl:value-of select="./data[3]" />
                    <xsl:text> </xsl:text>
                </xsl:when>
                <xsl:when test="(./data[1][contains(text(),'ADJ')]) and (preceding-sibling::element[1][./data[contains(text(),'NOM')]])">
                    <xsl:value-of select="./data[3]" />
                    <xsl:text> &#xa;</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:template>
    
    <!-- xsltproc ex14-p1-q2.1.xsl 3208-2017-v2.xml > ex14-p1-q2.1.txt  -->
    
</xsl:stylesheet>