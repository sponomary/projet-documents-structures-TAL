<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>

  <!-- Ex.15 XSLT-3 : Construire une feuille de styles pour extraire (en format TXT) au moins 2 patrons morpho-syntaxiques de longueurs différentes -->

  <xsl:template match="/">
    <xsl:text>Trame RHAPSODIE pour Le Trameur&#xa;&#xa;</xsl:text>
    <xsl:text>Ex.15 XSLT-3 : Construire une feuille de styles pour extraire au moins 2 patrons morpho-syntaxiques&#xa;&#xa;</xsl:text>
    <xsl:text>-------------------------------------&#xa;</xsl:text>
    <xsl:text>Patron ADJ-NOM&#xa;</xsl:text>
    <xsl:text>-------------------------------------&#xa;</xsl:text>
    <xsl:call-template name="ADJ-NOM"/>
    <xsl:text>&#xa;</xsl:text>
    <xsl:text>-------------------------------------&#xa;</xsl:text>
    <xsl:text>Patron VERBE-DET-NOM&#xa;</xsl:text>
    <xsl:text>-------------------------------------&#xa;</xsl:text>
    <xsl:call-template name="VERBE-DET-NOM"/>
  </xsl:template>

  <xsl:template name="ADJ-NOM">
    <xsl:for-each select="baselexicometrique/trame/items/item">
      <xsl:if test="c = 'Adj' and following-sibling::item[attribute::type = 'forme'][1]/c = 'N'">
        <xsl:value-of select="f"/>
        <xsl:text>&#160;</xsl:text><xsl:value-of select="following-sibling::item[attribute::type='forme'][1]/f"/>
        <xsl:text>&#xa;</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="VERBE-DET-NOM">
    <xsl:for-each select="baselexicometrique/trame/items/item">
      <xsl:if test="c='V' and following-sibling::item[attribute::type='forme'][1]/c='D' and following-sibling::item[attribute::type='forme'][2]/c='N'">
        <xsl:value-of select="f"/>
        <xsl:text>&#160;</xsl:text><xsl:value-of select="following-sibling::item[attribute::type='forme'][1]/f"/>
        <xsl:text>&#160;</xsl:text><xsl:value-of select="following-sibling::item[attribute::type='forme'][2]/f"/>
        <xsl:text>&#xa;</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <!-- commande: xsltproc ex15-p1-q3.xsl baseTrameurFromRhapsodie.xml > ex15-p1-q3.txt -->

</xsl:stylesheet>
