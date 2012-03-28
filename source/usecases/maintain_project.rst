Porting an exising buildout based project to be a good minitage citizen
============================================================================

Althought you are not obliged to use minitage features, we would recommend to follow the next steps

    * Best practise is to make an extendend minitage.cfg configuration file which include the minitage environment.
      You will make a python section pointing to the minitage python installation choosen, add also no eggified packages

::

    [minitage]
    location=${buildout:directory}/../..
    [libxslt]
    # the path to find the libxslt python bindings, maybe your global site-packages?
    site-packages=${minitage:location}/eggs/py-libxslt-1.1/parts/site-packages-2.6

    [python2.6]
    executable=${buildout:directory}/../../dependencies/python-2.6/parts/part/bin/python
    python=python2.6
    name=python2.6

    [buildout]
    extensions+=buildout.minitagificator
    eggs-directory=${minitage:location}/eggs/cache
    [zopepy]
    extra-paths+=
        ${libxml2:site-packages}
        ${libxslt:site-packages}

    [someeggpart]
    recipe = minitage.recipe.scripts | zc.recipe.egg
    python = python2.6


Some important things to note in this configuration:

        * Use the common egg cache to drop your built eggs::

                [buildout]
                eggs-directory=${buildout:directory}/../../eggs/cache

        * Replace recipes with minitage ones if the equivalent exists with buildout.minitagificator

            * ``zc.recipe.egg``, ``zc.recipe.egg:scripts`` -> ``minitage.recipe:scripts``
            * ``something:cmmi`` -> ``minitage.recipe.cmmi``

        * Read http://pypi.python.org/pypi/minitage.recipe to understand what do the recipes

    * Make a minibuild pointing to your project::

        [minibuild]
        dependencies=openssl-1 libxml2-2.6 libxslt-1.1 zlib-1.2  py-libxml2-2.6 py-libxslt-1.1 python-2.6 ...
        install_method=buildout
        src_uri=http://hg.foo.net
        src_type=hg
        category=zope
        homepage=http://foo.net
        description=something

    * Version the whole and letz go. (see :ref:`versioning_project`).

