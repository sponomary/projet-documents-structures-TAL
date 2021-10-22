<?xml version="1.0" encoding="UTF-8"?>
<!-- Élément racine xsl:stylesheet de la feuille de style-->
<!-- + déclaration de l'espace de noms XSLT associé au préfixe xsl -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    <!-- Gabarit 1 : Règle sur le pseudo-élément racine, définition de l'en-tête et du corps HTML -->
    <xsl:template match="/">
        <html>
            <!-- En-tête et corps HTML -->
            <head>
                <!-- Style -->
            	<style>
					th, td {
     				    border: none;
     				    padding: 20px;
					}
					img {
       					width: 200px;
       					height: auto;
       					border-radius: 50%;
       					}
       				center {
       				    text-align: center;
       				    font-weight: bold;
					   }
					.recueil {
						font-family: 'Rock Salt', cursive;
						text-align: center;
					}
				</style>
                <title>Exercice 4, partie 2 : Funeral Blues</title>
            </head>
            <body>
                <p align="center">
                    <font size="+3">
                        <center>
                            Titre du recueil : <br />
                            <div class="recueil">
                                <xsl:value-of select="TEI.2/teiHeader/fileDesc/titleStmt/title"/>
                            </div>
                        </center>
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
                <table align="center">
                    <tr align="center">
                        <font size="+1">
                            <center>
                                <xsl:apply-templates select="TEI.2/text/group/text/front/head"/>
                            </center>
                        </font>
                    </tr>
                    <tr>
                        <td>
                            <xsl:apply-templates select="TEI.2/text/group/text"/>                        
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <!-- Gabarit 2 : Règle sur le noeud 'text', énumérateur et compteur de lignes -->
    <xsl:template match="text">
        <xsl:for-each select="body/lg/l">
            <p>
                <!-- Fonction position() pour accéder au numéro de vers -->
                <xsl:value-of select="position()"/>
                <xsl:text>. </xsl:text>
                <xsl:value-of select="."/>
            </p>
        </xsl:for-each>
        <br />
        <p>
            <b>
                <xsl:text>Le poème contient </xsl:text>
                <!-- Fonction count() pour decompter le nombre de vers -->
                    <xsl:value-of select="count(//l)"/>
                <xsl:text> vers en total.</xsl:text>
            </b>
        </p>
    </xsl:template>
</xsl:stylesheet>