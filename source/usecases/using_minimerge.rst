The minitage swiss knife, **minimerge**
==========================================


Verbose mode
-----------------
::

    minimerge -v [opts] [args]

Dry run
-------------
::

    minimerge [opts] -p [args]

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

Update your minimlays
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
That will run the udpate method of what you have used to checkout your
package::

    minimerge -U package

Run again the installation of a package
------------------------------------------------------------
That will run the udpate method of what you have used to checkout your
package::

    minimerge -u package

Unconditionnally install or reinstall a package
------------------------------------------------------------
::

    minimerge -R package


All the previous options can be combined.

Behaviour notes
-------------------

    - Minitage will never run automaticly again where a buildout has been
      already run and has left an 'installed.cfg' file. You must tell it
      explicitly to do that like:

        * Just run the buildout::

            minimerge -NUu package
            or
            minimerge -Nu package

        * Remove the .installed.cfg and run buildout::

            minimerge  -NRU package
            minimerge  -NR package

Relaunch an interrupted minitage
---------------------------------------
::

            minimerge -u mypackage

Relaunch a failed installation exactly where it stopped
------------------------------------------------------------
::

            minimerge -uj myfailedpackage package



