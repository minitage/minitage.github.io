Minitage, le meta gestionnaire de paquets
==========================================


Le vocabulaire
================
- mini(port)tage : le meta gestionnaire de paquets
- mini(e)merge: l'outil en ligne de commande qui controle une installation minitage

Le vocabulaire
===================
- mini(e)build: Format de paquets minitage
- mini(over)lay: un conteneur de minibuilds habituellement placé dans minitage/minilays/[UN REPERTOIRE]

Le vocabulaire
===================
- Un projet est une application dont un minibuild va spécifier comment l'intégrer dans minitage
- Un profil est un scaffold de bases de données ou de wrappers qui permet de rendre le travail dans un projet minitagifié plus simple et précis.
- zc.buildout: outil de déploiment modulaire écrit par Jim Fulton, le papa de Zope

Les fondammentaux
====================
- Conceptuellement inspiré des systèmes de port (xBSD, gentoo, sourcemage)
- Isolation des packages vis à vis du système hôte
- Multiplateforme (Unix) (dans la réalité, surtout testé sur linux (multiple) & MacOSX
- Reproductiblité des déploiements

Les fondammentaux (2)
=======================
- Installation en production, préproduction et développement IDENTIQUE (mêmes versions, même layouts)
- Rester bas niveau
- Etre modulaire, configurable

Les fondammentaux (3)
=======================
- Avoir des mécanismes de mise à jour conservatifs

    - migration in place
    - on ne reinstalle pas un package déjà installé sauf demande explicite


Les fondammentaux (4)
=======================
- Les packages restent atomiques, ce qui n'est pas un projet n'installe qu'une chose

  eg: postgresql-8,4 et postgis-1.5 sont deux packages différents, ils ne sont pas regroupés


Qu'est ce qu'un meta package-manager
======================================
- minitage n'est qu'un ordonnanceur

    - Assembler les dépendances puis les télécharger et les construire

- ce qui est réellement utilisé en dessous est zc.buildout

Most important, All is project
==================================
- project centric VS système centric
- Son but sur le système hote.

    - déployer
    - isoler
    - pérenniser le cycle de vie du projet

Most important, All is project (2)
==================================
- Intégration d'outils populaires dans une sous hierarchie du projet (/sys)
  pour simplifier l'usage des dépendances confinées dans leur layout

  - On installe une base de données PostgreSQL avec des wrappers comme 'toto.psql'
  - 'toto.psql' est préconfiguré pour se connecter à cette base de données


minitage, dur à appréhender en tant que développeur?
======================================================
- minitage en tant que développeur est simple dans les concepts, les prerequis le sont moins.

    - il faut avoir quelques notions de packaging (inter dépendances)
    - il faut avoir quelques notions de compilation, les flaggs de compil, les outils de compilation (autotools, scons, cmake)

minitage, dur à appréhender en tant qu'utilisateur ?
====================================================

LA TECHNIQUE
=======================

Un layout commun
===================
- isolation == layout stricte
- Tout ce qui est installé dans minitage suit un scheme strict (cf http://www.minitage.org)
- Tout package respecte la convention suivante::

    /minitage_root/category/package/

Le layout pour les dépendances C (categorie: dependencies)
============================================================
- Structure commune des installations:

    minitage_root/category/package/parts/part

- Réutilisabilité de chaque package grace à ce layout
- On peut nommer des packages avec leur versions pour autoriser l'usage de mulitples versions d'un package donné::

    /minitage/dependencies/python-2.6

Le layout pour les dépendances C (categorie: dependencies)
============================================================
- Minitage utilise -rpath pour hardcoder les chemins de librairies dynamiques.
  Le but est de s'affranchir de LD_LIBRARY_PATH à l'éxecution
- grace à la recette minitage.recipe.cmmi, les flags de compilations sont mis automatiquement dans l'environnement


Layout python  (categorie: eggs)
====================================
- Historiquement python va avoir plusieurs mode de déploiements:

    - Utiliser un egg ou une source distribution, c'est le mode préféré de minitage
    - Utiliser un systeme de build quelquonque pour mettre des chosss dans le site-packges du python cible

- Minitage utilise un 'shared egg folder' pour tous les eggs produits par tous ses projets::

    /minitage/eggs/cache

Layout python (categorie: eggs) (2)
====================================
- Pour quelques packages un peu sioux, on installe dans un repertoire spécifique

    - libxml2, PIL, PyQt, mapnik2::

        minitage/eggs/py-libxml2-2.6/parts/site-packages-pyver

- Ne Permettre d'installer que les seules versions python necessaires pour l'application.
- Dans les buildouts de projets, on utilise ``eggs-directory`` pour indiquer le shared cache de minitage.


Python  (categorie: eggs) (3)
================================
- Pour les projets utilisant directement le site-packages, minitage les installe dans un sous repertoire::

    /minitage/eggs/package/parts/site-packages-pyver

- ou si le projet inclut aussi des binaires, etc ::

    /minitage/eggs/package/parts/

                 site-packages-pyver/site-packages-pyver

Buildout
===========
- minitage est une surcouche à zc.buildout.
- Une extension buildout : buildout.minitagificator
  Permet:

    - de remplacer à la volée des recettes de la communauté par les équivalents minitage
    - De mettre si néccesaire les flags de compilation et le path à jour pour l'environnement global de buildou::

      [buildout]
      extensions = buildout.minitagicator

Buildout (2)
=============
- Les recettes intégrent les dépendances d'un projet dans l'environnement d'éxecution de buildout.

  - CFLAGS, LDFLAGS, RPATH, CPPFLAGS, PATH, LD_LIBRARY_PATH, PYTHONPATH pour package sioux
  - minitage.recipe.cmmi <=  zc.recipe.cmmi: compilation de dépendances C
  - minitage.recipe.{scripts, egg} <= zc.recipe.egg: installation d'eggs & de distributions python

Workflow
==========
- Planifier et programmer un déploiement, le répeter X fois.
- Minitagifier, c'est assez dur, déployer c'est facile.


Workflow (2)
=============
- Un expert minitage va donc commencer par:

  - Créer le projet et le minitagifier
  - Versionner ce projet
  - Créer un minibuild qui pointe vers ce projet

- Ensuite et seulement ensuite, les développeurs (utilisateurs) peuvent déployer le projet

Petites cachotteries
========================
- Minitage n'est pas simple, mais pas tres compliqué non plus, un expert ira plus vite à rendre déployable un projet
- Ce meme expert traitera les problemes liés à minitage
- Les développeurs (users) n'ont plus qu'à télécharger le "minilay" et installer le projet.


Quelques points mal testés / ne respestant pas les principes initiaux
======================================================================
- Mode offline: pas de use case, pas traité mais l'infrastructure pour le permettre est en place.
  Pas difficile à mettre en oeuvre mais avis à contributions.

Les libraries C, et CPP et le monde de RPATH
==============================================
- Isolation de chaque librairie compilée
- LD_LIBRARY_PATH inutile ! vive -rpath
- Relocalisation == rebuildd /==/ minitage not relocalisable


Les minilays
================
- Un simple repertoire
- Qui contient des "minibuilds"
- généralement dans "minitage/minilays"

Les minibuild
==================
- Permettent de décrire un package

    - Dépendances
    - Url de téléchargement du package
    - Méthode d'installation

Les minibuilds, un exemple
===============================
::

    dependencies=py-libxml2-2.7 py-libxslt-1.1 libxml2-2.7 libxslt-1.1 pil-1.1.7 libiconv-1.12 python-2.6
    install_method=buildout
    src_uri=ssh://git.makina-corpus.net/var/git/plone/project.git
    src_type=git
    category=zope
    homepage=http://www.makina-corpus.com/
    description= a plone 4.1.3 buildout
    buildout_config=minitage-develop.cfg (optionel)

minitage dance
===============
::

    mkdir -p ~/.buildout/downloads
    cat << EOF > ~/.buildout/default.cfg
    [buildout]
    download-directory = $HOME/.buildout/downloads
    download-cache = $HOME/.buildout/downloads
    EOF

minitage dance (2)
===================
::

    sudo apt-get install build-essential m4 libtool pkg-config autoconf gettext bzip2 groff man-db automake libsigc++-2.0-dev tcl8.5
    export prefix=$HOME/minitage
    export python=$prefix/tools/python


minitage dance (3)
===================
Un python rien que pour minitage
::

    wget --no-check-certificate https://github.com/minitage/minitage.shell/raw/master/PyBootstrapper.sh
    bash ./PyBootstrapper.sh $python


minitage dance (4)
===================
Isolation par virtualenv & installation de minitage & téléchargement des paquets "core"
::

    $python/bin/virtualenv --no-site-packages --distribute $prefix
    source $prefix/bin/activate
    easy_install -U minitage.core
    minimerge -s

minitage dance (6)
===================
On pose le minilay, puis on installe le projet
::

    cd minitage/minilays
    WGET/git http://minilayurl
    minimerge -av projet

