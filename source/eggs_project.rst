============
Eggs Projets
============

Purpose
=======

Package python things, distutils or setuptools.
The minitage category is "eggs".

Buildout
========

We will install a site-package-PYTHONVER in the buildout directory that will be referenced by other projects in their buildout.

Writing part
============

Use the '''minitage.recipe.du''' recipe to build your packages.
Think that for eggs installation, you must share the eggs caches directory with the instance 's one!
See the variables ${project:eggs-directory} and ${project:develop-eggs-directory}.
The main goal of the recipe was to add dependencies in the Envrionnement at buildtime.
There is an additionnal variable than in the original zope.recipe.egg recipe:

    * ``includes``: C header to search for
    * ``libs``: libraries paths to link to
    * ``pythonpath``: paths to add to PYTHONPATH*
    * ``path``: paths to add to PATH
    * ``pkgconfigpath``: paths to add to PKG_CONFIG_PATH
    * ``rpath``: libraries paths to include in the search at runtime path
    * ``extra-paths``: list of eggs to add in the PYTHONPATH at build time.
    * ``url``: url of the source distribution
    * ``patch-options``: options for the patch cmd
    * ``OSNAME-patches``:patches to apply to a specific os
    * ``patches``: patches to apply
    * ``pre-setup-hook/pot-setup-hook``: hooks before/after setup install

Examples
========

Extension module
----------------

.. sourcecode:: ini

    [project]
    eggs-directory=${buildout:directory}/../../eggs/cache
    develop-eggs-directory=${buildout:directory}/../../eggs/develop-cache
    parts = Littleegg
    ...
    # Set our 2.4/5 python
    [python2.5]
    executable=${project:dependencies}/python-2.5/part/bin/python
    name=python2.5
    [python2.4]
    executable=${project:dependencies}/python-2.4/part/bin/python
    name=python2.4
    [buildout]
    python = python2.4
    versions = versions
    executable = python2.4
    parts = ${project:parts}
    extra-paths=
    find-links =
      http://dist.plone.org
    eggs =
    develop =
      src/minitage.recipe.utils
      src/minitage.recipe.du
    hooks-directory = ${buildout:directory}/hooks
    eggs-directory = ${project:eggs-directory}
    develop-eggs-directory = ${project:develop-eggs-directory}
    ...
    [pycairo-2.4]
    recipe = minitage.recipe.du
    python = python2.4
    url=http://cairographics.org/releases/pycairo-1.4.12.tar.gz
    includes =
      ${python-2.4:location}/include
      ${cairo:location}/include
    libraries =
      ${python-2.4:location}/lib
      ${cairo:location}/lib
    rpath =
      ${pycairo-2.4:libraries}
    [pycairo-2.5]
    recipe = minitage.recipe.du
    python = python2.5
    url=http://cairographics.org/releases/pycairo-1.4.12.tar.gz
    includes =
     ${python-2.5:location}/include
     ${cairo:location}/include
    libraries =
      ${python-2.5:location}/lib
      ${cairo:location}/lib
    rpath =
      ${pycairo-2.5:libraries}

Pure python
-----------

.. sourcecode:: ini

  [project]
  eggs-directory=${buildout:directory}/../../eggs/cache
  develop-eggs-directory=${buildout:directory}/../../eggs/develop-cache
  parts = Littleegg
  ...
  # Set our 2.4/5 python
  [python2.5]
  executable=${project:dependencies}/python-2.5/part/bin/python
  name=python2.5
  [python2.4]
  executable=${project:dependencies}/python-2.4/part/bin/python
  name=python2.4
  [buildout]
  python = python2.4
  versions = versions
  executable = python2.4
  parts = ${project:parts}
  extra-paths=
  find-links =
       http://dist.plone.org
  eggs =
  develop =
       src/minitage.recipe.utils
       src/minitage.recipe.du
  hooks-directory = ${buildout:directory}/hooks
  eggs-directory = ${project:eggs-directory}
  develop-eggs-directory = ${project:develop-eggs-directory}
  ...
  [pycairo-2.4]
  recipe = minitage.recipe.du
  python = python2.4
  url=http://cairographics.org/releases/pycairo-1.4.12.tar.gz
  [pycairo-2.5]
  recipe = minitage.recipe.du
  python = python2.5
  url=http://cairographics.org/releases/pycairo-1.4.12.tar.gz


Create the appropriate minibuild
================================

Create a minibuild for your egg:

.. sourcecode:: sh

    $ cat yourproject
    install_method="buildout"
    src_uri="https://subversion.foo.net/yourproject/trunk"
    src_type="svn"
    category="eggs"

