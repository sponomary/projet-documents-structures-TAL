<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	
	<!-- Définir une feuille de style dont le résultat est un document HTML et donnant à voir uniquement le texte -->
	
	<xsl:template match ="/cordial2xml">
		<html>
			<head>
				<meta charset="UTF-8" />
				<title>Exercice 5</title>
				<style>
					body {font-family: "Gill Sans", sans-serif; padding: 35px;}
					.header {text-align: center;}
				</style>
			</head>
			<body>
				<h1 class="header">Affichage du texte du document DUCHN.xml</h1> 
				<p>
					<xsl:for-each select="w">
						<xsl:choose>						
							<xsl:when test="forme[contains(text(), '.')]">
								<xsl:value-of select="concat(substring-before(forme/text(), '.'), ' .')"/>
								<br /><hr />
								<xsl:value-of select="concat(substring-after(forme/text(), '.'), ' ')"/>
							</xsl:when>
							
							<xsl:when test="forme[contains(text(), '?')]">
								<xsl:value-of select="concat(substring-before(forme/text(), '?'), ' ?')"/>
								<br /><hr />
								<xsl:value-of select="concat(substring-after(forme/text(), '?'), ' ')"/>
							</xsl:when>
							
							<xsl:when test="forme[contains(text(), '!')]">
								<xsl:value-of select="concat(substring-before(forme/text(), '!'), ' !')"/>
								<br /><hr />
								<xsl:value-of select="concat(substring-after(forme/text(), '!'), ' ')"/>
							</xsl:when>

							<xsl:otherwise>
								<xsl:value-of select="concat(forme/text(),' ')"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</p>
			</body>
		</html>
	</xsl:template>
	
	<!-- xsltproc ex5-1.xsl duchn.xml > ex5-1.html -->

</xsl:stylesheet>