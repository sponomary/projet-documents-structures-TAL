<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>

  <!-- Ex.15 XSLT-4 : Construire une feuille de styles pour extraire (au format TXT) les items en relation de dépendance syntaxique de type SUJET (les classer et les compter) -->

  <xsl:template match="/">
    <xsl:apply-templates select="/baselexicometrique/trame/items/item"/>
  </xsl:template>
  
  <xsl:template match="item">
    <xsl:if test="./a[7][contains(text(),'SUB')]">
      <xsl:variable name="id_gouv" select="substring-before(substring-after(./a[7], 'SUB('),')')"/>
      <xsl:variable name="id_dep" select="@pos"/>
      <xsl:variable name="dep" select="./f"/>
      <xsl:variable name="item_gouv" select="$id_dep - $id_gouv"/>
      
      <!-- si le gouverneur précède le sujet -->
      <xsl:if test="$item_gouv > 0"> 
        <xsl:value-of select="preceding-sibling::item[$item_gouv]/f"/><xsl:text> </xsl:text><xsl:value-of select="$dep"/>
        <xsl:text>&#xa;</xsl:text>
      </xsl:if>
      
      <!-- si le gouverneur suit le sujet -->
      <xsl:if test="$item_gouv &lt; 0">
        <xsl:value-of select="$dep"/><xsl:text> </xsl:text><xsl:value-of select="following-sibling::item[-$item_gouv]/f"/>
        <xsl:text>&#xa;</xsl:text>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <!-- commande: xsltproc ex15-p1-q4.xsl baseTrameurFromRhapsodie.xml > ex15-p1-q4.txt -->
  <!-- commande de tri: xsltproc ex15-p1-q4.xsl baseTrameurFromRhapsodie.xml | sort | uniq -c | sort -gr > ex15-p1-q4_sorted.txt -->

</xsl:stylesheet>
