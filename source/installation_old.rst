Installation, the old school way (obsolete & unmaintained)
###########################################################

Variables
==========

    - ``$prefix``: root of minitage
    - ``$ins``: root of a project inside minitage


Buildout Configuration
===========================
**To store all downloaded stuff in the same place**, you ll need to set buildout to do so.

    .. code-block:: sh

        mkdir -p ~/.buildout/downloads
        cat << EOF > ~/.buildout/default.cfg
        [buildout]
        download-directory = $HOME/.buildout/downloads
        download-cache = $HOME/.buildout/downloads
        EOF

Installing minitage
=====================

A stable version
---------------------

    Minitage is a classical python egg, you can get it throught easy_install (DISTRIBUTE).

    To install minitage in a stable version, follow those steps:

    - !!!  *PIP* IS NOT SUPPORTED !!!
    - Install minitage

        .. code-block:: sh

            source $prefix/bin/activate
            easy_install -U minitage.core

    - Sync its packages (all its minilays in minitage terminology).

      **This will initiate also all the minitage directories for the first run.**

        .. code-block:: sh

            source $prefix/bin/activate
            minimerge -s

Using minitage
---------------------

Those are usage samples... You have not to run that if you do not need to ;)

Install python-xxx
----------------------

    .. code-block:: sh

            source $prefix/bin/activate
            minimerge python-xxx

Install a custom minilay
-------------------------

    .. code-block:: sh

        # get the project minilay
        # minitage is aware of the MINILAYS environnment variable, you can use it to specify space separated minlays
        scm CHECKOUT  https://subversion.foo.net/YOURPROJECT/minilay/trunk $prefix/minilays/YOURPROJECTMINILAY

Deploy a project with minitage
-------------------------------

    .. code-block:: sh

        # get the project minilay
        # minitage is aware of the MINILAYS environnment variable, you can use it to specify space separated minlays
        scm CHECKOUT  https://subversion.foo.net/YOURPROJECT/minilay/trunk $prefix/minilays/YOURPROJECTMINILAY
        # minimerging it
        source $prefix/bin/activate
        minimerge project

Extra options and usage
------------------------------

    .. code-block:: sh

        source $prefix/bin/activate
        minimerge  --help
