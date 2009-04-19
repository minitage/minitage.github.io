
Introduction
*************

- Minitage profils are the way to integrate applications in minitage projects or simply generate convenient templates with less efforts.

- The goal is to make boilerplate to facilitate the use of prefixed applications and to ease the admins job.

- The main thing is to simulate a subsystem is a subdirectory ``/sys`` of a project, or creating an instance of something, ``/somewhere``.

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

Installing a profil
---------------------
The profils are just specialized paster templates so you just have to apply a template to a project.

There are too ways to use one profil, insde or outside minitage, just by *anssering yes or no* to the minitage presence question.

Examples:

    We will apply the 'minitage.env' profil to 'myproject'

    * inside minitage::

        paster create -t minitage.env myproject inside_minitage=yes
        categ/project/myproject/sys/share/minitage/minitage.env

    * outside miniutage::

        paster create -t minitage.env myproject inside_minitage=no
        myproject/share/minitage/minitage.env

