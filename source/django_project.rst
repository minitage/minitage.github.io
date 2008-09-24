Django Projects
#################

Purpose
=======

Creating a django project using buildout and minitage
The minitage category is ``django``.

Template
========
Now, the supported way to create minitage based projects is to use paster from
`PasteScripts` which will construct you a base layout for your project after you have answered to some questions:

    - A minilay
    - A minibuild pointing to the template (inside the minilay)
    - A buildout based project.


For django projects, those templates are available:
    - `minitage.django`  : A django project
    - `minitage.geodjango`   : A geodjango project based on the GIS branche

Django
======
 * Django work out of the box after a checkout, so the buildout will be very simple.
   - We just need a recipe that knows how to checkout
   - We need too to patch it to generate a versionned egg.
   - So read the generated buildout.cfg, it does all that stuff.


Django based Project's Layout
=============================
The project will look like
--------------------------
   - app/ the code
   - templates/ : django templates
   - media/ : js, image and static stuff
   - share/ : misc, doc and etc.

