==========
Minibuilds
==========

Minilays
========

What is a minilay
-----------------

A minilay is a directory containing minibuilds.
Minilays are parsed during the dependencies calculation done by minimerge.
minimerge searches for minibuilds in all its minilays, thus in alphabetical order.
That 's why when you do that::

    minilays/
     a_override_dependencies/
       minibuild1
     dependencies/
       minibuild1

and try to:

.. sourcecode:: sh

    ./minimerge minibuild1

minimerge will install ``a_override_dependencies/minibuild1`` instead of ``dependencies/minibuild1``.

This mechanism is very useful to override things for special needs !

Specifying alternate minilays to minimerge
------------------------------------------

You can give minilays to minimerge by placing them in::

    minitage/minilays

Or, you can put paths in the MINILAYS environment variable (space separated paths), but be aware, they are read first in the dependencies calculation!

.. sourcecode:: sh

    export MINILAY="path1 path2"


Minibuilds
==========

What is a minibuild
-------------------

A minibuild is similar to a gentoo ebuild  (i recommend you to read http://en.wikipedia.org/wiki/Ebuild) or a FreeBSD Port Makefile (http://en.wikipedia.org/wiki/Ports_collection)  or a macport.
In a short, it is just a meta data file which contains all the necessary to describe the install process of a dependency.
The questions to answer are:

    * Dependencies for the package ? ( eg; python-2.4 )
    * Where to get it ? (the url)
    * How fetch it ? <svn, git, hg, http)
    * How will it be installed ? ( buildout )
    * Metadatas:

        * License
        * Project url

Writing Minibuilds
------------------

A minibuild is a shell script which is sourced by minimerge and has a bunch of meta data :

    * a src_uri variable: where to fetch the package if not present on the file system
    * a src_type variable: how to fetch it. 
      Available fetch methods are:

        * svn

    * a depends variable : list of other monibuilds which this one depends on
    * a install_method variable : how to install it
      Available install methods are:

        * buildout

    * a category variable : controls the category of the minibuilds. [[br]]
      Categories are top level  directories in your minitage directory. [[br]]
      Available categories are:

        * dependencies
        * eggs
        * django
        * zope

minitage installs a minibuild called MINIBUILDNAME to your minitage/CATEGORY/MINIBUILDNAME.
the steps are:

    * in online mode only: Try to fetch the src_uri to minitage/CATEGORY/MINIBUILDNAME (in offline mode: the files must be present !)
    * Run the install method

Exemple : the minibuilds/cyrus-sasl-2.1 minibuild::

    # depends on the freetype-2.1 minibuild
    depends='freetype-2.1'      
    # must be fetched from svn
    src_type="svn"
    # where it is !
    src_uri="https://subversion.makina-corpus.net/zopina/buildouts/buildout-meta/trunk/lib/cyrus-sasl-2.1.22/"
    # this is a "buildout" minibuild which will install itself via buildout 
    install_method="buildout"
    # will be installed in minitage/dependencies/packagename
    category="dependencies"

You must place your minibuild in a directory (called a minilay) and register this directory with the "MINILAYS" environnment variable (sperate multiple ones by spaces) or place it  in minitage/minilays sub directory.

meta minibuilds
---------------

You can even define meta-minibuilds just to grab dependencies. Those minibuilds will just have a depends variable.
This is useful to split large minibuilds. For example the meta-project will specify all the proiject dependencies including the project itself.
Thas's why my projects minilays have always a "project" and "meta-project"
minibuild. eg::

    minibuilds/toto
    depends="foo-1.0"


Conventions
-----------

They are just rules, not conventions, follow them or be killed.

    * name your minibuild : PACKAGENAME-VERSION
    * name instances ones : PACKAGENAME-VERSION
    * name meta ones :  meta-PACKAGENAME.
    * Please set the version to MAJOR:MINOR without the revision for compiled dependencies ! Thus to prevent from recompiling everything on security updates for example


