<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <!-- "exclude-result-prefixes="xs tei"" permet d'exclure le préfixe tei des résultats lors de la sortie HTML -->

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <!-- "<xsl:strip-space elements="*"/>" permet de ne pas obtenir d'espaces non souhaités -->

    <!-- CONFIGURATION DES SORTIES -->
    <xsl:template match="/">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), 'EncodageSevigne_Auriane_Quoix.xml', '')"/>
            <!-- récupération du nom et du chemin du fichier courant -->
        </xsl:variable>

        <xsl:variable name="pathAccueil">
            <xsl:value-of select="concat($witfile, 'accueil', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathPresentationEdition">
            <xsl:value-of
                select="concat($witfile, 'autres_pages_HTML/presentation_edition', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathLettres">
            <xsl:value-of select="concat($witfile, 'autres_pages_HTML/lettres', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathApropos">
            <xsl:value-of select="concat($witfile, 'autres_pages_HTML/a_propos', '.html')"/>
        </xsl:variable>

        <!-- SORTIES INDEX -->
        <xsl:variable name="pathIndexPersonnes">
            <xsl:value-of select="concat($witfile, 'autres_pages_HTML/indexPersonnes', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathIndexLieux">
            <xsl:value-of select="concat($witfile, 'autres_pages_HTML/indexLieux', '.html')"/>
        </xsl:variable>

        <!-- VARIABLES APPELEES DANS CHAQUE PAGE -->
        <!-- Caractéristiques du head -->
        <xsl:variable name="head1">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"/>
                <title>
                    <xsl:value-of select="//fileDesc/titleStmt/title[@type = 'main']"/>
                </title>
            </head>
        </xsl:variable>
        <!-- Définition des caractéristiques de la barre de navigation -->
        <xsl:variable name="navbar">
            <nav class="navbar navbar-expand-md navbar-dark bg-dark justify-content-between"
                style="font-family:Times New Roman;font-size:14pt">
                <a class="navbar-brand" href="{$pathAccueil}">Accueil</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"/>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="{$pathPresentationEdition}">Édition
                                d'origine</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{$pathLettres}">Lettres</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                >Index</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="{$pathIndexPersonnes}">Personnes</a>
                                <a class="dropdown-item" href="{$pathIndexLieux}">Lieux</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{$pathApropos}">À propos</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </xsl:variable>
        <!-- Caractéristiques du footer -->
        <xsl:variable name="footer1">
            <!-- footer page d'accueil -->
            <footer class="blog-footer">
                <div class="container" style="padding:1em;text-align:right">
                    <p style="font-size:11pt;font-family:Times New Roman"><a
                            href="https://www.chartes.psl.eu"><img alt="chartes"
                                src="./images/chartes.png" style="width:100px;height:auto"/></a>
                        <br/>© Auriane Quoix</p>
                </div>
            </footer>
        </xsl:variable>
        <xsl:variable name="footer2">
            <!-- footer autres pages (sauf à propos et accueil) -->
            <footer class="blog-footer">
                <div class="container" style="padding:1em;text-align:right">
                    <p style="font-size:11pt;font-family:Times New Roman"><a
                            href="https://www.chartes.psl.eu"><img alt="chartes"
                                src="../images/chartes.png" style="width:100px;height:auto"/></a>
                        <br/>© Auriane Quoix</p>
                </div>
            </footer>
        </xsl:variable>
        <xsl:variable name="footer3">
            <!-- footer page à propos (l'affichage était incorrect sur cette page) -->
            <footer class="blog-footer">
                <div class="container" style="position:absolute;bottom:0;padding:1em;text-align:right">
                    <p style="font-size:11pt;font-family:Times New Roman"><a
                        href="https://www.chartes.psl.eu"><img alt="chartes"
                            src="../images/chartes.png" style="width:100px;height:auto"/></a>
                        <br/>© Auriane Quoix</p>
                </div>
            </footer>
        </xsl:variable>

        <!-- PAGE D'ACCUEIL -->
        <xsl:result-document href="{$pathAccueil}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head1"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div>
                        <div class="offset-md-2 col-md-8" style="margin-top:50px">
                            <h1
                                style="text-align:center;font-size:21pt;font-family:Times New Roman;font-weight:bold"
                                >Édition numérique des <span style="font-style:italic"><xsl:value-of
                                        select="//fileDesc/titleStmt/title[@type = 'main']"
                                /></span></h1>
                        </div>
                        <div class="blocks">
                            <center>
                                <img alt="lettres" src="images/lettres.JPEG"
                                    style="width:700px;margin-top:30px;align:center"/>
                            </center>
                        </div>
                        <div class="offset-md-2 col-md-8"
                            style="margin-top:40px;text-align:center;font-family:Times New Roman;font-size:15pt">
                            <p>Bienvenue sur le site de l'édition numérique des <span
                                    style="font-style:italic"><xsl:value-of
                                        select="//fileDesc/titleStmt/title[@type = 'main']"
                                /></span>. L'ouvrage à partir duquel a été réalisé cet encodage est
                                consultable à la <xsl:value-of
                                    select="//fileDesc/publicationStmt[1]/distributor"/> et
                                disponible sur <a
                                    href="https://gallica.bnf.fr/ark:/12148/bpt6k6317685j"
                                    style="color:#747f81">Gallica</a>.</p>
                            <p>Seules les lettres 144 à 147 - écrites entre le 9 avril 1671 et le 12
                                avril 1671 - du volume II ont été encodées pour ce projet.<br/>Bonne
                                visite !</p>
                        </div>
                    </div>

                    <!-- utilitaires Bootstrap -->
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
                </body>
                <xsl:copy-of select="$footer1"/>
            </html>
        </xsl:result-document>

        <!-- PAGE DE PRESENTATION DE L'EDITION D'ORIGINE -->
        <!-- Réalisé à partir des informations du Tei-Header. Choix réalisé parmi les données à disposition. -->
        <xsl:result-document href="{$pathPresentationEdition}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head1"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <div class="row" style="margin:50px">
                            <div class="offset-md-2 col-md-8">
                                <h1
                                    style="text-align:center;font-size:21pt;font-family:Times New Roman;font-weight:bold"
                                    >Présentation de l'édition d'origine</h1>
                                <hr class="my-4" style="width:30%"/>
                            </div>
                        </div>
                        <div class="row" style="margin:20px">
                            <div class="col-sm-7">
                                <h2
                                    style="font-size:18pt;font-family:Times New Roman;font-weight:bold"
                                    >Informations générales</h2>
                                <ul style="font-family:Times New Roman;font-size:14pt">
                                    <li style="line-height:3"><span style="font-weight:bold"
                                            >Titre</span> : <xsl:value-of
                                            select="//fileDesc/titleStmt/title[@type = 'main']"
                                        /></li>
                                    <li style="text-align:justify"><span style="font-weight:bold"
                                            >Sous-titre</span> : <xsl:value-of
                                            select="//fileDesc/titleStmt/title[@type = 'subtitle']"
                                        /></li>
                                    <li style="line-height:3"><span style="font-weight:bold"
                                            >Auteur</span> : <xsl:value-of
                                            select="//fileDesc/titleStmt/author"/></li>
                                    <li><span style="font-weight:bold">Éditeur</span> :
                                            <xsl:value-of
                                            select="concat(//fileDesc/publicationStmt/publisher, ' (', //fileDesc/publicationStmt/pubPlace, ')')"
                                        /></li>
                                    <li style="line-height:3"><span style="font-weight:bold">Date de
                                            publication</span> : <xsl:value-of
                                            select="//fileDesc/publicationStmt/date"/>
                                    </li>
                                    <li><span style="font-weight:bold">Contributeurs</span> :
                                            <xsl:value-of
                                            select="concat(//fileDesc/titleStmt/editor[1], ' (éditeur scientifique), ', //fileDesc/titleStmt/editor[@role = 'contributor'], ' (auteur de lettres)')"
                                        /></li>
                                    <li style="line-height:3"><span style="font-weight:bold"
                                            >Note</span> : <xsl:value-of select="//notesStmt"/></li>
                                    <li><span style="font-weight:bold">Informations complémentaire
                                            (contenu de cette édition numérique)</span> :
                                            <xsl:value-of
                                            select="concat(//biblScope[@unit = 'letters'], ' (', //biblScope[@unit = 'volume'], ', ', //biblScope[@unit = 'page'], ')')"
                                        />
                                    </li>
                                </ul>
                            </div>
                            <div class="col-sm-5" style="text-align:right;margin-top:55px">
                                <a
                                    href="https://gallica.bnf.fr/ark:/12148/btv1b10507205f/f155.image">
                                    <img alt="sevigne" src="../images/sevigne.jpg"
                                        style="width:350px; height:auto"/>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- utilitaires Bootstrap -->
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
                </body>
                <xsl:copy-of select="$footer2"/>
            </html>
        </xsl:result-document>

        <!-- PAGE A PROPOS -->
        <xsl:result-document href="{$pathApropos}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head1"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="offset-md-2 col-md-8"
                        style="text-align:center;margin-top:50px;height:50px">
                        <h1 style="font-size:21pt;font-family:Times New Roman;font-weight:bold">À
                            propos</h1>
                    </div>
                    <div class="offset-md-2 col-md-8"
                        style="text-align:center;height:50px;font-family:Times New Roman">
                        <p class="lead container">Ce projet a été réalisé par Auriane Quoix, dans le
                            cadre de l'évaluation XSLT du Master 2 Technologies numériques
                            appliquées à l'histoire, à l'École nationale des chartes.<br/>Il fait
                            suite à un premier projet d'encodage d'un extrait de la correspondance
                            de madame de Sévigné, réalisé dans le cadre du cours d'XML-TEI.
                            L'encodage XML-TEI, le fichier XSL ainsi que le code HTML de sortie sont
                            disponibles sur <a
                                href="https://github.com/AurianeQuoix/Edition-lettres-Sevigne"
                                style="color:#747f81">GitHub</a>.</p>
                    </div>
                    
                    <!-- utilitaires Bootstrap -->
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
                </body>
                <xsl:copy-of select="$footer3"/>
            </html>
        </xsl:result-document>

        <!-- PAGE D'INDEX DES NOMS DE PERSONNES -->
        <xsl:result-document href="{$pathIndexPersonnes}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head1"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <div class="row" style="margin:50px">
                            <div class="offset-md-2 col-md-8">
                                <h1
                                    style="text-align:center;font-size:21pt;font-family:Times New Roman;font-weight:bold"
                                    >Index des personnes citées dans les lettres</h1>
                                <hr class="my-4" style="width:30%"/>
                            </div>
                        </div>
                        <div class="row" style="margin:20px">
                            <div class="col-sm-7" style="font-family:Times New Roman;font-size:14pt">
                                <br/>
                                <xsl:call-template name="nomsdePersonnes"/>
                            </div>
                        </div>
                    </div>

                    <!-- utilitaires Bootstrap -->
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
                </body>
                <xsl:copy-of select="$footer2"/>
            </html>
        </xsl:result-document>

        <!-- PAGE D'INDEX DES NOMS DE LIEUX -->
        <xsl:result-document href="{$pathIndexLieux}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head1"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <div class="row" style="margin:50px">
                            <div class="offset-md-2 col-md-8">
                                <h1
                                    style="text-align:center;font-size:21pt;font-family:Times New Roman;font-weight:bold"
                                    >Index des lieux cités dans les lettres</h1>
                                <hr class="my-4" style="width:30%"/>
                            </div>
                        </div>
                        <div class="row" style="margin:20px">
                            <div class="col-sm-7" style="font-family:Times New Roman;font-size:14pt">
                                <br/>
                                <xsl:call-template name="nomsdeLieux"/>
                            </div>
                        </div>
                    </div>

                    <!-- utilitaires Bootstrap -->
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
                </body>
                <xsl:copy-of select="$footer2"/>
            </html>
        </xsl:result-document>

        <!-- PAGE DE PRESENTATION DES LETTRES -->
        <xsl:result-document href="{$pathLettres}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head1"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <!-- Etant donné que la présente édition comporte un nombre conséquent de lettres, il paraissait peu ergonomique d'un point de vue de la navigation
                        de réaliser une page par lettre. Regrouper les lettres par mois n'était pas non plus judicieux, étant donné que rien que pour le mois d'avril 1671,
                        l'édition papier comporte plus d'une cenquantaine de pages. La solution envisagée a été de regrouper les lettres par semaine, ce qui permet
                        également de suivre de manière précise la chronologie des événements décrits dans les lettres. Il serait alors possible de tenir compte ou non du découpage
                        général de l'édition papier ou bien simplement préciser le numéro de volume dans lequel se trouvent les lettres.
                        Dans le cas présent, les lettres encodées ont été écrite sur une même semaine. -->               
                    <div class="container">
                        <div class="row" style="margin:50px">
                            <div class="offset-md-2 col-md-8">
                                <h1
                                    style="text-align:center;font-size:21pt;font-family:Times New Roman;font-weight:bold;line-height:2"
                                    >Lettres n°144 à 147</h1>
                                <h2
                                    style="text-align:center;font-size:15pt;font-family:Times New Roman;font-weight:bold"
                                    >Jeudi 9 avril 1671 - dimanche 12 avril 1671</h2>
                                <hr class="my-4" style="width:10%"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="offset-md-2 col-md-8">
                                <xsl:for-each select="//div[@type = 'letter']">
                                    <h3
                                        style="text-align:center;font-size:15pt;font-family:Times New Roman;font-weight:bold">
                                        <xsl:value-of select="head"/>
                                    </h3>
                                    <br/>

                                    <h4
                                        style="text-align:right;font-size:14pt;font-family:Times New Roman;font-weight:bold">
                                        <xsl:value-of select="opener"/>
                                    </h4>
                                    <p
                                        style="text-indent:70px;text-align:justify;font-family:Times New Roman;font-size:14pt">
                                        <xsl:for-each select="p">
                                            <xsl:apply-templates/>
                                        </xsl:for-each>
                                        <xsl:value-of select="closer"/>
                                    </p>
                                    <br/>
                                </xsl:for-each>
                                <div
                                    style="text-align:justify;font-family:Times New Roman;font-size:11pt">
                                    <xsl:call-template name="notes"/>
                                </div>
                            </div>
                        </div>
                    </div>             
                    <!-- utilitaires Bootstrap -->
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
                </body>
                <xsl:copy-of select="$footer2"/>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- REGLES GENERALES TEXTE -->
    <!-- Pour que le texte annoncé en italique dans l'encodage apparaisse bien comme tel dans le document de sortie -->
    <xsl:template match="hi[@rend = 'italic']">
        <span style="font-style:italic">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="emph[@rend = 'italic']">
        <span style="font-style:italic">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- Pour que les retours à la ligne indiqués par un <lb/> soient effectifs dans le document de sortie -->
    <xsl:template match="lb">
        <br>
            <xsl:apply-templates/>
        </br>
    </xsl:template>

    <!-- REGLES NOTES DE BAS DE PAGE -->
    <!-- Mise en place du renvoi au sein du texte -->
    <xsl:template match="//body//note" mode="#all">
        <xsl:element name="sup">
            <xsl:attribute name="style">
                <xsl:text>font-size:9pt</xsl:text>
            </xsl:attribute>
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="./@n"/>
                </xsl:attribute>
                <xsl:attribute name="style">
                    <xsl:text>color:#000000;font-weight:bold</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="./@n"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <!-- Mise en place de la note de bas de page -->
    <xsl:template name="notes">
        <xsl:for-each select="//body//note">
            <xsl:element name="p">
                <xsl:attribute name="id">
                    <xsl:value-of select="./@n"/>
                </xsl:attribute>
                <xsl:value-of select="./@n"/>
                <xsl:text>. </xsl:text>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <!-- REGLES INDEX -->
    <!-- Template de l'index des noms de personnes -->
    <xsl:template name="nomsdePersonnes">
        <xsl:element name="div">
            <xsl:for-each select="//listPerson/person/persName[1]">
                <xsl:sort select="surname" order="ascending"/>
                <xsl:element name="ul">
                    <xsl:element name="li">
                        <xsl:element name="b">
                            <xsl:value-of select="concat(forename, ' ', nameLink, surname, ' ')"/>
                            <xsl:choose>
                                <xsl:when test="roleName">
                                    <xsl:text>(</xsl:text>
                                    <xsl:value-of select="roleName"/>
                                    <xsl:text>) : </xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>: </xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:element>
                        <!-- Permet d'obtenir les appellations des personnages au sein des lettres et le numéro de la lettre dans laquelle ils apparaissent -->
                        <xsl:variable name="idPerson">
                            <xsl:value-of select="parent::person/@xml:id"/>
                        </xsl:variable>
                        <xsl:for-each
                            select="ancestor::TEI//body//persName[replace(@ref, '#', '') = $idPerson]">
                            <xsl:value-of
                                select="
                                    text() |
                                    .//body//div[@type = 'letter']//text()"/>
                            <xsl:text> (lettre </xsl:text>
                            <xsl:value-of select="ancestor::div[@type = 'letter']/@n"/>
                            <xsl:text>)</xsl:text>
                            <xsl:if test="position() != last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each>
                        
                        <xsl:if test="addName">
                            <br/>
                            <u>
                                <xsl:text>Autre nom :</xsl:text>
                            </u>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="addName"/>
                        </xsl:if>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <!-- Template de l'index des noms de lieux -->
    <xsl:template name="nomsdeLieux">
        <xsl:element name="div">
            <xsl:for-each select="//listPlace//placeName">
                <!-- classé par ordre alphabétique -->
                <xsl:sort select="name" order="ascending"/>
                <xsl:element name="ul">
                    <xsl:element name="li">
                        <xsl:element name="b">
                            <xsl:value-of select="name"/>
                            <xsl:if test="region[@n = 'a']">
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="region"/>
                            </xsl:if>
                            <xsl:if test="country">
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="country"/>
                            </xsl:if>
                            <xsl:text> : </xsl:text>
                        </xsl:element>                        
                        <!-- Permet d'obtenir les appellations des lieux au sein des lettres et le numéro de la lettre dans laquelle ils apparaissent -->
                        <xsl:variable name="idPlace">
                            <xsl:value-of select="parent::place/@xml:id"/>
                        </xsl:variable>
                        
                        <xsl:for-each
                            select="ancestor::TEI//body//placeName[replace(@ref, '#', '') = $idPlace]">
                            <xsl:value-of
                                select="
                                    text() |
                                    .//body//div[@type = 'letter']//text()"/>
                            <xsl:text> (lettre </xsl:text>
                            <xsl:value-of select="ancestor::div[@type = 'letter']/@n"/>
                            <xsl:text>)</xsl:text>
                            <xsl:if test="position() != last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
