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

    - The project will look like

        * etc/[dev|prod].ini
          Paste configuration files
        * src/yourpoejct
          Your project
        * bin/paster
          the paster script to start your project
        * bin/yourproject*
          Various wrappers to classical django utilities

.. _minitageplone3:

Plone 3
----------
    - template : `minitage.plone3`
    - minitage category : `zope`
    - template initialization and project start::

         paster create -t minitage.plone31 myproject
         cd /minitage/zope/myproject/ && bin/instance restart


.. _minitagezope3:

Zope 3
-------
    - template : `minitage.zope3`
    - minitage category : `zope`
    - template initialization and project start::

         paster create -t minitage.zope3 myproject
         cd /minitage/zope/myproject/ && bin/myproject-ctl restart

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

    - We lauch django-admin startproject as a postinstall step to quickstart
      your project.
    - We also create an egg from the previous quickstart to enlight packaging
    - We profide paste configuration files to launch your application in a WSGI envrionnement
    - Its done by the integration of dj.paste with the buildout.

    - The project will look like

        * etc/[dev|prod].ini
          Paste configuration files
        * src/yourpoejct
          Your project
        * bin/paster
          the paster script to start your project
        * bin/yourproject*
          Various wrappers to classical django utilities

