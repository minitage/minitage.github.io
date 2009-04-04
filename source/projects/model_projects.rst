.. _minitagezope:

Zope Projects
***************

Available templates
===================

.. _minitageplone25:

Plone 2.5
----------
    - template : `minitage.plone25`
    - minitage category : `zope`
    - template initialization and project start::

         paster create -t minitage.plone25 myproject
         cd /minitage/zope/myproject/ && bin/instance restart

.. _minitageplone31:

Plone 3.1
----------
    - template : `minitage.plone31`
    - minitage category : `zope`
    - template initialization and project start::

         paster create -t minitage.plone31 myproject
         cd /minitage/zope/myproject/ && bin/instance restart

.. _minitageplone31zeo:

Plone 3.1 with ZEO
-------------------
    - template : `minitage.plone31zeo`
    - minitage category : `zope`
    - template initialization and project start::

         paster create -t minitage.plone31zeo myproject
         cd /minitage/zope/myproject/ && bin/instance restart

.. _minitagezope3:

Zope 3
-------
    - template : `minitage.zope3`
    - minitage category : `zope`
    - template initialization and project start::

         paster create -t minitage.zope3 myproject
         cd /minitage/zope/myproject/ && bin/myproject-ctl restart

Integration with zc.buildout
==============================

PythonPath / Eggs
------------------
    - You can play with the ``${project:extra-paths}``  to add PATHS in the PYTHONPATH at run time.
      It will generate the appriopriate ``bin/zopepy`` and ``bin/instance`` files according to those variable.
    - ``${project:eggs}`` and ``${project:develop-eggs}`` can be used to reference eggs too.

Do not make egg parts there if they need special stuff. Do them in a special :ref:`egg minitage-buildout <eggproject>`.

.. sourcecode:: ini

    [project]
    extra-path=${numpy:site-packages} ${pycairo:site-packages}
    eggs = foo
    develop-eggs=bar
    develop = src/bar
    [numpy]
    site-packages=${project:du-directory}/numpy-1.0.4/site-packages-2.4
    [pycairo]
    site-packages=${project:du-directory}/pycairo-1.4.12/site-packages-2.4


External thirdparty "special" products to add to the instance
-------------------------------------------------------------

You will need to update the ``${project:products}`` variable.
Use this recipe : http://pypi.python.org/pypi/plone.recipe.bundlecheckout/
Example:

.. sourcecode:: ini

    [plomino]
    recipe = plone.recipe.bundlecheckout
    url = https://plomino.svn.sourceforge.net/svnroot/plomino/trunk/CMFPlomino/
    subfolder=CMFPlomino
    [project]
    products =
       ${buildout:directory}/parts/plomino

Developpement products
----------------------

Place them in $bd/Products with svn:externals set on $bd/Products for example

Official products
-----------------

Add the url to the ${project:urls} variable. You can use one mirror from the ${mirrors} parts

Production mode
---------------

    * disable the ${project:debug} variable (set to off).*
    * Un comment the effective-user and set it in [instance]


Add versionned Thirdparty Zope Products
---------------------------------------

    * Distributed products (available as an archive).

    Use this recipe : http://pypi.python.org/pypi/plone.recipe.distros/

.. sourcecode:: ini

   [clouseau]
   recipe=plone.recipe.distros
   urls=http://plone.org/products/clouseau/releases/0.8.1/clouseau-0-8-1.zip

Patchs
------

*It's not for eggs patches. If you want to patch one egg, just use the minitage.recipe:egg and its patching facility!!!*

Sometimes you need to be dirty and to apply patches somewhere in parts/ or elsewhere.
To achieve that, you can use the ``iw.recipe.command`` recipe to execute shells commands and invoke the patch binary to apply a patch.

    #. Get a clean patch with clean paths declared in the header. The best is to have the same tree between the old and the new file.
       Please note that the Source Controls programs can generate clean diffs  for you. So, if your source is versionned or if you can grab
       the tag of a thirdparty product, it would be great.
       Exemples:

       * GOOD::

           $ cat patch.diff
           --- old/LanguageTool.py 2008-02-21 14:54:58.000000000 +0100
           +++ new/LanguageTool.py 2008-02-21 14:55:15.000000000 +0100

       * BAD::

           $ cat patch.diff
           --- old/LanguageTool.py 2008-02-21 14:54:58.000000000 +0100
           +++ ../path/i/was/dreaming/i/had/a/lot/of/money/new/LanguageTool.py 2008-02-21 14:55:15.000000000 +0

    #. Create a dedicated directory to put patchs in. Maybe $bd/patchs or put in your patch if the directory allready exists
       Now, you have something like that::

        $bd/
           buildout.cfg
           patchs/
                patch.diff


    #. Write the part in the buildout with something like that:

        * Add a subpart collection named "patchs" if not present and reference your patch part in it
        * Add your patch part
        * Call the patchs subpart in the project header if not allready done. (last part, ALLWAYS)

        Exemple:

        .. sourcecode:: ini

            [buildout]
            parts =
                ...
                patch-money
            ...
            [patch-money]
            recipe = iw.recipe.cmd
            on_install=true
            cmds=
                patch -p0 ${plone:location}/Products/somefile.py < ${buildout:directory}/patchs/patch.diff


.. _minitagetg:

Turbogears Projects
********************

    - Turbogears basic eggs needs some specific Turbogears stuff at build time.
      So we will need to install our template in two steps to allow the use of buildout with those needs.
    - template : `minitage.tg`
    - minitage category : `tg`
    - template initialization::

        paster create -t minitage.tg foo
            # Answer questions


    - Create and activate the environment helper::

        paster create -t minitage.env foo
        source ~/minitage/tg/foo/sys/share/minitage/minitage.env

    - minimerging your project::

        minimerge foo

    - running the post-installation script::

        bin/tgpostinstall

    - After that, do not use anymore `bin/buildout` but use instead::

        bin/tgbuildout

    -  You can also launch your brand new Turbogears project::

        bin/tg-admin sql create
        bin/start-foo


    - Or use tg-admin::

        bin/tg-admin --help


    - The code of your project is in ::

        src/foo

.. _minitagepylons:

Pylons projects
*****************

   - template : `minitage.pylons`
   - minitage category : `pylons`
   - template initialization::

         paster create -t minitage.pylons myproject

    - It will generate an egg in develop mode into::

        $mt/pylons/myproject/src/myproject

    - Under the hood, it just uses **paster create -t pylons**. This comes from
      Pylons itself.
    - to start your project::

        mt/pylons/myproject/bin/paster serve mt/pylons/myproject/src/myproject/development.ini

   - Dont forget to keep the egg into version control.

.. _minitagedjango:

django projects
****************

   - templates :

    - `minitage.django`  : A django project

   - minitage category : `django`
   - template initialization::

         paster create -t minitage.django myproject

   - Django work out of the box after a checkout, so the buildout will be very simple.

    - We just need a recipe that knows how to checkout
    - And we will use recipes to generate scripts and interpreters with good python path
    - So read the generated buildout.cfg, it does all that stuff.

    The project will look like::

       app/ the code
       templates/ : django templates
       media/ : js, image and static stuff
       share/ : misc, doc and etc.

