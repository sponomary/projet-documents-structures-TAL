<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="utf-8"/>
    
    <!-- Construire des feuilles de style pour extraire le patron DET—ADJ—NOM -->
    
    <xsl:template match="/">
        <xsl:text>Étiquetage TreeTagger des résultats d'extraction de la rubrique 3208 "À la une" 2017</xsl:text>
        <xsl:text> &#xa;</xsl:text><xsl:text> &#xa;</xsl:text>
        <xsl:text> Affichage en texte simple du patron DET—ADJ—NOM</xsl:text>
        <xsl:text> &#xa;</xsl:text><xsl:text> &#xa;</xsl:text>
        <xsl:apply-templates select=".//article" />
    </xsl:template>
    <xsl:template match="article">
        <xsl:for-each select="element">
            <xsl:if test="(./data[1][contains(text(),'DET')])">
                <xsl:variable name="p1" select="./data[3]/text()" />
                <xsl:if test="following-sibling::element[1][./data[1][contains(text(),'ADJ')]]">
                    <xsl:variable name="p2" select="following-sibling::element[1]/data[3]/text()" />
                    <xsl:if test="following-sibling::element[2][./data[1][contains(text(),'NOM')]]">
                        <xsl:variable name="p3" select="following-sibling::element[2]/data[3]/text()" />
                        <xsl:value-of select="$p1" />
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$p2" />
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$p3" />
                        <xsl:text> &#xa;</xsl:text>
                    </xsl:if>
                </xsl:if>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <!-- xsltproc ex14-p1-q2.2.xsl 3208-2017-v2.xml > ex14-p1-q2.2.txt  -->
    
</xsl:stylesheet>