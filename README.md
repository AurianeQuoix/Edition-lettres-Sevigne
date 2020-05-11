# Edition-lettres-Sevigne
Edition numérique des Lettres de Madame de Sévigné, de sa famille, et de ses amis (lettres 144 à 147), encodée à partir de l'édition de 1823 consultable sur Gallica. Ce projet a été réalisé dans le cadre des cours XML-TEI et XSLT à l'Ecole nationale des chartes.

## TEI

### Consignes générales

Structurer en XML-TEI votre texte en vue d’une édition et en respectant le genre littéraire auquel appartient votre extrait (/6);    
Compléter de la manière la plus précise possible le teiHeader de votre édition, en fonction des éléments nécessaires à son établissement et à la compréhension du texte (/3);    
Écrire une ODD adaptée à votre encodage et documentée. Pour vérifier les acquis,    
- Générer une ODD à partir de Roma ou de oddbyexample (/2)
- Votre ODD doit contenir au moins :
	- Une règle contraignant l’usage d’un attribut et sa ou ses valeurs (/1);
	- Une règle contraignant l’enchaînement de certains éléments (/1);
	- Une règle contraignant la valeur d’un attribut ou l’usage d’un élément ou d’un attribut en fonction de son environnement (/1).
- À partir de votre ODD, générer la documentation HTML de votre projet.
	- Présenter en introduction votre projet et ses exploitations possibles (/4);
	- Documenter le fonctionnement de votre encodage et vos choix de balises (/2).

## XSLT

### Consignes générales

Proposer une transformation XSLT de son projet XML TEI pour créer une visualisation de son travail.
- Mettre en place une structure d’accueil LaTeX ou HTML
- Rédiger des règles simples avec un Xpath valide pour insérer des informations du document source dans le document de sortie
- Créer une ou des règles avec des conditions
- Utiliser une ou des règles avec for-each uniquement si cela est nécessaire
- Proposer un code facile à lire et commenté
- Simplifier le plus possible ses règles XSL

## Consulter le site

Après avoir téléchargé le projet, ouvrir accueil.html.
