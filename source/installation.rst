============
Installation
============

Buildout Configuration
======================

To store all downloaded stuff in the same place, you ll need to set buildout to do so.
::

    mkdir -p ~/.buildout/downloads
    cat << EOF > ~/.buildout/default.cfg
    [buildout]
    download-directory = $HOME/.buildout/downloads
    download-cache = $HOME/.buildout/downloads
    EOF
    cat ~/.buildout/downloads


Requirements
============

Debian/Ubuntu
-------------

Prior to begin with the project, ensure those dependencies are installed on
your system:

    * m4
    * build-essential
    * pkg-config
    * automake
    * libtool
    * autoconf

.. sourcecode:: sh

    apt-get install build-essential m4 libtool pkg-config autoconf pkg-config m4


FreeBSD
-------

    * gmake
    * gsed

.. sourcecode:: sh

    cd /usr/ports/sysutils/portupgrade
    make install clean
    for i in gsed gmake ;do portinstall $i;done

Gentoo
------

Gentoo is perfect by default, no requirement.


Suze
----

Prior to begin with the project, ensure those dependencies are installed on
your system:

    * toolchain (gcc, autotools, m4)

MacOS X
-------

Before starting with the project, be sure that these dependencies are installed via macports (http://macports.org) on your system :

    * `bzip2 <http://trac.macports.org/projects/macports/browser/trunk/dports/archivers/bzip2/Portfile>`_
    * `gnu tar (gtar) <http://trac.macports.org/projects/macports/browser/trunk/dports/archivers/gnutar/Portfile>`_
    * `unzip <http://trac.macports.org/projects/macports/browser/trunk/dports/archivers/unzip/Portfile>`_
    * `binutils <http://trac.macports.org/projects/macports/browser/trunk/dports/devel/binutils/Portfile>`_
    * `sed (gsed) <http://trac.macports.org/projects/macports/browser/trunk/dports/textproc/gsed/Portfile>`_
    * `gnu make (gmake) <http://trac.macports.org/projects/macports/browser/trunk/dports/devel/gmake/Portfile>`_
    * `autoconf <http://trac.macports.org/projects/macports/browser/trunk/dports/devel/autoconf/Portfile>`_
    * `automake <http://trac.macports.org/projects/macports/browser/trunk/dports/devel/automake/Portfile>`_
    * `m4 <http://trac.macports.org/projects/macports/browser/trunk/dports/devel/m4/Portfile>`_

Do not forget to update your bash profile to take your installed ports into account

.. sourcecode:: sh

    # put this line into ~/.bashrc and ~/.bash_profile
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH

pybootstrapper
==============

This utility deploys for you a nicely python with all its dependencies.
Persist in using one of your existings python at your own risk.
System Requirements:


      WILL INSTALL IN PREFIX:
    * Python-2.4.4
    * openssl >= 0.9.7
    * zlib-1.2.3
    * bzip2-1.0.4
    * ncurses-5.6
    * readlines-5.2
    * ez_setup.py which will provide setuptools,zc.buildout, paster and virtual env

Usage
-----

.. sourcecode:: sh

    wget http://hg.minitage.org/hg/minitage/shell/raw-file/tip/PyBootstrapper.sh
    mkdir -p $HOME/tools/python-2.4
    bash ./PyBootstrapper.sh $HOME/tools/python-2.4

offline mode
------------

You can use it in offline mode but put the archives in your prefix / downloads eg:

.. sourcecode:: sh

    ln -s /prod/1.0/downloads  $HOME/tools/python-2.4/downloads
    ./MakinaBootstrapper.sh  -o $HOME/tools/python-2.4


Installing minitage
===================

.. sourcecode:: sh

    svn co https://URL_IS_NOT_VALID_MIGRATION_TO_MERCURIAL/zopina/buildouts/minitage/trunk/ /path/to/minitage/
    cd /path/to/minitage/
    cp etc/minimerge.cfg.in etc/minimerge.cfg
    # specify your python
    $EDITOR etc/minimerge.cfg

Variable you can override there (bash):

    * python : python executable
    * debug: set to y to enable debug mode
    * subversion_args: co or export, arguments to add to the svn line.
    * default_minilays: where to search for  minibuilds, directories separated by spaces.


Minitage is virtualenv friendly, if you create a virtualenv inside the toplevel directory, or in the subproject one, minitage will use it!
Minitage searches for the bin/activate file.
For example, creating a virtualenv with our precedent python:

.. sourcecode:: sh

    $HOME/tools/python-2.4/bin/virtualenv /path/to/minitage

Using minitage
==============

    * Install python-2.4

      .. sourcecode:: sh

        ./minimerge python-2.4

Example: deploy a project with minitage
---------------------------------------

.. sourcecode:: sh

    # get the project minilay
    # minitage is aware of the MINILAYS environnment variable, you can use it to specify space separated minlays
    svn co https://subversion.foo.net/YOURPROJECT/minilay/trunk /path/to/minitage/minilays/YOURPROJECTMINILAY
    # minimerging it
    ./minimerge meta-project

Extra options and usage:
------------------------

.. sourcecode:: sh

    $ ./minimerge  -c --help
       Minimerge v.0.3
      ../minimerge --help for more infos
      ../minimerge  [Options]     minibuild ... minibuildn  :  Installs  package(s)
      ../minimerge  [Options] -rm minibuild ... minibuildn  :  Uninstall package(s)
       Options:
      --offline (-o) : offline mode
      --debug   (-d) : enable debug mode
      --nodeps  (-N) : desactive dependencies checking to merge just a package without calculating and merging its dependencies, use at your own risks !
      --help    (-h) : print this help message
      --nocolor (-c) : desactivate colors !



