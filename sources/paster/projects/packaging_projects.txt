.. _depproject:

The minitage buildout recipes
==============================

You must look on : http://pypi.python.org/pypi/minitage.recipe to enjoy playing
with a minitage environment, those recipes fit well inside a minitage.

Dependency project
=======================

Purpose
----------

How to package a system dependency which is not python related software (not installed with distutils or setuptools) in minitage.
The minitage category is "dependencies".

Layout
-----------
You must install into minitage/dependencies/dependencyName/parts/part

Sample Layout
---------------
You can use this sample throught paster::

    easy_install minitage.paste
    paster create -t minitage.dependency dependencyName

.. _eggproject:

Python based projet
=========================

Purpose
--------------------
Packaging python things, distutils or setuptools.
The minitage category is "eggs".

Distutils
------------------
Layout
++++++++++++++++
For each python version supported, we will install a site-package-PYTHONVER in the parts buildout directory.


The minitage.recipe:du recipe
++++++++++++++++++++++++++++++++++
This recipe can install packages based on distutils that dont support yet setuptools.
In this case, the goal is to install in a prefix the python module to make it
come later in the python patn.

You can create a project based on this recipe with::

    easy_install minitage.paste
    paster create -t minitage.distutils myproject


Python eggs
----------------
Layout
+++++++++++
The resulted eggs will be put in the egg cache of the buildout section, those projects live in the eggs/ directory


The minitage.recipe:egg recipe
+++++++++++++++++++++++++++++++++++++
This recipe can install packages based on setuptools.

You can either install from an url or an egg name.

You can install multiple eggs at a time.

You can create a project based on this recipe with::

    easy_install minitage.paste
    paster create -t minitage.egg myproject


