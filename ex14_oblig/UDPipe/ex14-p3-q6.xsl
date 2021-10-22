<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output encoding="UTF-8" method="text"/>
    
    <!-- Construire une feuille de styles pour extraire la liste des POS en relation de dépendance syntaxique de type OBJ (les classer et les compter) -->
    
    <xsl:template match="/">
        
        <xsl:for-each select="//element">
            <xsl:if test="./data[8][contains(text(),'obj')]">
                <!-- Extraction de la position de l'objet -->
                <xsl:variable name="id_objet" select="./data[1]"/>
                <!-- Extraction de la position du gouverneur -->
                <xsl:variable name="id_gouverneur" select="./data[7]"/>
                <xsl:variable select="$id_gouverneur - $id_objet" name="gouverneur"/>
                <!-- Affichage -->
                <xsl:if test="$gouverneur&lt;0">
                    <!-- Gouverneur est placé avant de l'objet -->
                    <xsl:text>GOUV [</xsl:text><xsl:value-of select="preceding-sibling::element[data[1]=$id_gouverneur]/data[4]"/><xsl:text>] </xsl:text>
                    <xsl:text> --> OBJ [</xsl:text><xsl:value-of select="./data[4]"/><xsl:text>] </xsl:text>
                </xsl:if>
                <xsl:if test="$gouverneur&gt;0">
                    <!-- Gouverneur est après l'objet -->
                    <xsl:text>OBJ [</xsl:text><xsl:value-of select="./data[4]"/><xsl:text>] </xsl:text>
                    <xsl:text> &lt;-- GOUV [</xsl:text><xsl:value-of select="following-sibling::element[data[1]=$id_gouverneur]/data[4]"/><xsl:text>] </xsl:text>
                </xsl:if>
                <xsl:text>&#x0a;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        
    </xsl:template>
    
    <!-- xsltproc ex14-p3-q6.xsl sortieUD-regex_3246.xml | sort | uniq -c | sort -gr > ex14-p3-q6.txt   -->
    
</xsl:stylesheet>