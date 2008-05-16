=========
minitage
=========

1. Contexte
===========

    - Utilisation de zope pour deployer de gros projets zope / gis
    - Mauvaise gestion des dépendances et difficilement maintenable.
    - Mais qu'est ce que c'est bien.


2. Des besoins plus vastes
==========================

    - Isolation du projet.
    - Gestion des dépendances systemes

        - conflit de versions

    - Compilation et utilisation en prefixe.
    - Mode offline ou meme online sans reposer sur un index.


3. Minitage
===========

    - Meta package manager qui repose sur d'autres systèmes de packaging

        - inspiré des systemes de ports
        - Permet de déployer à l'identique indépendamment de la plateforme hote
        - Doit gérer

          - les dépendances
          - Les (dé-)installations

4. Layout
========
    - Layout ou les packages doivent etre installés d'une maniere precise::

        eggs/
            lxml-666.666/
        dependencies/
            python-2.4/
        zope/
            myproject

5. On the road to 0.4
=====================

    - Reécriture en python / eggyfication
    - Ré ecriture des recettes de base
    - format des minibuilds bash -> cfg.ini
    - Implémentation des profils applicatifs
      - base pgsql
      - base ldap
      - interpréteur python personnalisé


Qestions/Réponses
=================

    - Allez y !

















