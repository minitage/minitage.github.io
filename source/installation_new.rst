Minitage Tool : installation, updates & snapshots
##################################################

The idea
==========
Minitage can be hard to use for non developers, so we made a script **minitagetool.sh** to help working with minitage.

This script:

    - configures buildout correctly to indicate cache & downloads cache
    - can compile & install a python
    - can install minitage (from source, no eggs)
    - Can install minitage base packages
    - Can install your project
    - Can make a snapshot (usable offline) of:

        - The minitage installation
        - Downloads
        - Projects

    - Can redeploy those snapshots elsewhere

- **WARNING**: it touches ~/.buildout/default.cfg to set the local download cache

Additionnaly to minitage initial layout we have::

    minitage/

Installing minitage
====================
You need to be online to bootstrap with this script.

In the other hand, to use offline, have ``./minitage/downloads``  feeded with neccessary archives.


.. code-block:: sh

    mkdir minitage
    cd minitage
    wget -O minitagetool.sh https://raw.github.com/minitage/minitage.shell/master/minitagetool.sh
    chmod +x minitagetool.sh
    ./minitagetool.sh bootstrap # take a coffee...

Installing a project
=====================
Now what you cant is to install your project.

Minitage needs a minilay with one or more minibuilds declaring your project, and the project itself.

The minilay can be either contained on the project repository or be on a separate repo, do as you want.


The only thing you have to do is to install the project minilay in ``minitage/minilays/``

    - Either by checkouting your project in its minitage final location (``<minitage>/categ/minibuild``), and then symlick the minilay::

        mkdir minitage/zope
        cd minitage
        git clone git@foo:bar zope/bar
        ln -s $PWD/zope/bar/minilay minilays

    - Or by directly checkouting the minilay::

        cd minitage
        git clone git@foo:bar-minilay minitage/minilays/bar-minilay

- Run the minimerge dance via the tool minus the **ONLINE** switch::

    ONLINE=y ./minitagetool.sh deploy <projectminibuild> [<otherminibuild>]


Upgrade minitage itself
========================
Time to time, you need to update your software stack...
Or you have issues with minitage and want to see if is is now xied, just run::

    ./minitagetool.sh selfupgrade

Think to redeploy your project dependencies updates as well
Simply run::

    ONLINE=y ./minitagetool.sh deploy <projectminibuild> [<otherminibuild>]

Make a snapshot
========================
You can reproduce a minitage installation by taking a snapshot. This snapshot will be usable offline::

    ./minitagetool.sh snapshot [<project> <projectn>]

Without argument it snapshots **all projects**.
It excludes the **var** directory among others.
Giving argument will filter the "projects" tarball including only the specified projects.

Deploy a snapshot
========================
::

    mkdir minitage
    cd minitage

get the archives produced by ``./minitagetool.sh snapshot``::

     tar xzvf <minitageoffline-CHRONO-base.tar.gz>
     tar xzvf <minitageoffline-CHRONO-downloads.tar.gz>
     tar xzvf <minitageoffline-CHRONO-projects.tar.gz>

Restore the snapshot to an usable state::

     ./minitagetool.sh deploy <project>

Launch cgwb
=============
Cgwb is the minitage project generator web frontend::

    ./minitagetool.sh cgwb

