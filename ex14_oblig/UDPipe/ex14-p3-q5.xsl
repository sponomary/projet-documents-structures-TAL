<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <!-- Construire une feuille de styles pour extraire (au format TXT) les items en relation de dépendance syntaxique de type OBJ (les classer et les compter). Essayer de tenir compte de la différence titre/description -->
    
    <xsl:template match="/">
        <xsl:apply-templates select="//article/titre"/>
        <xsl:apply-templates select="//article/description"/>
    </xsl:template>
    
    <!-- Titres --> 
    <xsl:template match="//titre">
        <xsl:for-each select="element">
            <xsl:choose>
               
                <xsl:when test="(contains(.//data[8], 'obj'))">
                    <xsl:variable name="dep" select=".//data[2]"/>
                    <xsl:variable name="dep_id" select=".//data[1]"/>
                    <xsl:variable name="gouv_num" select=".//data[7]"/>
                    <xsl:variable name="node_gouv" select="$dep_id - $gouv_num"/>        
                    
                    <xsl:if test="$node_gouv &lt; 0">
                        <xsl:text> &#xA; </xsl:text>
                        <xsl:value-of select="$dep"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="following-sibling::element[-$node_gouv]/data[2]"/>
                        <xsl:text> (</xsl:text><xsl:value-of select="data[8]"/> <xsl:text>, TITRE)</xsl:text>
                    </xsl:if>
                    
                    <xsl:if test="$node_gouv &gt; 0">
                        <xsl:text> &#xA; </xsl:text>
                        <xsl:value-of select="preceding-sibling::element[$node_gouv]/data[2]"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$dep"/>
                        <xsl:text> (</xsl:text><xsl:value-of select="data[8]"/> <xsl:text>, TITRE)</xsl:text>
                    </xsl:if>
                </xsl:when>
                
            </xsl:choose>
        </xsl:for-each>  
    </xsl:template>
    
    <!-- Descriptions --> 
    <xsl:template match="//description">
        
        <xsl:for-each select="element">
            <xsl:choose>
                <xsl:when test="(contains(.//data[8], 'obj'))">
                    <xsl:variable name="dep" select=".//data[2]"/>
                    <xsl:variable name="dep_id" select=".//data[1]"/>
                    <xsl:variable name="gouv_num" select=".//data[7]"/>
                    <xsl:variable name="node_gouv" select="$dep_id - $gouv_num"/>         
                    
                    <xsl:if test="$node_gouv &lt; 0">
                        <xsl:text> &#xA; </xsl:text>
                        <xsl:value-of select="$dep"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="following-sibling::element[-$node_gouv]/data[2]"/>
                        <xsl:text> (</xsl:text><xsl:value-of select="data[8]"/> <xsl:text>, DESCR)</xsl:text>
                    </xsl:if>
                    
                    <xsl:if test="$node_gouv &gt; 0">
                        <xsl:text> &#xA; </xsl:text>
                        <xsl:value-of select="preceding-sibling::element[$node_gouv]/data[2]"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$dep"/>
                        <xsl:text> (</xsl:text><xsl:value-of select="data[8]"/> <xsl:text>, DESCR)</xsl:text>
                    </xsl:if>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <!-- xsltproc ex14-p3-q5.xsl sortieUD-regex_3246.xml | sort | uniq -c | sort -gr > ex14-p3-q5.txt   -->
   
</xsl:stylesheet>