Porting an exising buildout based project to be a good minitage citizen
============================================================================

Althought you are not obliged to use minitage features, we would recommend to follow the next steps

    * make a python section pointing to the minitage python installation choosen::

            [python]
            executable = ${buildout:directory}/../../dependencies/python-X.XX/parts/part/bin/python

            [buildout]
            python=python

    * Use the common egg cache to drop your built eggs::

            [buildout]
            eggs-directory=${buildout:directory}/../../eggs/cache

    * Replace recipes with minitage ones if the equivalent exists

        * ``zc.recipe.egg``, ``zc.recipe.egg:scripts`` -> ``minitage.recipe:scripts``
        * ``something:cmmi`` -> ``minitage.recipe.cmmi``

    * Read http://pypi.python.org/pypi/minitage.recipe to understand what do the recipes

    * Make a minibuild pointing to your project::

        [minibuild]
        dependencies=openssl-0.9 libxml2-2.6 libxslt-1.1 zlib-1.2  py-libxml2-2.6 py-libxslt-1.1 python-2.4 ...
        install_method=buildout
        src_uri=http://hg.foo.net
        src_type=hg
        category=zope
        homepage=http://foo.net
        description= a plone 3.1 buildout for plony

    * Version the whole and letz go. (see :ref:`versioning_project`).

