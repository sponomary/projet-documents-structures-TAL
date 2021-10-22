<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="no"/>
	
	<!-- Définir une feuille de style permettant d’afficher le texte en surlignant les mots de catégories NOM ou ADJ -->
	
	<xsl:template match ="/cordial2xml">
	<html>
		<head>
			<meta charset="UTF-8" />
			<title>Exercice 5</title>
			<style>
				body {font-family: "Gill Sans", sans-serif; padding: 35px;}
				.header {text-align: center;}
				.nom {background-color: #F3F781;}
				.adj {background-color: #d3e0ea;}
			</style>
		</head>
		<body>
			<h1 class="header">Affichage du texte du document DUCHN.xml en soulignant les mots des catégories NOM ou ADJ</h1> 
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
	
						<xsl:when test="(contains(categorie, 'NC') or contains(categorie, 'NP'))">
							<span class="nom"><xsl:value-of select="forme"/></span><xsl:text> </xsl:text>
						</xsl:when>
						<xsl:when test="contains(categorie, 'ADJ')">
							<span class="adj"><xsl:value-of select="forme"/></span><xsl:text> </xsl:text>
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
	
	<!-- xsltproc ex5-5.xsl duchn.xml > ex5-5.html -->
	
</xsl:stylesheet>