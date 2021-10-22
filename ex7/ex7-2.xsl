<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output method="text" encoding="UTF-8"/>
 
 <!-- 1ère règle : la racine -->
 <!-- on veut du texte brut, donc pas de balises html -->
 <xsl:template match="/">
  <!-- récupération du contenu des balises avec le titre et la date -->
  <!--  utilisation des balises xql:text pour faire apparaître des retours à la ligne en texte brut -->
  <xsl:text>Titre : </xsl:text>
  <xsl:value-of select="TEI/text/group/text/front/head"/>
  <xsl:text>&#xa;</xsl:text> 
  <xsl:text>Date : </xsl:text>
  <xsl:value-of select="TEI/text/group/text/front/dateline"/>
  <xsl:text>&#xa;&#xa;</xsl:text> 
  <!-- application des règles concernant les noeuds contenant un vers -->
  <xsl:apply-templates select="TEI/text/group/text/body/lg/lg/l"/>
 </xsl:template>
 
 <!-- definition de la règle à appliquer sur les noeuds contenant un vers -->
 <!-- on récupère son contenu (noeud courant) et on affiche un retour à la ligne grâce à xsl:text -->
 <xsl:template match="l">
  <xsl:value-of select="."/>
  <xsl:text>&#xa;</xsl:text> 
 </xsl:template>
 
 <!-- Transformation : xsltproc ex7-2.xsl dormeur-tei.xml > ex7-2.txt -->
 
</xsl:stylesheet>