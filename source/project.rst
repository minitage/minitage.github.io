=======
Project
=======
The steps
=========

The steps for minitaging a project are:

    * Create the 'layout' part of the project.
    * Create a minibuild which points to this layout.

Begin a new project with paster and minitage
==============================================

paster
-----------------------
    - paster from http://pypi.python.org/pypi/PasteScript/ will assist you in your project creation.
    - Just answer to a bunch of question and it will generate a layout saving you from a lot of edit time.

Basicly it will create the following things:

 - A project layout
 - A minilay
 - A minibuild (inside the previous minilay) which points to the project layout.


create the project layout
-------------------------

.. sourcecode:: sh

    easy_install minitage.paste
    paster create -t minitage.XXXXXX myproject
    ... answer the question
    ... files will be created according to the answers.

What project template to choose?
----------------------------------

    - for libraries and applications, use ``minitage.dependencies``
    - for "pur-python" eggs, use ``minitage.eggs``
    - for distutils stuff, use ``minitage.du``
    - for plone25 instances, use ``minitage.plone25``
    - for plone31 instances, use ``minitage.plone31``
    - for zope3 instances, use ``minitage.zope3``
    - for django instances, use ``minitage.django``
    - for geodjango instances, use ``minitage.geodjango``

NOTE : minitage.dependencies/minitage.eggs/minitage.du are not yet written

