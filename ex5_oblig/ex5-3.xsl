<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="UTF-8"/>
	
	<!-- Définir une feuille de style dont le résultat est un document TXT contenant la liste des mots contenant la séquence « citoy », puis la séquence « patriot » ; compter aussi la fréquence de chacun des mots -->
	
	<xsl:template match ="/cordial2xml">
		<xsl:for-each select="w">
			<xsl:choose>
					<xsl:when test="(contains(forme, 'citoy')) or (contains(forme, 'patriot'))">
						<xsl:choose>
							<xsl:when test="forme[contains(text(), '.')]">
								<xsl:value-of select="substring-before(forme/text(), '.')"/>
								<xsl:text>&#xa;</xsl:text>
							</xsl:when>
							<xsl:when test="forme[contains(text(), '?')]">
								<xsl:value-of select="substring-before(forme/text(), '?')"/>
								<xsl:text>&#xa;</xsl:text>
							</xsl:when>
							<xsl:when test="forme[contains(text(), '!')]">
								<xsl:value-of select="substring-before(forme/text(), '!')"/>
								<xsl:text>&#xa;</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="forme"/><xsl:text>&#xa;</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>	
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<!-- xsltproc ex5-3.xsl duchn.xml | sort | uniq -c | sort -gr > ex5-3.txt -->
	
</xsl:stylesheet>