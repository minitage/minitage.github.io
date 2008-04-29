=============
django Projects
=============

Purpose
=======

Creating a django project using buildout and minitage
The minitage category is ``"zope"``.

Conventions
===========

 * Allways name versionned products (packagename-version)
 * category is django

Template
========

There is a `template project`_ online that can be used as bases for your
project.

.. _`template project`: https://hg.minitage.org/minitage/samples/django (mercurial)


Django
======
* django is a dependency of your project. Even if it is the main one.
   So, you must not package it along with your project stuff.
 * Django work out of the box after a checkout, so the buildout will be very simple. We just need a recipe that knows how to checkout.
 * Problem is that django applications are often tied to a particular branche and a particular revision.
   So, we will package for each project 2 kind of eggs:
   * one suffixed in -svn pointing to the current unstable svn version supported
   * many eggs suffixed in -rREV pointing to the corresponding revision
 * We will use shell helpers to assemble the python path needed by our application.

Packaging Django
================
Packaging the -r7283 (http://hg.minitage.org/hg/minitage/buildouts/ultimate-eggs/geodjango-r7283/)
        Exemple:
        .. sourcecode:: ini
                [project]
                eggs-directory=${buildout:directory}/../../eggs/cache
                develop-eggs-directory=${buildout:directory}/../../eggs/develop-cache
                directory=${buildout:directory}/../../
                dependencies=${buildout:directory}/../../dependencies
                sys=${buildout:directory}/../../sys
                parts =
                    site-packages-2.5
                [buildout]
                python = python2.4
                versions = versions
                executable = python2.4
                parts = ${project:parts}
                #install-from-cache=true
                extra-paths=
                find-links =
                    http://effbot.org/downloads
                eggs =
                develop =
                hooks-directory = ${buildout:directory}/hooks
                eggs-directory = ${project:eggs-directory}
                develop-eggs-directory = ${project:develop-eggs-directory}
                parts-directory=${buildout:directory}
                # Set our 2.4 python
                [python2.4]
                executable=${project:dependencies}/python-2.4/part/bin/python
                name=python2.4
                [python2.5]
                executable=${project:dependencies}/python-2.5/part/bin/python
                name=python2.5
                [versions]
                iwm.recipe.svncheckout = 0.0.1
                setuptools = 0.6c8
                plone.recipe.bundlecheckout = 1.1

                [python-2.4]
                location=${project:dependencies}/python-2.4/part
                include=${project:dependencies}/python-2.4/part/include
                lib=${project:dependencies}/python-2.4/part/lib

                [python-2.5]
                location=${project:dependencies}/python-2.5/part
                include=${project:dependencies}/python-2.5/part/include
                lib=${project:dependencies}/python-2.5/part/lib

                [site-packages-2.5]
                recipe = plone.recipe.bundlecheckout
                url =  -r7283 http://code.djangoproject.com/svn/django/branches/gis/django
                subfolder=django

The corresponding minibuild:
    Example::
        [minimerge]
        depends=python-2.5
        src_type=svn
        src_uri=http://hg.minitage.org/hg/minitage/buildouts/ultimate-eggs/geodjango-r7283/
        install_method=buildout
        category=eggs

Django is a classical python package, that s why we package it like it!
Furtherthe more, the name of the minibuild will be the name you ll reference later in the django.env helper file.


Project Layout
==============
    * the project will look like :
       * app/ the code
       * templates/ : django templates
       * shell/ : bash helpers
         * django.python : special python interpreter with all that django needs.
         * django.env : put aliases and pathes into the current env.
       * media/ : js, image and static stuff
       * share/ : misc, doc and etc.


Specific to django shell helpers
================================

:django.env:
    provides those aliases:
        * python
        * python-2.5
        * python2.5
        * compile-messages
        * daily-cleanup
        * django-admin
        * make-messages
        * unique-messages
:django.python:
    * provides a python interpreter with a preset PYTHONPATH
    * you will need to specify inside the wanted geodjango that you have previously packaged.


Using the django instance
=========================
Example::
    cd minitage/django/project
    source shell/django.env
    python ....
    django-admin
   ./shell/django.python


Steps to minitaging a project
=============================
 * Package your wanted django version
 * Make a minibuild pointing to this django
   Example::
        [minimerge]
        depends=python-2.5
        src_type=hg
        src_uri=http://hg.minitage.org/hg/minitage/buildouts/ultimate-eggs/geodjango-r7283/
        install_method=buildout
        category=eggs     
 * Put this miniuild in a seen minilay
 * Check out the django template
 * Assemble your code inside the template
 * Edit shell/django.env to point to the needed django version
 * Make a minibuild pointing to that project and put the specific django version as a dependency of your project:
   Example::
        [minimerge]
        depends=myproject-django-rxxx
        src_type=hg
        src_uri=http://hg.minitage.org/hg/minitage/buildouts/ultimate-eggs/geodjango-r7283/
        install_method=buildout
        category=eggs      
 * Put this miniuild in a seen minilay
 * Enjoy and listen to the wind.


Tips and Tricks
===============
Make 2 kind of eggs to packages django and use this naming scheme:
    * YOURPROJECT-django-rXXX to point to a specific revision of django.
    * YOURPROJECT-django-scm to point to the current developpment version used
In those eggs, copy one allready packaged django, and modify the revision to have the one you want
This  will allow you to just edit point to your wanted django:
    * project/shell/django.env 
    * the project minibuild to make come the wanted django as a dependency
    


















