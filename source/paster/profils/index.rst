Minitage and profils
***********************
Abstract
-----------
- Minitage profils are the way to integrate applications in minitage projects or simply generate convenient templates with less efforts.

- The goal is to make boilerplate to facilitate the use of prefixed applications or the intialization of databases instances to ease the admins job.

- The main thing is to simulate a subsystem is a subdirectory ``/sys`` of a project, or creating an instance of something, ``./somewhere``.

- The optionnal minitage support is mostly recent for all templates and can lead to bugs, please report them.

Basic layout
-------------
::

    /bin
        instancename.binary
    /etc/
        /logrotate.d
        /init.d
        /cron.d
    /var/
        /var/data
        /var/run
        /var/log


A postgresql example::

    /bin
        MyDatabase.psql
    /etc/
        /logrotate.d
            MyDatabase.logrotate
        /init.d
            MyDatabase.postgresql
        /cron.d
            MyDatabase.cron
    /var/
        /var/data
            MyDatabase/
        /var/run
            MyDatabase.pid
        /var/log
            postgresql/
                MyDatabase.log

Listing the available profils
-------------------------------
::

    $mt/bin/paster create --list-templates | grep minitage | grep profils

Installing a profil
---------------------
The profils are just specialized paster templates so you just have to apply a template to a project.

There are too ways to use one profil, inside or without minitage, just by **anssering yes or no** to the minitage presence question.

Examples:

    We will apply the 'minitage.env' profil to 'myproject'

    * inside minitage::

        paster create -t minitage.profils.env myproject inside_minitage=yes
        Will produce: $mt/categ/project/myproject/sys/share/minitage/minitage.env

    * without minitage::

        paster create -t minitage.profils.env myproject inside_minitage=no
        Will produce: myproject/share/minitage/minitage.env

Available profils
*******************
.. toctree::
    :maxdepth: 3

    profils

