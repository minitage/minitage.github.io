Specifications
################

The package manager
===================

 - Be simple !
 - Run on popular Unixes, including FreeBSD, Linux and MacOSX. And in a second time, why not port him to other dirty OSs.
 - Have a simple and robust dependency system.
 - Integrates other build systems
 - Fetch from several methods: main are svn, http, ftp, ercurial (CVS, GIT, and bzr in a second time)
 - Provide some system which allow us search for packages in alternate locations.
 - Install each part independently to the others. Follow the http rule (DO NOT SHARE)::

     Independently is not a synonym of not using another dependency.
     It s just to say that you can not install in the same /dependencies/foo for 2 different dependencies at the same time.
     You must install each dependency separatly from the others and then reference in other packages.
     Be warn that there is not sandbo mecanism for checks and it is not goiong to appear, minitage must be simple.

The minilays
==============
Abstract
----------

    - A minilay is a directory containing minibuilds.
    - The name come from gentoo overlays system. See http://www.gentoo.org/proj/en/overlays/userguide.xml

Overlaping minilays
--------------------
    - Minilays are parsed during the dependencies calculation done by minimerge.
      minimerge searches for minibuilds in all its minilays, in alphabetical order.
    - That 's why when you do that::

        minilays/
            a_override_dependencies/
                minibuild1
            dependencies/
                minibuild1

    - And try to::

        minimerge minibuild1

minimerge will install ``a_override_dependencies/minibuild1`` instead of ``dependencies/minibuild1``.

This mechanism is very useful to override things for special needs !

Specifying alternate minilays to minimerge
------------------------------------------

 - You can give minilays to minimerge by placing them in::

        minitage/minilays

 - You can put paths in the MINILAYS environment variable (space separated paths), but be aware, they are read first in the dependencies calculation!::

        export MINILAYS="path1 path2"



The minibuilds
===============

