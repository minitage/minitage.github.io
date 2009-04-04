.. _depproject:

Dependency project
*******************

Purpose
=======

How to package a system dependency which is not python related software (not installed with distutils or setuptools) in minitage.
The minitage category is "dependencies".

Layout
=======
You must install into minitage/dependencies/dependencyName/parts/part

Sample Layout
=============
You can use this sample throught paster::

    easy_install minitage.paste
    paster create -t minitage.dependency dependencyName


The minitage.recipe:cmmi recipe
================================
The command just installed a project based on the ``minitage.recipe:cmmi`` recipe.

This one is likely to do:
    - pre-configure-hook
    - ./configure
    - pre-make-hook
    - make
    - pre-make-hook
    - make install
    - post-install-hook


Hooks just point to python callables to do boilerplate that the classical
./configure && make && make install can not do.

You can set a lot of options to fine control the build process.

To know them, just create a project with paster and edit the generated buildout.cfg.

Under the hood
===============
Minitage as a package manager will give you some means to refer to the dependencies.

At build time:

for all the minibuild dependency:
    - it adds all binaries inside the path
    - it registers the ``includes`` directories to the CFLAGS varible
    - it registers the ``libraries`` directories to the LDFLAGS and LD_LIBRARY_PATH and LD_RUN_PATH variable
    - it registers the ``libraries/pkgconfig`` directories to the PKGCONFIGPATH
    - it registers the disutils stuff inside the PYTHONPATH



.. _eggproject:

Python based projet
*********************

Purpose
=======

Packaging python things, distutils or setuptools.
The minitage category is "eggs".

Distutils
==========

Layout
-------
For each python version supported, we will install a site-package-PYTHONVER in the parts buildout directory.


The minitage.recipe:du recipe
-------------------------------
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
The resulted eggs will be put in the egg cache of the buildout section, those projects live in the eggs/ directory


The minitage.recipe:egg recipe
-------------------------------
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

