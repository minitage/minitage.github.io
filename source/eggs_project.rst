=======================
Python based projet
=======================

Purpose
=======

Package python things, distutils or setuptools.
The minitage category is "eggs".

Distutils
==========

Layout
--------
For each python version supported, we will install a site-package-PYTHONVER in the parts buildout directory.


The minitage.recipe:du recipe
------------------------------
This recipe can install packages based on distutils that dont support yet setuptools.
In this case, the goal is to install in a prefix the python module to make it
come later in the python patn.

You can create a project based on this recipe with::

    easy_install minitage.paste
    paster create -t minitage.distutils myproject


Python eggs
=============

Layout
--------
The resulted eggs will be put in the egg cache of the buildout section, the project lives in the eggs/ directory


The minitage.recipe:egg recipe
------------------------------
This recipe can install packages based on setuptools.

You can either install from an url or an egg name.

You can install multiple eggs at a time.

You can create a project based on this recipe with::

    easy_install minitage.paste
    paster create -t minitage.egg myproject


The minitage.recipe:scipts recipe
--------------------------------------
You can use this recipe to generate scripts registered in the egg or a python
interpreter with a collection of eggs/python path.



