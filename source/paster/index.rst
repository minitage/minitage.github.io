.. _minitageprojects:

Minitage and paster templates: projects & instances
####################################################

* minitage relies heavilly on paster templates to quickstart a layout from defined scafolds.
* There are many kind of templates you can use right now, and an infinty of possibilities to extend them.
  Just take your time to appreciate the next sections which will present you in details the available options.


Two kinds of templates
==========================

-**projects**:

    Something that will go inside ``<minitage>/categ/name``
    A minibase project

-**instances**:

    Something that will go inside ``<minitage>/categ/name/sys``
    A minibase project sub tool like a database, or an environment file

paster is your friend, cgwb you master
=========================================
- paster from  `PasteScripts`_ will assist you to generate your **instances**
- `CGWB`_, a web frontend to generate a project tarball to generate your **projects**

We do not use paster anymore for **projects** because of the number of answers to get input from.

.. _`PasteScripts`: http://pypi.python.org/pypi/PasteScript/
.. _`cgwb`: http://pypi.python.org/pypi/collective.generic.webbuilder/

Projects
============
.. toctree::
    :maxdepth: 2

    projects/index

Instances
============
.. toctree::
    :maxdepth: 2

    instances/index

