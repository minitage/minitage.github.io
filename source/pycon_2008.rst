=========
minitage
=========

Buildout
========

    - Mauvaise gestion des dépendances.
    - Inmaintenable quand c'est gros.
    - Mais qu'est ce que c'est bien.

Système
=======

    - Isolation du projet.
    - Gestion de conflit de versions.
    - Compilation et utilisation en prefixe.

Le stuff python
===============

    - Eggs/packages python plus ou moins bien packagés.
    - Flags de compilation spécifiques pour l'isolation.
    - Mode offline ou meme online sans reposer sur un index.


Projet
======

    - Déploiement identique et reproductible
    - Multi plateforme
    - Adaptation d'un profil applicatif à un projet.

        - base pgsql
        - base ldap
        - interpréteur python personnalisé

Minitage
========

    - Meta package manager qui repose sur d'autres systèmes de packaging

        - inspiré des systemes de ports
        - Gere

          - les dépendances
          - Les installations
          - Les dé-installations
          - les profils

Layout
======
    - Layout ou les packages doivent etre installés d'une maniere precise::

        eggs/
            lxml-666.666/
        dependencies/
            python-2.4/
        zope/
            myproject

Historique
==========

    - Faire un truc inspiré des systèmes de ports
    - Non public jusqu'a la v0.3
    - Etait tres lié a subversion et en bash.


On the road to 0.4
==================

    - Reécriture en python / eggyfication
    - Migration a mercurial
    - Ré ecriture des recettes de base
    - format des minibuilds bash -> cfg.ini
    - Implémentation des profils


Qestions/Réponses
=================

    - Allez y !

















