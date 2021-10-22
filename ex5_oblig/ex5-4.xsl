<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="UTF-8"/>
	
	<!-- Définir une feuille de style dont le résultat est un document TXT contenant la liste des catégories ; compter aussi la fréquence de chacune -->
	
	<xsl:template match ="/cordial2xml">
			<xsl:for-each select="w">
				<xsl:value-of select="categorie"/><xsl:text>&#xa;</xsl:text>
			</xsl:for-each>
	</xsl:template>	

	<!-- xsltproc ex5-4.xsl duchn.xml | sort | uniq -c | sort -gr > ex5-4.txt -->
	
</xsl:stylesheet>