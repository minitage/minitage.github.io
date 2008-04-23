=====
About
=====

Purpose
=======

The first goal is to make re usable buildouts among all our projects.

Pre requisite knowledge
=======================

Read carefully this documentation: http://plone.org/documentation/tutorial/buildout.
And this one can be good too: http://pypi.python.org/pypi/zc.buildout
It is essential for you to know the basics of buildout to use it.
It is not necessary for you to test it because you will do the practise part just after ;).

Variables used in this documentation
====================================

    * ``$project`` -> your project name
    * ``$bd`` -> buildout directory
    * ``$mt`` -> minitage root path
    * ``$url`` -> the url of your versioned project

Minitage
========

Buildout Limits
---------------

First of all, do not buy a gun before using buildout
Buildout is not a magical tool and we just had quite a lot of drawbacks :

    * Today offline mode is problematic
    * If you change your python, take a coffee.
    * 1GB per project, it s too much.
    * Pypi is just the only one index
    * Hay, buildout just did a big  rm -rf parts !

Idea
----

The idea is to write a light package manager from scratch which will allow us to use various build systems.
What about shell scripts, buildout or makefiles interact together to assemble all the parts of our current projects ?
Thus possible by sharing a common layout for all installed stuff.

This will allow us to:

    * Write just small specialized buildouts
    * Reuse with svn:externals or others (mercurial forest extension, package manager fetching methods)
    * Centralize and re-use dependencies among projects.
    * Use different ways to install, there is no perfect one so it is useless to use just one :)

This package manager must:

    * Be simple ! 
    * Run on popular Unixes, including FreeBSD, Linux and MacOSX.
    * Have a dependency system
    * Integrates other build systems
    * Not build itself!
    * Fetch from several methods: main are svn, http, ftp, CVS, GIT, mercurial and bzr
    * Provide an overlay system which allow us to override where to search packages.
    * Install each part independently of the others. Follow the http rule (DO NOT SHARE)
      .. note::

            Independently is not a synonym of not using another dependency.
            It s just to say that you cannot drop eggs in a common site packages or install 2 dependencies in the same /dependencies/foo at the same time.
            You must install the 2 eggs or dependencies separatly and then reference them together.

    * Read [MinitageMinibuilds minibuilds] which indicate how to install our dependencies/eggs/projects.

Layout
------

::

    lib/
        minitage/
               functions.sh
    dependencies/
        dep1/
          buildout.cfg
    eggs/
        cache/
        develop-cache/
        projectn/
          buildout.cfg
          ...
          site-packages-2.4
          site-packages-2.5
    django/
         project1/
         ...
         projectn/
    zope/
         project1/
         ...
         projectn/
    shell/
         EXTERNALS.TXT
    minilays/
         eggs/
         dependencies/
         instances/
         meta/
    minimerge
    etc/
         minimerge.cfg

Here are some explanations:

minimerge and lib/minitage/functions.sh:
    The project Assembler.

minimerge.cfg
    Minitage configuration file.

dependencies

    * Necessary libraries (libpng, readline). 
    * Needed applications.
    * It is not necessary to say that those must be installed prior to your project which will depend on them.
      That's why we need a dependency system ;)

eggs
    Traditional eggs or python related stuff.
    Because of offline mode feature, you must build them all (foe example python setup.py install is mostly sufficient).

django
   Django projects which only the project code templates, and so on. No egg, not even the django code.
   .. note::

        The django code must live in /eggs/subdir!
        Then you must provide a system to provide a python interpreter and a bash environment file to run and use your project.
        Like : http://hg.minitage.org/hg/minitage/shell/file/tip/geodjango-r7283.env and http://hg.minitage.org/hg/minitage/shell/file/tip/geodjango-r7283.python

zope
    Zope/Plone projects which only install zope, plone and the needed products.
    Just think to add the needed site-packages in the project's extra-path so that buildout can find them!
    Do not use not packaged eggs parts there or BURN IN HELL!

shell
    We get it via svn:externals as usual.
    The needed boilerplate to give the environment variables and useful launchers like a python with appropriate PYTHONPATH and a bash environment file which gives you the alias for python and so on.

[MinitageMinibuilds#Minilays minilays] : dependencies | zope | django | eggs
    Those are MINILAYS. Minilays are similar to gentoo 's OVERLAYS. Or, be reference, to entries in your source.list on Debian/Ubuntu.
    They contains minibuilds.
    Those are the packages that our package manager deals with.
    You can add search Directories by setting the "MINILAYS" environment variable.
    ex:

    .. sourcecode:: sh

        export MINILAYS="~/otherminibuildsdirectory"

The MakinaWay
=============

    * Make and abuse of branches.

        * Make branches for special needs (light ones)
        * Make a production branch

    * Tag your products
    * Fix versions in the buildout for re-execution in the same state.
    * If you add parts, think to report them in the sample buildout.cfg from Zopina for re-use.
