=======
Project
=======
The steps
=========

The steps for minitaging a project are:

    * Create the 'layout' part of the project.
    * Create a minibuild which points to this layout.

Begin a new project with buildout and minitage
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

    - for libraries and applications, make a ``minitage.dependencies`` one
    - for "pur-python" eggs, make an ``minitage.eggs`` one
    - for distutils stuff, make an ``minitage.du`` one
    - for plone25 instances make an ``minitage.plone25`` one
    - for plone31 instances make an ``minitage.plone31`` one
    - for zope3 instances make an ``minitage.zope3`` one
    - for django instances make an ``minitage.django`` one
    - for geodjango instances make an ``minitage.geodjango`` one

NOTE : minitage.dependencies/minitage.eggs/minitage.du are not yet written

