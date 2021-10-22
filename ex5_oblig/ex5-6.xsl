<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="UTF-8"/>
	
	<!-- Définir une feuille de style dont le résultat est un document TXT contenant la liste des séquences NOM ADJ -->
		
		<xsl:template match="/">
			<xsl:text>Affichage en texte du patron NOM-ADJ&#xa;&#xa;</xsl:text>
			<xsl:for-each select="//w[substring(categorie/text(),1,1)='N'][following-sibling::*[1][substring(categorie/text(),1,3)='ADJ']]">
				<xsl:choose>
					<xsl:when test="forme[contains(text(),'.')]">
					</xsl:when>
					<xsl:when test="following-sibling::*[1]/forme[contains(text(),'.')]">
						<xsl:value-of select="concat(forme/text(),' ',substring-before(following-sibling::*[1]/forme/text(),'.'))"/>
						<xsl:text>&#xa;</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(forme/text(),' ',following-sibling::*[1]/forme/text())"/>
						<xsl:text>&#xa;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:template>
	
	<!-- xsltproc ex5-6.xsl duchn.xml > ex5-6.txt -->
	
</xsl:stylesheet>