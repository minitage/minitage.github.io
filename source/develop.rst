Develop
#########

Tools for developers
=====================

    * We live on  `git repositories`_. If you need commit access, it will be over ssh and you ll need to ask kiorky for an account.
    * Bug tracking system is hosted on our Trac_
    * We also have a gitweb_.
    * We host the eggs on `Pypi package index`_

        - http://pypi.python.org/pypi/minitage.core
        - http://pypi.python.org/pypi/minitage.paste
        - http://pypi.python.org/pypi/minitage.recipe


.. _`git repositories`: https://git.minitage.org
.. _gitweb: https://gitweb.minitage.org
.. _Trac: https://www.minitage.org/trac
.. _`Pypi package index`:  http://pypi.python.org

Installing the development version of minitage
==================================================
If you want to be bleeding edge and not have a 3 years old debianised
minitage. You can give a try to the egg in development mode.
Be aware that you must know what you are doing there !

    - If you need to, fire your virtualenv

        .. code-block:: sh

            source $prefix/bin/activate

    - Get the sources

        .. code-block:: sh

            mkdir -p ~/repos/minitage
            cd ~/repos/minitage
            git clone http://git.minitage.org/git/minitage/eggs/minitage.recipe/
            git clone http://git.minitage.org/git/minitage/eggs/minitage.core/
            git clone http://git.minitage.org/git/minitage/eggs/minitage.paste/
            git clone http://git.minitage.org/git/minitage/eggs/buildout.minitagificator

    - Install/Reinstall minitage in develop mode

        .. code-block:: sh

            source $prefix/bin/activate
            cd ~/repos/minitage/minitage.core
            python setup.py develop
            cd ~/repos/minitage/minitage.recipe
            python setup.py develop
            cd ~/repos/minitage/minitage.paste
            python setup.py develop
            cd ~/repos/minitage/buildout.minitagificator
            python setup.py develop

    - Sync its packages (all its minilays in minitage vocabulary).

      **This will initiate also all the minitage directories for the first run.**

        .. code-block:: sh

            source $prefix/bin/activate
            minimerge -s