Abstract
------------

 - They are the minitage packages.
 - A minibuild is similar to a gentoo ebuild  (i recommend you to read http://en.wikipedia.org/wiki/Ebuild) or a FreeBSD Port Makefile (http://en.wikipedia.org/wiki/Ports_collection)  or a macport.
 - The forms is a 'Config.ini' like file.
 - In a short, it is just a metadata file which contains all the necessary to describe the install process of a dependency:
    - Dependencies for the package ? ( eg: python-2.4 )
    - Where to get it ? ( the url )
    - How fetch it ? (svn, git, hg, http, ftp)
    - How will it be installed ? ( buildout )
    - Metadatas:

        - License
        - Project homepage

Writing Minibuilds
------------------

 - A minibuild is a config.ini file  which is read by minimerge and has a bunch of metadata :

    - a src_uri variable: where to fetch the package if not present on the file system
    - a src_type variable: how to fetch it.
      Available fetch methods are:

        - svn
        - hg
        - bzr
        - static (for http, file, local and ftp)

    - a dependencies variable: list of other minibuilds which this one depends on
    - a install_method variable : how to install it
      Available install methods are:

        - buildout

    - a category variable : controls the category of the minibuilds. [[br]]
      Categories are top level  directories in your minitage directory. [[br]]
      Available categories are:

        - dependencies
        - eggs
        - misc
        - django
        - tg
        - pylons
        - zope

    - You can use of course your own categories but be aware to name them
      with only letters and digits.
    - minitage installs a minibuild called MINIBUILDNAME to your minitage/CATEGORY/MINIBUILDNAME.
    - The steps ran are:

        - Fetch:

            - in online mode only: Try to fetch the src_uri to minitage/CATEGORY/MINIBUILDNAME
            - in offline mode: The files must be present !

        - Run the install method

Exemple : the minibuilds/cyrus-sasl-2.1 minibuild::

    [minibuild]
    # depends on the freetype-2.1 minibuild
    dependencies=freetype-2.1
    # must be fetched from svn
    src_type=svn
    # where it is !
    src_uri=https://subversion.makina-corpus.net/zopina/buildouts/buildout-meta/trunk/lib/cyrus-sasl-2.1.22/
    # this is a "buildout" minibuild which will install itself via buildout
    install_method="buildout"
    # will be installed in minitage/dependencies/packagename
    category=dependencies
    homepage=http://chuknorris.is.a.good/guy
    license=GPL

You must place your minibuild in a minilay.

meta minibuilds
---------------

You can even define meta-minibuilds just to grab dependencies. Those minibuilds will just have a dependenciess variable.
This is useful to split large minibuilds. For example the meta-project will specify all the proiject dependencies including the project itself.
Thas's why my projects minilays have always a "project" and "meta-project"
minibuild. eg::

    [minibuild]
    dependenciess=foo-1.0


Conventions
-----------

They are rules, not just conventions, follow them or be killed.
Please not that your project name cannot contain "``-``" as it is used to generate eggs names.

    - Valid names:

        - meta-toto
        - double-toto
        - toto
        - test-1.0
        - test-test-1.0
        - test-1.0.3
        - test-1.0_beta444
        - test-1.0_py2.4
        - test-1.0_py2.5
        - test-1.0_beta444_pre20071024
        - test-1.0_alpha44
        - test-1.0_alpha44_pre20071024
        - test-1.0_pre20071024
        - test-1.0_branchBRANCHNAME
        - test-1.0_branchHEADDIGIT
        - test-1.0_tagHEADDIGIT
        - test-1.0_r1
        - test-1.0_rHEAD
        - test-1.0_rTIP

    - Please set the version to MAJOR:MINOR without the revision for compiled dependencies !
      This will prevent from recompiling everything on security updates for example




The installation layout
=========================

Abstract
----------
::

        etc/
             minimerge.cfg
        bin/
            minimerge
            python
        lib/
            python-ver/
                site-packages/
                    minitage.core

        dependencies/
            dep1/
                buildout.cfg
                hooks/
                patches/::
                parts/
                    part/
                        bin/
                        lib/
                        include/

        eggs/
            cache/
            develop-cache/
            projectn/
                buildout.cfg
                hooks/
                patches/
                parts/
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

        anotherCategory/
            anotherProject/

        minilays/
            eggs/
            dependencies/
            instances/
            meta/
            samples/
            anExternalMinilay/



Layout explanation
--------------------

bin/minimerge:
    - The project Assembler.

etc/minimerge.cfg
    Minitage configuration file.

dependencies/:
 - Libraries and applications like libpng, python-2.4 or readline.
 - One dependency per directory.
 - The installation prefix for each dependency is::

            dependencies/dependency-name/parts/part

eggs:
    They is two possibilities there:

    - In a particular eggs/directory:

        - Traditional distutilized python modules
        - Python modules shipped is a non pythonish way (like libxml2)
        - They must install a sub site-packages for each python version supported::

            eggs/egg/
                site-packages-2.4/
                    module/__init__.py
                site-packages-2.5/
                    module/__init__.py
                site-packages-2.6/
                    module/__init__.py
                site-packages-3.0/
                    module/__init__.py


    - Python eggyfiables modules
        - They are installed in the "eggs-cache"
            - eggs in release mode::

                eggs/cache

            - eggs in develop-mode::

                eggs/develop-cache


django/:
    - Django projects.

zope/:
    - Zope/Plone projects which only install zope, plone and the needed products.
    - Just think to add the needed site-packages in the project's extra-path so that buildout can find them!
    - Do not use not packaged eggs parts there or BURN IN HELL!

minilays/:

misc:/
    - All that cannot be elsewhere

tg/:
    - Turbogears project

[MinitageMinibuilds#Minilays minilays] : dependencies | zope | django | eggs
    Those are MINILAYS. Minilays are similar to gentoo 's OVERLAYS. Or, be reference, to entries in your source.list on Debian/Ubuntu.
    They contains minibuilds.
    Those are the packages that our package manager deals with.
    You can add search Directories by setting the "MINILAYS" environment variable.
    ex:

    .. sourcecode:: sh

        export MINILAYS="~/otherminibuildsdirectory"

TIPS
=======

    * Make and abuse of branches.

        * Make branches for special needs (light ones)
        * Make a (pre)-production branch

    * Tag your products
    * Fix versions in the buildout for re-execution in the same state.
