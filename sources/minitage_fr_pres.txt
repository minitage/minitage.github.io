Minitage, the package manager
================================


Le vocabulaire
================
- Conceptuellement inspiré des systèmes de port (xBSD, gentoo, sourcemage)
- mini(port)tage : le meta packae manager
- mini(e)merge: l'outil en ligne de commande qui controle une installation minitage


Le vocabulaire
===================
- mini(e)build: Format de packages minitage
- mini(over)lay: un conteneur de minibuilds habituellement placé dans minitage/minilays/[UN REPERTOIRE]

Le vocabulaire
===================
- Un projet est une application dont un minibuild va spécifier comment l'intégrer dans minitage
- Un profil est un scaffold de bases de données ou de wrappers qui permet de rendre le travail dans un projet minitagifié plus simple et précis.
- zc.buildout: outil de déploiment modulaire écrit par Jim Fulton, le papa de Zope


Les fondammentaux
====================
- Isolation des packages vis à vis du système hôte
- Multiplateforme (Unix) (dans la réalité, surtout testé sur linux (multiple) & MacOSX
- Reproductiblité des déploiements

Les fondammentaux (2)
=======================
- Installation en production, préproduction et développement indentique (mêmes versions, même layouts)
- Rester bas niveau
- Etre modulaire, configurable

Les fondammentaux (3)
=======================
- Avoir des mécanismes de mise à jour conservatifs

    - migration in place
    - on ne reinstalle pas un package déjà installé sauf demande explicite

Qu'est ce qu'un meta package-manager
======================================
- assemble, download, build, assemble
- minitage n'est qu'un ordonnanceur
- ce qui est réellement utilisé en dessous est zc.buildout

Most important, All is project
==================================
- project centric VS système centric
- Son but sur le système hote.

    - déployer
    - isoler
    - perenniser le cycle de vie du projet

Most important, All is project (2)
==================================
- Quand on utilise une base de données, souvent minitage propose une intégration pour poser cette base dans une sous hierarchie du projet (/sys) et des wrappers aux clients en ligne de commande préconfigurés pour s'y connecter (toto.psql)

LA TECHNIQUE
=======================

Un layout commun
===================
- isolation == layout stricte
- Tout ce qui est installé dans minitage suit un scheme strict (cf http://www.minitage.org)
- Tout package respecte la convention suivante::

    minitage_root/category/package/

Le layout pour les dépendances C (categorie: dependencies)
============================================================
- Structure commune des installations
- Réutilisabilité de chaque package grace à ce layout
- On peut nommer des packages avec leur versions pour autoriser l'usage de mulitples versions d'un package donné::

    /minitage/dependencies/python-2.6

Python  (categorie: eggs)
==========================
- Pour quelques packages un peu sioux:

    -libxml, PIL, PyQt, mapnik2

- Ne Permettre d'installer que les seules versions python necessaires pour l'application

Python  (categorie: eggs) (2)
==============================
- Historiquement python va avoir plusieurs mode de déploiements:

    - Utiliser un egg ou une source distribution
    - Utiliser un systeme de build quelquonque pour mettre des chosss dans le site-packges du python cible

- Minitage utilise un 'shared egg folder' pour tous les eggs produits par tous ses projets::

    /minitage/eggs/cache

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
  Permet de remplacer à la volée des recettes de la communauté par les équivalents minitage::

      [buildout]
      extensions =  buildout.minitagicator

Buildout (2)
=============
- Les recettes intégrent les dépendances d'un projet dans l'environnement d'éxecution de buildout.
- Les principales recipes:

    - minitage.recipe.cmmi <=  zc.recipe.cmmi
    - minitage.recipe.{scripts, egg}  zc.recipe.egg

Workflow
==========
- L'idée part du principe suivant: Planifier et programmer le déploiement, répeter X fois.
- Un expert minitage commence par:

  - Créer le projet et le minitagifier
  - Versionner ce projet
  - Créer un minibuild qui pointe vers ce projet

- Ensuite et seulement ensuite, les développeurs (utilisateurs) peuvent déployer le projet

Pitfalls
=========
- Minitage n'est pas simple, mais pas tres compliqué non plus, un expert ira plus vite à rendre déployable un projet
- Ce meme expert traitera les problemes liés à minitage
- Les développeurs (users) n'ont plus qu'à télécharger le "minilay" et installer le projet.

Quelques points mal testés / ne respestant pas les principes initiaux
======================================================================
- Mode offline: pas de use case, pas traité.

Les libraries C, et CPP et le monde de RPATH
==============================================
- Isolation de chaque librairie compilée
- LD_LIBRARY_PATH inutile ! vive -rpath
- Relocalisation == rebuildd /==/ minitage not relocalisable

Un exemple
============

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


