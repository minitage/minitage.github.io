Zope Projects
###############

Purpose
=======

Creating zope projects using buildout and minitage

The minitage category is ``zope``.

Templates
=============
Now, the supported way to create minitage based projects is to use paster from
`PasteScripts` which will construct you a base layout for your project after you have answered to some questions:

    - A minilay
    - A minibuild pointing to the template (inside the minilay)
    - A buildout based project.


For zope projects, those templates are available:
    - `minitage.zope3`  : A zope3 project

        - The zope3 installed is a totally eggyfied installation.

    - `minitage.plone31`   : A plone 3x project
    - `minitage.plone31zeo`   : A plone 3x project with a backend zeo server


    - `minitage;plone25` : A plone 25 project

For example::

    # create a plone31 vith zeo project
    easy_install -U minitage.env
    paster create -t minitage.plone31zeo myproject

    # create a zope3 project
    paster create -t minitage.zope3 myproject



Playing with the buildout.cfg
================================

ExtraPythonPath / Eggs to add to the python path
-------------------------------------------------

You can play with the ``${project:extra-paths}``  to add PATHS in the PYTHONPATH at run time.
It will generate the appriopriate ``bin/zopepy`` and ``bin/instance`` files according to those variable.
``${project:eggs}`` and ``${project:develop-eggs}`` can be used to reference eggs too.

Do not make egg parts there if they need special stuff. Do them in a special egg buildout.

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

Sometimes you need to be dirty and to apply patches somewhere in parts/ or elsewhere.
To achieve that, you can use the iw.recipe.command to execute shells commands and invoke the patch binary to apply a patch.

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

            [project]
            parts =
                ...
                ${parts:patchs}
            ...
            [parts]
            ...
            patchss =
                patch-money
            ...
            [patch-money]
            recipe = iw.recipe.cmd
            on_install=true
            cmds=
                patch -p0 ${plone:location}/Products/somefile.py < ${buildout:directory}/patchs/patch.diff 2>&1 >> /dev/null


Using it
==========

Using the zope3 instance
-------------------------

Launching it::

    $ cd minitage/zope/yourinstance/ && bin/yourproject-ctl fg

Using the plonexx instance
----------------------------

Launching it::

    $ cd minitage/zope/yourinstance/ && bin/instance fg


