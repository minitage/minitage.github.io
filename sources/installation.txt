Installation
##################################################

Prerequisite
==============
Please see :ref:`mininsprerequisites`

The minitagetool
=================
Minitage can be hard to use for non developers, so we made a script **minitagetool.sh** to help working with minitage.

This script will initially:

    - Configures buildout correctly to indicate cache & downloads cache
    - Compile & install a python
    - Install minitage (from source, no eggs)
    - Install minitage base packages
    - Install your project

After, you can:

    - Launch `CGWB <https://pypi.python.org/pypi/collective.generic.webbuilder>`_
    - Can make a snapshot (usable offline) of:

        - The minitage installation
        - Downloads
        - Projects

    - Can redeploy those snapshots elsewhere
    - Upgrade the minitage installation

- **WARNING**: it touches ~/.buildout/default.cfg to set the local download cache

Installing minitage
====================
Create the minitage root::

    mkdir minitage

You need to be online to use the next commands.

Installing minitage tool
-------------------------
Inside the minitage **top level directory**

.. code-block:: sh

    cd minitage
    wget -O minitagetool.sh https://raw.github.com/minitage/minitage.shell/master/minitagetool.sh
    chmod +x minitagetool.sh
    ./minitagetool.sh deploy # take a coffee...

Upgrading from non-minitagetool minitage installation
---------------------------------------------------------
Just run the install instructions,
they will bootstrap and conserve all that can be done.


