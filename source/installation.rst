============
Installation
============

Buildout Configuration
======================

To store all downloaded stuff in the same place, you ll need to set buildout to do so.

.. code-block:: sh

    mkdir -p ~/.buildout/downloads
    cat << EOF > ~/.buildout/default.cfg
    [buildout]
    download-directory = $HOME/.buildout/downloads
    download-cache = $HOME/.buildout/downloads
    EOF


System Requirements
====================

Debian/Ubuntu
-------------

Prior to begin with the project, ensure those dependencies are installed on your system:

    * m4
    * build-essential
    * pkg-config
    * automake
    * libtool
    * autoconf

.. code-block:: sh

    apt-get install build-essential m4 libtool pkg-config autoconf m4 gettext


FreeBSD
-------

    * gmake
    * gsed

.. code-block:: sh

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

.. code-block:: sh

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

This utility deploys for you a nicely python with all its dependencies in a prefix of your choice.

    This script will install for you:

    * Python-2.5.2 or Python-2.4.5 (default)
    * openssl 0.9.7
    * zlib-1.2.3
    * bzip2-1.0.4
    * ncurses-5.6
    * readlines-5.2
    * ez_setup.py which will provide setuptools,zc.buildout, paster and virtual env

Variables
+++++++++++

We will use some variables to refer to well known places and scripts.
Just adjust the following code to fit to your needs and type it in your current shell/

.. code-block:: sh

    export minitage=$HOME/minitage
    export python=$HOME/python


Usage
++++++
- Please use a FULL path with this script!

.. code-block:: sh

    mkdir -p $python
    cd $python
    wget http://hg.minitage.org/hg/minitage/shell/raw-file/tip/PyBootstrapper.sh
    bash ./PyBootstrapper.sh $python

offline mode
+++++++++++++
- Please use a FULL path with this script!
- You can use it in offline mode but put the archives in your `$prefix/downloads` eg:

.. code-block:: sh

    ln -s /prod/1.0/downloads  $python/downloads
    bash ./PyBootstrapper.sh  -o $python

Using virtualenv
=================
You have to use `virtualenv <http://pypi.python.org/pypi/virtualenv/1.1>`_ ,
minitage fits well with it.

virtualenv is a tool that allow you to create isolated Python
environments.


    Here is how to set up an environment with it:

    - Only if you do not have used the boostrap script, you must install virtualenv::

        # maybe sudo ?
        easy_install virtualenv

    - Install the minitage prefix, this is just a new virtualenv creation::

        $python/bin/virtualenv --no-site-packages $prefix
        # maybe that if you do not used the bootstrapper
        # virtualenv --no-site-packages $prefix


    - activate it::

        source $prefix/bin/activate


    KEEP IN MIND THAT YOU MUST ACTIVATE VIRTUALENV AT ANY TIME YOU USE IT.


Installing minitage
====================

A stable version
-----------------

    Minitage is a classical python egg, you can get it throught easy_install.

    To install minitage in a stable version, follow those steps:

    - Install minitage

    .. code-block:: sh

        easy_install minitage.core

    - Sync its packages (all its minilays in minitage terminology).
      This will initiate also all the minitage directories for the first run.

    .. code-block:: sh

        minimerge -s


A develop version:
------------------
If you want to be bleeding edge and not lhave a 3 years old debianised
minitage. You can give a try to the egg in developement mode.

    - If you need to, fire your virtualenv

    .. code-block:: sh

        source $prefix/bin/activate

    - Get the sources

    .. code-block:: sh

        mkdir -p ~/repos/minitage
        cd ~/repos/minitage
        hg clone http://hg.minitage.org/hg/minitage/eggs/minitage.core
        hg clone http://hg.minitage.org/hg/minitage/eggs/minitage.recipe

    - Or update them

    .. code-block:: sh

        hg pull -u -R ~/repos/minitage/minitage.core
        hg pull -u -R ~/repos/minitage/minitage.recipe

    - Install/Reinstall minitage in develop mode

    .. code-block:: sh

        cd ~/repos/minitage/minitage.core
        python setup.py develop
        cd ~/repos/minitage/minitage.recipe
        python setup.py develop

    - Sync its packages (all its minilays in minitage terminology).
      This will initiate also all the minitage directories for the first run.

    .. code-block:: sh

        minimerge -s

Syncing packages or first time use
-------------------------------------

    - To sync all your minilays (and initiate stuff the first time)

.. code-block:: sh

        source $prefix/bin/activate
        minimerge -s


Using minitage
==============

Those are usage samples... You have not to run that if you do not need to ;)

Install python-xxx
-------------------

.. code-block:: sh

        source $prefix/bin/activate
        minimerge python-xxx

Install a custom minilay
---------------------------

.. code-block:: sh

    # get the project minilay
    # minitage is aware of the MINILAYS environnment variable, you can use it to specify space separated minlays
    scm CHECKOUT  https://subversion.foo.net/YOURPROJECT/minilay/trunk $prefix/minilays/YOURPROJECTMINILAY

Deploy a project with minitage
---------------------------------------

.. code-block:: sh

    # get the project minilay
    # minitage is aware of the MINILAYS environnment variable, you can use it to specify space separated minlays
    scm CHECKOUT  https://subversion.foo.net/YOURPROJECT/minilay/trunk $prefix/minilays/YOURPROJECTMINILAY
    # minimerging it
    minimerge project

Extra options and usage:
=========================

.. code-block:: sh

   minimerge  --help

