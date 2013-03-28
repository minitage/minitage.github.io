The minitage swiss knife, **minimerge**
==========================================


Verbose mode
-----------------
Usable with any other option, recommended to use which each command !
::

    minimerge -v [opts] [args]

Dry run
-------------
::

    minimerge [opts] -pv [args]

Ask mode
-------------
minimerge will wait for your confirmation before proceeding to anything::

    minimerge [opts] -a [args]

Squizzes dependencies
-----------------------
::

    minimerge -j dep package

If you want to install ``a`` and ``a`` depends on ``b``, ``c``, ``d`` respectivly.
To squizze ``b`` and ``c`` and only install ``d`` and ``a``::

    minimerge -j d a

Build only dependencies
------------------------------
::

    minimerge --only-dependencies package

Update your minilays
--------------------------
::

    minimerge -s

Install a package and its dependencies
------------------------------------------------------------
::

    minimerge package

Install a package without dealing with dependencies
------------------------------------------------------------
That will run only your package installation::

    minimerge -N package

Update the package codebase
------------------------------------------------------------
That will run the update method of what you have used to checkout your
package::

    minimerge -NU package


Run again the installation of a package
------------------------------------------------------------
That will run the update method of what you have used to checkout your
package::

    minimerge package

Unconditionnally install or reinstall a package
------------------------------------------------------------
::

    minimerge -NR package


Note
------
All the previous options can be combined.

Update/Rebuid  a package and all its dependencies
------------------------------------------------------
To install & rebuild a package and all its dependencies::

    minimerge -s
    minimerge -Uu package

Behaviour notes
-------------------

    - Minitage will never run automaticly again where a buildout has been
      already run and has left an 'installed.cfg' file. You must tell it
      explicitly to do that like:

        * Just run the buildout::

            minimerge  -NRuU package # up
            minimerge  -NR package

Relaunch an interrupted minitage
---------------------------------------
::

            minimerge  mypackage

Relaunch a failed installation exactly where it stopped
------------------------------------------------------------
::

            minimerge -j myfailedpackage package



