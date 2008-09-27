
Introduction
*************

- Minitage profils are the way to integrate applications in minitage projects.

- The goal is to make boilerplate to facilitate the use of prefixed applications and to ease the admins job.

- The main thing is to simulate a subsystem is a subdirectory ``/sys`` of a project.

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

Example::

    # Applying the 'minitage.env' profil to 'myproject'
    paster create -t minitage.env myproject


