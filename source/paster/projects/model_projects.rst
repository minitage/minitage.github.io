.. _minitagezope:

.. _minitageplone25:

Plone 2.5
============
- template : **minitage.plone25**
- minitage category : **zope**
- This template is simple and just there for posterity, Plone 25 is old and deprecated !
- template initialization and project start::

     paster create -t minitage.plone25 myproject
     cd /minitage/zope/myproject/ && bin/instance restart

.. _minitagezope2:

Zope2
============
- template : **minitage.zope2**
- minitage category : **zope**
- template initialization and starting your project::

     paster create -t minitage.zope2 myproject
     cd /minitage/zope/myproject/ && bin/instance restart

.. _minitageplone3:

Plone 3
=============
- template : **minitage.plone3**
- minitage category : **zope**
- Features:

    * A buildout for development mode with additionnal tools for debugging your application, IDE integration and DEBUG mode enabled.
    * A buildout for production
    * Paster configurations files to launch your Plone using WSGI
    * Support forZODB, RelStorage, ZEO
    * You can configure on the fly eggs, zcml and additionnal products

- Layout additional infos:

    * /minilay/project/::

        project, project-dev # minibuilds for installing your project in production or develop mode

    * /category/project/etc/::

        [dev|prod].ini # Paste configuration files
        relstorage.cfg, zeo.cfg, zodb.cfg # buildout specific configuration files
        versions.cfg # Plone KGS

    * /category/project/::

            buildout.cfg # buildout for production
            dev.cfg # buildout for development (extends buildout.cfg)

- Introduction to some generated binaries in bin/:

    - **bin/ipython**: an interactive IPython shell with your project environment inside
    - **bin/zopepy**: an interactive Python shell with your project environment inside
    - **bin/paster**: The paster script to use for having the right PYTHONPATH
    - **bin/develop**: see `mr.developer`_ documentation
    - **bin/zeoserver**: Zdaemon controler for the zeoserver if any

- template initialization and starting your project::

     paster create -t minitage.plone31 myproject
     cd /minitage/zope/myproject/ && bin/instance start|fg
     bin/paster serve etc/CONFIG.ini # alternative for WSGI mode

.. _minitagezope3:

Zope 3
=============
- template : **minitage.zope3**
- minitage category : **zope**
- Features

    * Support for sob, relstorage and zeo mode
    * Support for wsgi
    * Support production and developement modes at the same time
    * Intuitive configuration files editing and regenration with buildout to
      make them portables (zdaemon.conf.in zope.conf.in).

- Layout additional infos:

    * /category/project/zcml::

         apidoc.zcml, site.zcml_tmpl # ZCML files

    * /category/project/etc::

        dev.ini, prod.ini # WSGI configuration files
        prod.zdaemon.conf.in # zdaemon.conf buildout template for production
        prod.zope.conf.in # zope.conf buildout template for production
        versions.cfg # KGS file
        zeo.conf.in # zeo.conf buildout template
        zdaemon.conf.in # zdaemon.conf buildout template for dev mode
        zope.conf.in # zope.conf buildout template for dev mode
        zeoserver.sh.in # zeo launcher template

- Introduction to some generated binaries in bin/:

    - **bin/ipython**: an interactive IPython shell with your project environment inside
    - **bin/zopepy**: an interactive Python shell with your project environment inside
    - **bin/paster**: The paster script to use for having the right PYTHONPATH
    - **bin/develop**: see `mr.developer`_ documentation
    - **bin/z3-ctl**: Zdaemon controller for production WSGI configuration
    - **bin/z3-dev**: Zdaemon controller for developement WSGI configuration
    - **bin/z3-app**: call your application in debug mode
    - **bin/zeoserver**: Zdaemon controler for the zeoserver if any


- Another note on ZDaemon, it can be used as a init script for your application,
  althought, you can use directly paster. Another way to make your application
  "initd compliant" is to use the ``minitage.paste-initd`` profile.

- You can regenerate the \*.conf after editing the ``.in`` ine ``etc/``::

      bin/buildout install [basename of config.file]
      eg:
        vim etc/zeo.conf.in # be careful, emacs is dangerous for your fingers health
        bin/buidout install zeo.conf

- The Spawning ultra perforamnt WSGI server is only available with ZEO or RelStorage because of
  its multithreading design.

- template initialization and starting your project::

     paster create -t minitage.zope3 myproject
     cd /minitage/zope/myproject/ && bin/myproject-ctl restart

.. _minitagepylons:

Pylons projects
=======================

- template : **minitage.pylons**
- minitage category : **pylons**
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


Django projects
===========================

- template : **minitage.django**
- minitage category : **django**
- We lauch django-admin startproject as a postinstall step to quickstart
  your project.
- We also create an egg for the sake of well-done packaging from start to end.
- **GeoDjango support**, just answer **yes** to GIS support
- We provide paste configuration files to launch your application in a WSGI envrionnement, *please stop using runserver*!

    -  It's done through `dj.paste`_ integration with the generated egg.

- Layout additional infos:

    * etc/ ::

        [dev|prod].ini # Paste configuration files

    * src/yourproject/ ::

        Your project egg directory

    * bin/::

        paster # the paster script to starting your project
        yourproject* # Various wrappers to classical django utilities

    * /category/project/::

            buildout.cfg # buildout for customizing and deploying your project

    * /category/project/::

            buildout.cfg # buildout for customizing and deploying your project

- template initialization and starting your project::

     $mt/bin/paster create -t minitage.django myproject
     $mt/categ/project/bin/paster serve etc/CONFIG.ini
     # or
     $mt/categ/project/bin/project_manage runserver # may God kill you :)

.. _`dj.paste`: http://pypi.python.org/pypi/dj.paste
.. _`mr.developer`: http://pypi.python.org/pypi/mr.developer

