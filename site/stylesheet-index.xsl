<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>

  <xsl:template match="/">
    <html>

      <head>
        <meta charset="UTF-8"/>
        <title>Document Structuré</title>

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
          <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&amp;display=swap" rel="stylesheet" />

        <!-- CSS Stylesheets -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/styles/xcode.min.css" />
        <link rel="stylesheet" href="css/styles.css" />

        <!-- Font Awesome -->
        <script defer="defer" src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

        <!-- Bootstrap Scripts -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!-- Syntax Highlight -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/highlight.min.js"></script>
        <script>
          hljs.highlightAll();
        </script>

        <!-- Favicon -->
        <link rel="icon" href="favicon.ico" />
        </head>
        <body>
          <section class="colored-section" id="title">
            <div class="container-fluid">

              <!-- Nav Bar -->
              <nav class="navbar navbar-expand-lg navbar-dark">
                <a class="navbar-brand" href="./index.xml">
                  <i class="far fa-file-code fa-1x fa-fw"></i>Document Structuré<br/>
                  <h5>Master 1 Traitement automatique des langues</h5>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                  <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                      <a class="nav-link" href="./index.xml">Accueil</a>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Exercices obligatoires
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="./exo3.xml">Exercice 3 : TEI</a>
                        <a class="dropdown-item" href="./exo5.xml">Exercice 5 : DUCHN</a>
                        <a class="dropdown-item" href="./exo14.1.xml">Exercice 14.1 : Fils RSS</a>
                        <a class="dropdown-item" href="./exo14.2.xml">Exercice 14.2 : Fils RSS</a>
                        <a class="dropdown-item" href="./exo15.xml">Exercice 15 : Rhapsodie</a>
                      </div>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Exercices optionnels
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="./exo1.xml">Exercice 1 : Eau Minérale</a>
                        <a class="dropdown-item" href="./exo2.xml">Exercice 2 : Bibliographie</a>
                        <a class="dropdown-item" href="./exo4.xml">Exercice 4 : Funeral Blues</a>
                        <a class="dropdown-item" href="./exo7.xml">Exercice 7 : Le dormeur du val</a>
                        <a class="dropdown-item" href="./exo8.xml">Exercice 8 : Corpus Prématurés00</a>
                      </div>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="./conclusion.xml">Conclusion</a>
                    </li>
                  </ul>
                  </div>
              </nav>

              <!-- Présentation -->
              <div class="presentation">
                <xsl:apply-templates select="site"/>
              </div>
              <br />
              <div class="outil-section row">
                <a href="https://www.sublimetext.com/" target="_blank" class="card-link">
                  <div class="mx-auto outil-column col-lg-4">
                    <div class="card" style="width: 18rem; height: 18rem;">
                      <div class="card-header">
                        <h3>Sublime Text</h3>
                      </div>
                      <div class="card-body">
                        <h4 class="card-subtitle mb-2 text-muted">Éditeur de texte multi-platforme avec les plug-ins</h4>
                        <center>
                          <img class="icon fa-4x fa-fw" src="images/sublime.png"></img> 
                        </center>
                        <p class="card-text">Utilisé dans tous les exercices</p>
                      </div>
                    </div>
                  </div>
                </a>

                <a href="https://www.oxygenxml.com/" target="_blank" class="card-link">
                  <div class="mx-auto outil-column col-lg-4">
                    <div class="card" style="width: 18rem; height: 18rem;">
                      <div class="card-header">
                        <h3>Oxygen XML Editor</h3>
                      </div>
                      <div class="card-body">
                        <h4 class="card-subtitle mb-2 text-muted">Environnement de développement XML</h4>
      
                        <center>
                          <img class="icon fa-4x fa-fw" src="images/oxygen.png"></img> 
                        </center>
                        <p class="card-text">Utilisé dans tous les exercices</p>
                      </div>
                    </div>
                  </div>
                </a>

                <a href="https://basex.org/" target="_blank" class="card-link">
                  <div class="mx-auto outil-column col-lg-4">
                    <div class="card" style="width: 18rem; height: 18rem;">
                      <div class="card-header">
                        <h3>BaseX</h3>
                      </div>
                      <div class="card-body">
                        <h4 class="card-subtitle mb-2 text-muted">Système de gestion de base de données XML</h4>
                        <center>
                          <img class="icon fa-4x fa-fw" src="images/basex.svg"></img> 
                        </center>
                        <br />
                        <p class="card-text">Utilisé dans les exercices 14, 15</p>
                      </div>
                    </div>
                  </div>
                </a>
              </div>  
            </div>
          </section>

        </body>
        <!-- Footer -->
        <footer class="colored-section" id="footer">
          <div class="container-fluid">
            <a class="text-dark" href="https://www.linkedin.com/in/alexandra-ponomareva-22228710b/" target="_blank">
              <i class="social-icon fab fa-linkedin"></i>
            </a>
            <a class="text-dark" href="mailto:alex.ponomaryova@gmail.com" target="_blank">
              <i class="social-icon fas fa-envelope"></i>
            </a>
            <p>© 2021 Alexandra Ponomareva
            </p>
          </div>
        </footer>
    </html>
  </xsl:template>

  <xsl:template match="site/page">
    <h2 class="big-heading">
      <xsl:value-of select="./title"/>
    </h2>
    <xsl:for-each select="./content">
      <div class="p">
        <xsl:for-each select="./paragraph">
          <p>
            <xsl:value-of select="./text"/>
          </p>
          <!-- List of obligatory exercices -->
          <ul>
            <xsl:for-each select="./list/element">
              <li>
                <a class="presentation-link" target="_blank">

                  <xsl:attribute name="href">
                    <xsl:value-of select="./@link"/>
                  </xsl:attribute>
                  <b>
                    <xsl:value-of select="."/>
                  </b>
                </a>
                :
                <xsl:value-of select="./@title"/>
              </li>
            </xsl:for-each>
          </ul> 
        </xsl:for-each>
      </div>
    </xsl:for-each>
  </xsl:template>

  </xsl:stylesheet>
