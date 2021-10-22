<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <!-- Construire des feuilles de style pour extraire (au format TXT) au moins 3 patrons morpho-syntaxiques (de longueurs différentes) sur les « titres » uniquement puis sur les « descriptions » uniquement -->
    
    <xsl:template match="/">
        <xsl:text>Patron 1 : NOM + ADJ&#xa;&#xa;</xsl:text> 
        
        <xsl:text>----------------------------&#xa;</xsl:text>
        <xsl:text>Sur les titres :&#xa;</xsl:text>
        <xsl:text>----------------------------&#xa;</xsl:text>

        <xsl:for-each select="//titre">
        <xsl:apply-templates select=".//element" mode="patron1"/>
        </xsl:for-each>
        
        <xsl:text>----------------------------&#xa;</xsl:text>
        <xsl:text>Sur les descriptions :&#xa;</xsl:text>
        <xsl:text>----------------------------&#xa;</xsl:text>

        <xsl:for-each select="//description">
            <xsl:apply-templates select=".//element" mode="patron1"/>
        </xsl:for-each>
       
        <xsl:text>&#xa;----------------------------&#xa;</xsl:text>

        <xsl:text>Patron 2 : DET + ADJ + NOM&#xa;&#xa;</xsl:text>

        <xsl:text>----------------------------&#xa;</xsl:text>
        <xsl:text>Sur les titres :&#xa;</xsl:text>
        <xsl:text>----------------------------&#xa;</xsl:text>

        <xsl:for-each select="//titre">
            <xsl:apply-templates select=".//element" mode="patron2"/>
        </xsl:for-each>
        
        <xsl:text>----------------------------&#xa;</xsl:text>
        <xsl:text>Sur les descriptions :&#xa;</xsl:text>
        <xsl:text>----------------------------&#xa;</xsl:text>

        <xsl:for-each select="//description">
            <xsl:apply-templates select=".//element" mode="patron2"/>
        </xsl:for-each>
        
        
        <xsl:text>&#xa;----------------------------&#xa;</xsl:text>
        
        <xsl:text>Patron 3 : VERBE + ADP + DET + NOUN&#xa;&#xa;</xsl:text>
        
        <xsl:text>----------------------------&#xa;</xsl:text>
        <xsl:text>Sur les titres :&#xa;</xsl:text>
        <xsl:text>----------------------------&#xa;</xsl:text>

        <xsl:for-each select="//titre">
            <xsl:apply-templates select=".//element" mode="patron3"/>
        </xsl:for-each>
        
        <xsl:text>----------------------------&#xa;</xsl:text>
        <xsl:text>Sur les descriptions :&#xa;</xsl:text>
        <xsl:text>----------------------------&#xa;</xsl:text>

        <xsl:for-each select="//description">
            <xsl:apply-templates select=".//element" mode="patron3"/>
        </xsl:for-each>
        
        <xsl:text>&#xa;----------------------------&#xa;</xsl:text>

    </xsl:template>
    
    <!-- PATRON 1 -->
    
    <xsl:template match="element" mode="patron1">
        <xsl:choose>
            <xsl:when test="(./data[contains(text(),'NOUN')]) and (following-sibling::element[1][./data[contains(text(),'ADJ')]])">
                <xsl:value-of select="./data[3]" />
                <xsl:text> </xsl:text>
            </xsl:when>
            <xsl:when test="(./data[contains(text(),'ADJ')]) and (preceding-sibling::element[1][./data[contains(text(),'NOUN')]])">
                <xsl:value-of select="./data[3]" />
                <xsl:text>&#xa;</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- PATRON 2 -->
    
    <xsl:template match="element" mode="patron2">
        <xsl:choose>
        <xsl:when test="./data[contains(text(),'DET')] and following-sibling::element[1]/data[contains(text(),'ADJ')] and following-sibling::element[2]/data[contains(text(),'NOUN')]">
            <xsl:value-of select="./data[contains(@type,'form')]"/><xsl:text> </xsl:text>
        </xsl:when>
            <xsl:when test="./data[contains(text(),'ADJ')] and preceding-sibling::element[1]/data[contains(text(),'DET')] and following-sibling::element[1]/data[contains(text(),'NOUN')]">
                <xsl:value-of select="./data[contains(@type,'form')]"/><xsl:text> </xsl:text>		
        </xsl:when>
            <xsl:when test="./data[contains(text(),'NOUN')] and preceding-sibling::element[1]/data[contains(text(),'ADJ')] and preceding-sibling::element[2]/data[contains(text(),'DET')]">
                <xsl:value-of select="./data[contains(@type,'form')]"/><xsl:text> </xsl:text>	
                <xsl:text>&#xa;</xsl:text>
        </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- PATRON 3 -->
    
    <xsl:template match="element" mode="patron3">
        <xsl:choose>
        <xsl:when test="./data[contains(text(),'VERB')] and following-sibling::element[1]/data[contains(text(),'ADP')] and following-sibling::element[2]/data[contains(text(),'DET')] and following-sibling::element[3]/data[contains(text(),'NOUN')]">
            <xsl:value-of select="./data[contains(@type,'form')]"/><xsl:text> </xsl:text>	
        </xsl:when>
        <xsl:when test="./data[contains(text(),'ADP')] and preceding-sibling::element[1]/data[contains(text(),'VERB')] and following-sibling::element[2]/data[contains(text(),'NOUN')] and following-sibling::element[1]/data[contains(text(),'DET')]">
            <xsl:value-of select="./data[contains(@type,'form')]"/><xsl:text> </xsl:text>		
        </xsl:when>
        <xsl:when test="./data[contains(text(),'DET')] and preceding-sibling::element[1]/data[contains(text(),'ADP')] and preceding-sibling::element[2]/data[contains(text(),'VERB')] and following-sibling::element[1]/data[contains(text(),'NOUN')]">
            <xsl:value-of select="./data[contains(@type,'form')]"/><xsl:text> </xsl:text>		
        </xsl:when>
        <xsl:when test="./data[contains(text(),'NOUN')] and preceding-sibling::element[1]/data[contains(text(),'DET')] and preceding-sibling::element[2]/data[contains(text(),'ADP')] and preceding-sibling::element[3]/data[contains(text(),'VERB')]">
            <xsl:value-of select="./data[contains(@type,'form')]"/><xsl:text> </xsl:text>
            <xsl:text>&#xa;</xsl:text>
        </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- xsltproc ex14-p3-q3.xsl sortieUD-regex_3246.xml > ex14-p3-q3.txt  -->
    
</xsl:stylesheet>