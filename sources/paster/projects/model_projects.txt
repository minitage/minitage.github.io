.. _minitagezope:

Plone x
=============
- templates :
    - **minitage.plone3**
    - **minitage.plone4**
    - **minitage.plone41**
    - **minitage.plone42**
    - **minitage.plone43**

- minitage category : **zope**
- Features:

    * A buildout for development mode with additionnal tools for debugging your application
    * A buildout for production (crons, backups, supervisor, load balancing, apache & nginx support)
    * Myriad of products & additionnal tools support

Pyramid projects
===========================
- template : **minitage.pyramid**
- minitage category : **pyramid**
- template initialization and starting your project::

     $mt/bin/paster create -t minitage.django myproject
     $mt/categ/project/bin/paster serve $mt/categ/project/etc/CONFIG.ini
     # or
     $mt/categ/project/bin/project_manage runserver # may God kill you :)

Django projects
===========================
- template : **minitage.django**
- minitage category : **django**
- We provide paste configuration files to launch your application in a WSGI envrionnement, *please stop using runserver*!
- template initialization and starting your project::

     $mt/bin/paster create -t minitage.django myproject
     $mt/categ/project/bin/paster serve $mt/categ/project/etc/CONFIG.ini
     # or
     $mt/categ/project/bin/project_manage runserver # may God kill you :)

.. _`dj.paste`: http://pypi.python.org/pypi/dj.paste
.. _`mr.developer`: http://pypi.python.org/pypi/mr.developer

