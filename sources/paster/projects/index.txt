Minitage and projects templates
************************************
paster is your friend
-----------------------
- paster from  `PasteScripts`_ will assist you in your project creation.
  If you do not have installed minitage.paste (PasteScript is a dependency,
  it would be installed when you install minitage.paste), do it now::

    $mt/bin/easy_install -U minitage.paste

.. _`PasteScripts`: http://pypi.python.org/pypi/PasteScript/

- Just answer to a bunch of question and it will generate a layout saving you from a lot of edit time.
- minitage is optionnal, you can use the templates without.

Basicly it will create the following things:

- A project layout
- If you choosed to answer yes to ``"are you inside a minitage"``, a minilay containing:

    - minibuild(s) (inside the previous minilay) which points to the project layout.

Listing the available templates
----------------------------------
::

    $mt/bin/paster create --list-templates | grep minitage | grep -v instances

Generating a minitage project from a paster template
--------------------------------------------------------
The projects are just specialized paster templates so you just have to apply a template to a project.

There are two ways to use one project, insde or outside minitage, just by answering  **yes** or **no** to the minitage presence question.

For example, we will use the 'minitage.plone3' project to generate a base for **'myproject'**

    * inside minitage::

        $mt/bin/paster create -t minitage.plone3 myproject inside_minitage=yes
        # then look in $mt/categ/project and $mt/minilays/project

    * without minitage::

        paster create -t minitage.plone3 myproject inside_minitage=no
        # then look in ./project

Available projects
********************
.. toctree::
    :maxdepth: 2

    packaging_projects
    model_projects

