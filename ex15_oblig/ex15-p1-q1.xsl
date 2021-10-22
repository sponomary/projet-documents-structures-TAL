<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>

    <!-- Ex.15 XSLT-1 : Construire une feuille de styles pour afficher uniquement le texte (sortie TXT) -->

    <xsl:template match="/">
        <xsl:text>Trame RHAPSODIE pour Le Trameur&#xa;&#xa;</xsl:text>
        <xsl:text>Ex.15 XSLT-1 : Construire une feuille de styles pour afficher uniquement le texte&#xa;&#xa;</xsl:text>
        <xsl:for-each select="baselexicometrique/trame/items/item">
            <xsl:if test="@type = 'forme' and not(f='&amp;') and not(f='XXX')">
                <xsl:value-of select="f" /><xsl:text>&#160;</xsl:text>
            </xsl:if>
            <xsl:if test="f = '§'">
                <xsl:text> &#xa;</xsl:text> 
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <!-- commande: xsltproc ex15-p1-q1.xsl baseTrameurFromRhapsodie.xml > ex15-p1-q1.txt  -->

</xsl:stylesheet>
