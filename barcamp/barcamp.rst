==========
minitage
==========

0. Public
=============
    - Developpeurs
    - Administrateurs


1. Qu' est ce que le déploiement ?
==================================
    - C'est subjectif

        - Automatiser les installations
        - Perenniser l'environnment applicatif d'un projet
        - Garantir les mises à jour

2. Contexte
============
    - Utilisation de buildout pour déployer de gros projets zope / gis
    - Mauvaise gestion des dépendances et difficilement maintenable
    - Mais qu'est ce que c'est bien


3. Minitage
============
    - Meta package manager qui repose sur d'autres systèmes de paquets

        - Inspiré des systemes de ports
        - Permet de déployer à l'identique indépendamment de la plateforme hôte
        - Doit gérer

          - les dépendances
          - Les (dé-)installations et les mises à jour
          - Les profils applicatifs

4. Des besoins plus vastes
===========================
    - Isolation du projet vis à vis du système.
    - Gestion des dépendances système

        - Conflit de versions
        - Patch de sécurité
        - On aime être bleeding edge et utiliser Debian

    - Compilation et utilisation en préfixe
    - Pour python, mode offline ou meme online mais sans reposer sur un index

5. Mais à quoi ca sert donc?
==============================
    - Actuellement à Makina Corpus, on utilise minitage sur ces technos:

        - zope

            - plone 2.5
            - plone 3.1

        - Django
        - Bientôt peut être: OpenERP et Turbogears



6. On the road to 0.4
======================
    - Reécriture en python / eggyfication
    - Format des minibuilds bash -> cfg.ini
    - Implémentation des profils applicatifs
    - Release à moitié faite, sûrement pour la fin du mois

7. Roadmap
============
    - Prochaines fonctionnalités prévues

        - Support de paquets précompilés
        - Port éventuel sous windows
        - Packages

            - MySQL

Qestions/Réponses
=================

    - Allez y !
    - /me a besoin de gens
    - http://trac.minitage.org
    - #minitage@irc.freenode.org

Off. 1: Layout
===============
    - Layout ou les packages doivent etre installés d'une manière précise

::

        bin/
        etc/
        logs/
        minilays/eggs/
        eggs/
            cache/
            lxml-666.666/site-packages-2.4
        dependencies/python-2.4/parts/part
        zope/myproject/buildout.cfg


Off 2: Utilisation
=====================
::

    debootstrap --arch i386 potatoe /path  <=> easy_install virtualenv\
                                                    && virtualenv --no-site-packages /path \
                                                    && source /path/bin/activate \
                                                    && easy_install minitage.core
    apt-get update         <=<     minimerge  -s
    apt-get install foo    <=>     minimerge  foo
    apt-get dist-upgrade   <=>     minimerge -uU monGrosPaquetQuiAPleinDeDependances


Off 3: Packaging
=================
    -   minitage permet à travers de l'outil paster de générer des templates

        - zope3
        - plone31
        - plon25
        - dépendance systeme
        - django
        - egg
        - distutils

Off 4: Profils applicatifs
===========================
    - Implémentation des profils applicatifs

        - base PostgreSQL
        - interpréteur python personnalisé
        - fichiers d'environnment

    - A venir

        - base OpenLDAP
        - base MySQL

Off 5: Inconvénients
=====================
    - Le design étant volontairement sommaire :

        - Pas de cache des choses installées

            - Les mises à jour se font par paquet
            - Il faut savoir un minimum les impacts d'une mise à jour

.. vim:set ft=doctest


