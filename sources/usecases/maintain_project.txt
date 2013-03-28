minitagify an existing project or create a new empty minitage project
=============================================================================================
You can use the minitagify helper to generate some configs making automaticly:


    - wrappers to all buildouts in the top directory to wrap minitage environment
    - a minilay with minibuilds pointing to those wrappers


This will help you integrating minitage !

If you project layout is something like::

    .
    ├── base.cfg
    ├── buildout.cfg
    ├── otherbuildout.cfg
    └── foo
        └── bar

You want it to be installed a a zope project, do the following::

    cd ~/minitage
    . bin/activate
    mkdir -p zope
    SCM clone URL zope/yourproject
    minitagify -d zope/yourproject
     Wraping /minitage/zope/foo/otherbuildout.cfg (minitage27.cfg) in /minitage/zope/foo/minitage.otherbuildout.cfg->/minitage/zope/foo/.minitagecfg/otherbuildout.cfg
     Wraping /minitage/zope/foo/buildout.cfg (minitage27.cfg) in /minitage/zope/foo/minitage.buildout.cfg->/minitage/zope/foo/.minitagecfg/buildout.cfg
     Wraping /minitage/zope/foo/base.cfg (minitage27.cfg) in /minitage/zope/foo/minitage.base.cfg->/minitage/zope/foo/.minitagecfg/base.cfg
     Wroted minibuild foo-base in /minitage/minilays/0-foo_8c3b59e78bfffa92309ff5bf96b21f88/foo-base
     Wroted minibuild foo-otherbuildout in /minitage/minilays/0-foo_8c3b59e78bfffa92309ff5bf96b21f88/foo-otherbuildout
     Wroted minibuild foo-buildout in /minitage/minilays/0-foo_8c3b59e78bfffa92309ff5bf96b21f88/foo-buildout
     Wroted minibuild foo in /minitage/minilays/0-foo_8c3b59e78bfffa92309ff5bf96b21f88/foo
     Installed minilay /minitage/zope/zope/foo/.minitagecfg/0-foo_8c3b59e78bfffa92309ff5bf96b21f88 by symlink: /minitage/minilays/0-foo_8c3b59e78bfffa92309ff5bf96b21f8

You can then add the generated **.minitagecfg** folder to your SCM::

    git add .minitagecfg


The content of **.minitagecfg** explained::

    .minitagecfg/
    ├── 0-foo_8c3b59e78bfffa92309ff5bf96b21f88 -> the minilay
    │   ├── foo
    │   ├── foo-base
    │   ├── foo-buildout
    │   └── foo-otherbuildout
    ├── base.cfg -> wrapper to base
    ├── b.sh
    ├── buildout.cfg -> wrapper to base 
    ├── minitage26.cfg -> wrapper to use py26
    ├── minitage27.cfg -> wrapper to use py27
    ├── minitage.cfg -> minitage integration base variables
    └── otherbuildout.cf -> wrapper to otherbuildout.cfg


You will then have to use:

    - minitage.base.cfg for base.cfg
    - minitage.buildout.cfg for buildout.cfg
    - minitage.otherbuildout.cfg for otherbuildout.cfg

like::

    cd zope/yourproject
    python bootstrap.py
    bin/buildout -vvvvvvvNc minitage.buildout.cfg
    bin/buildout -vvvvvvvNc minitage.otherbuildout.cfg

If no buildouts are present it will generate a base plone addon (**plonetest**) buildout infratructure

Porting **MANUALLY** a buildout based project
====================================================================================

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


    * Replace recipes with minitage ones if the equivalent exists with ``buildout.minitagificator``

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


