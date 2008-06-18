====================
Dependency project
====================

Purpose
=======

How to package a system dependency which is not python related software (not installed with distutils or setuptools) in minitage.
The minitage category is "dependencies".

Layout
=======
You must install into minitage/dependencies/dependencyName/parts/part

Sample Layout
=============
You can use this sample throught paster::

    easy_install minitage.paste
    paster create -t minitage.dependency dependencyName


The minitage.recipe:cmmi recipe
================================
The command just installed a project based on the ``minitage.recipe:cmmi`` recipe.

This one is likely to do:
    - pre-configure-hook
    - ./configure
    - pre-make-hook
    - make
    - pre-make-hook
    - make install
    - post-install-hook 
    

Hooks just point to python callables to do boilerplate that the classical
./configure && make && make install can not do.

You can set a lot of options to fine control the build process.

To know them, just create a project with paster and edit the generated buildout.cfg.

Under the hood
===============
Minitage as a package manager will give you some means to refer to the dependencies.

At build time:

for all the minibuild dependency:
    - it adds all binaries inside the path
    - it registers the ``includes`` directories to the CFLAGS varible
    - it registers the ``libraries`` directories to the LDFLAGS and LD_LIBRARY_PATH and LD_RUN_PATH variable
    - it registers the ``libraries/pkgconfig`` directories to the PKGCONFIGPATH
    - it registers the disutils stuff inside the PYTHONPATH


