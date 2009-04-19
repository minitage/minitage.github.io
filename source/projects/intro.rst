Introduction
****************

The steps
=========

The steps for minitaging a project are:

    * Create the project itself and package it to be 'minitage compliant'
      (uploading, versionining)
    * Create a minibuild which points to this layout.

Begin a new project with paster and minitage
==============================================

paster
-----------------------
    - paster from http://pypi.python.org/pypi/PasteScript/ will assist you in your project creation.
      If you do not have installed minitage.paste (PasteScript is a dependency, it would be installed when you install minitage.paste), do it now::

        easy_install -U minitage.paste

    - Just answer to a bunch of question and it will generate a layout saving you from a lot of edit time.

Basicly it will create the following things:

 - A project layout
 - A minilay containing:

     - minibuild(s) (inside the previous minilay) which points to the project layout.


create the project layout
-------------------------

.. sourcecode:: sh

    easy_install -U minitage.paste
    paster create -t minitage.XXX myproject
    ... answer the question
    ... files will be created according to the answers.

What project template to choose?
----------------------------------

    - for libraries and applications, use `minitage.dependency`
    - for "pur-python" eggs, use `minitage.egg`
    - `Zope projects <minitagezope>`
      Some specifics layouts based on zope:

        - for plone25 instances, use `minitage.plone25`
        - for plone3 instances, use `minitage.plone3`

    - for zope3 instances, use `minitage.zope3`
    - for django instances, use `minitage.django <minitagedjango>`
    - for Pylons instances, use :ref:`minitage.tg <minitagepylons>`.

