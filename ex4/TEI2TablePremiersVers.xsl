<?xml version="1.0" encoding="UTF-8"?>
<!-- Élément racine xsl:stylesheet de la feuille de style-->
<!-- + déclaration de l'espace de noms XSLT associé au préfixe xsl -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    <!-- Gabarit 1 : Règle sur le pseudo-élément racine, définition de l'en-tête et du corps HTML -->
    <xsl:template match="/">
        <!-- Fragment de document XHTML retourné par la règle. -->
        <html>
            <head>
            	<style>
					table {
					  border-collapse: collapse;
					}
					th, td {
					  border: 1px solid black;
					  padding: 20px;
					}
					img {
					  width: 200px;
					  height: auto;
					  border-radius: 50%;
					}
					.recueil {
					  font-family: 'Rock Salt', cursive;
					  text-align: center;
					}
				</style>
                <title>Exercice 4, partie 1 : Funeral Blues</title>
            </head>
            <body>
                <p align="center">
                    <font size="+3">
                        <b>
                            Titre du recueil : <br />
                            <div class="recueil">
                                <xsl:value-of select="TEI.2/teiHeader/fileDesc/titleStmt/title"/>
                            </div>
                        </b>
                    </font>
                </p>
                <p align="center">
	                    <font size="+1" color="grey">
	                        Auteur : 
	                        <xsl:value-of select="TEI.2/teiHeader/fileDesc/titleStmt/author"/> 
	                        <br />
	                        <img src="wh_auden.jpg" alt="Portrait of W.H. Auden"/>
	                    </font>
                    <hr />
                </p>
                <br />
                <table align="center" border="3">
                    <tr>
                        <th>
                            <font size="+1">
                            	<b>
                                	TITRE DU POÈME
                                </b>
                            </font>
                        </th>
                        <th>
                        	<font size="+1">
                        		<b>
                            		LE PREMIER VERS DU POÈME
                            	</b>
                            </font>
                        </th>
                    </tr>
                    <tr>
                        <td>
                        	<i>
	                            <!-- Là, la règle du pseudo-élément racine fait appel aux autres règles -->
	                            <xsl:apply-templates select="TEI.2/text/group/text"/>
	                        </i>
                        </td>
                        <td>
                        	<i>
	                            <xsl:apply-templates select="TEI.2/text/group/text/body"/> 
	                            ...     
	                        </i> 
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <!-- Fin du gabarit 1 -->
    <!-- Gabarit 2 : Règle sur le noeud 'text', impression du nom du poème -->
    <xsl:template match="text">
        <!-- En réalité, on n'a pas besoin d'élémént xsl:for-each ici car on n'a qu'un seul poème -->
        <!-- Mais s'il y en avait plusieurs, il faudrait itérer comme ceci -->
        <xsl:for-each select=".">
            <xsl:value-of select="./front"/>
        </xsl:for-each>
    </xsl:template>
    <!-- Fin du gabarit 2 -->
    <!-- Gabarit 3 : Règle sur le noeud 'body', impression du premier vers -->
    <xsl:template match="body">
        <xsl:for-each select=".">
            <xsl:value-of select="./lg/l[1]"/> 
        </xsl:for-each>
    </xsl:template>
    <!-- Fin du gabarit 3 -->
</xsl:stylesheet>