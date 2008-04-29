================
django Projects
================
.. highlight:: cfg

Purpose
=======

Creating a django project using buildout and minitage
The minitage category is ``"django"``.

Conventions
===========

 * category is django

Template
========

There is a `template project`_ online that can be used as bases for your
project.

.. _`template project`: https://hg.minitage.org/minitage/samples/django


Django
======
 * django is a dependency of your project. Even if it is the main one.
   So, you must not package it along with your project stuff.
 * Django work out of the box after a checkout, so the buildout will be very simple.
   We just need a recipe that knows how to checkout.
 * Problem is that django applications are often tied to a particular branche and a particular revision.
   So, we will package for each project 2 kind of eggs:

   - one suffixed in -scm pointing to the current unstable svn version used in our developpment.
   - many eggs suffixed in -rREV pointing to the corresponding revision. Those one will be used by production branches

 * We will use shell helpers to assemble the python path needed by our application.

Basic Django Packaging
======================
 We will package the -r7283 of geodjango as an example. And we 'll name it 'geodjango-r7283'
 The result is here : http://hg.minitage.org/hg/minitage/buildouts/ultimate-eggs/geodjango-r7283/

 The buildout.cfg:

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

..

 The corresponding minibuild:
 Example::

    [minimerge]
    depends=python-2.5
    src_type=svn
    src_uri=http://hg.minitage.org/hg/minitage/buildouts/ultimate-eggs/geodjango-r7283/
    install_method=buildout
    category=eggs

 Django is a classical pur-python package.
 So, hopefully, we have not much work to package it :)
 When you ll minimerge it, it will go in minitage/eggs/geodjango-r7283.


django based Project's Layout
=============================
The project will look like
--------------------------
   - app/ the code
   - templates/ : django templates
   - shell/ : bash helpers

     + django.python : special python interpreter with all that django needs.
     + django.env : put aliases and pathes into the current env.

   - media/ : js, image and static stuff
   - share/ : misc, doc and etc.


Django shell helpers
--------------------
 django.env which provides thoses aliases:
  * python
  * python-2.5
  * python2.5
  * compile-messages
  * daily-cleanup
  * django-admin
  * make-messages
  * unique-messages

 django.python
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
 * Grab your django project source code into the wanted app/ subdirectory
 * Edit shell/django.env to point to the needed django version (the variable WANTED_DJANGO)
 * Check in the project somewhere (http://hg.minitage.org/hg/minitage/mylittleproject/)
 * Make a minibuild pointing to that project and put the specific django version as a dependency of your project:
   Example::

        [minimerge]
        depends=myproject-django-rxxx
        src_type=hg
        src_uri=http://hg.minitage.org/hg/minitage/mylittleproject/
        install_method=buildout
        category=django
 * Put this miniuild in a seen minilay
 * Enjoy and listen to the wind.


Tips and Tricks
===============

 - Make 2 kind of eggs packages to packages django and use this naming scheme:

  * YOURPROJECT-django-rXXX to point to a specific revision of django.
  * YOURPROJECT-django-scm to point to the current developpment version used

 - In those eggs packages , copy one already packaged django, and modify the revision to have the one you want

 - In the developpement branch (HEAD,tip, trunk): use the YOURPROJECT-django-scm as dependency (minibuild, WANTED_DJANGO in django.env)
 - In production branch, use YOURPROJECT-django-rxxx as dependency (minibuild, WANTED_DJANGO in django.env)

 - This  will allow you to just edit point to your wanted django:

  * project/shell/django.env (the variable WANTED_DJANGO)
  * the project minibuild to make come the wanted django as a dependency

