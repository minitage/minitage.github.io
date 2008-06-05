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


System Requirements
====================

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


Python
=======

Existing python
----------------
You need a python with setuptools, zlib, bz2 and ssl support.

Try that in your interpretery::

>>> import tarfile
>>> import zipfile
>>> import bz2
>>> import _ssl
>>> import zlib
>>> import setuptools
>>>

PyBootstrapper
---------------

Goal
++++

This utility deploys for you a nicely python with all its dependencies.

    WILL INSTALL IN PREFIX:

    * Python-2.5.2
    * openssl= 0.9.7
    * zlib-1.2.3
    * bzip2-1.0.4
    * ncurses-5.6
    * readlines-5.2
    * ez_setup.py which will provide setuptools,zc.buildout, paster and virtual env

Usage
++++++

.. sourcecode:: sh

    wget http://hg.minitage.org/hg/minitage/shell/raw-file/tip/PyBootstrapper.sh
    mkdir -p $HOME/tools/python-2.4
    bash ./PyBootstrapper.sh $HOME/tools/python-2.4

offline mode
+++++++++++++

You can use it in offline mode but put the archives in your prefix / downloads eg:

.. sourcecode:: sh

    ln -s /prod/1.0/downloads  $HOME/tools/python-2.4/downloads
    ./MakinaBootstrapper.sh  -o $HOME/tools/python-2.4

Using virtualenv
=================
You 'd better to use `virtualenv <http://pypi.python.org/pypi/virtualenv/1.1>`_ ,
minitage fits well with it.

virtualenv is a tool that allow you to create isolated Python
environments.


    Here is how to set up an environment with it:

    - Install virtualenv::

        easy_install virtualenv #(maybe use sudo ;))

    - Install minitage prefix::

        virtualenv --no-site-packages  ~/minitage

    - activate it::

        source ~/minitage/bin/activate


    KEEP IN MIND THAT YOU MUST ACTIVATE VIRTUALENV AT ANY TIME YOU USE IT.


Installing minitage
====================

A stable version
-----------------

    Minitage is a classical python egg, you can get it throught easy_install.

    To install minitage in a stable version, follow those steps:

    - Install minitage::

        easy_install minitage.core

    - Sync its packages (all its minilays in minitage terminology).::

        minimerge -s


A develop version:
------------------
If you want to be bleeding edge and not lhave a 3 years old debianised
minitage, you can give a try to the egg in developement mode?

    If you need to, fire your virtualenv

.. sourcecode:: sh

        source ~/minitage/bin/activate

    Get the sources

.. sourcecode:: sh

        mkdir -p ~/repos/minitage
        cd ~/repos/minitage
        hg clone http://hg.minitage.org/hg/minitage/eggs/minitage.core
        hg clone http://hg.minitage.org/hg/minitage/eggs/minitage.recipe

- Or update them

.. sourcecode:: sh

        hg pull -u -R ~/repos/minitage/minitage.core
        hg pull -u -R ~/repos/minitage/minitage.recipe

    Install/Reinstall minitage in develop mode

.. sourcecode:: sh

        cd ~/repos/minitage/minitage.core
        python setup.py develop
        cd ~/repos/minitage/minitage.recipe
        python setup.py develop


Syncing packages
-----------------

    To sync all your minilays

.. sourcecode:: sh

        source ~/minitage/bin/activate
        minimerge -s


Using minitage
==============

    * Install python-2.4

.. sourcecode:: sh

        source ~/minitage/bin/activate
        minimerge python-2.4

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



