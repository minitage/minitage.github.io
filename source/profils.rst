================
Profils
================

Purpose
=======
Introduce to the minitage profils

Minitage profils
=================
- Minitage profils are the way to integrate applications in minitage projects.

- The goal is to make boilerplate to facilitate the use of prefixed applications and to ease the admins job.

- The main thing is to simulate a subsystem is a subditory ``/sys`` of a project.

Basic layout
=============
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
            postgresl/
                MyDatabase.log

Installing a profil
=====================
The profils are just specialized paster templates so you just have to apply a template to a project.

Example::

    # applying the 'minitage.env' profil to 'myproject'
    paster create -t minitage.env myproject

Available Profils
==================
minitage.env
-------------
This profil will install a 'minitage.env' shell script.

When you source this shell script, all the environnement of the project is pushed into the current environment.

This will enable `PATH`, and  `LD_LIBRARY_PATH` to be filled with all the dependencies subdirectories.

For example, if your project has `postgresql` as a dependency, sourcing `sys/share/minitage/minitage.env` will give you `psql` in the `PATH`.


minitage.postgresql
-------------------
This profil will install a 'postgresql database'.

When you answer to question, think that the 'main user' is a system user.

- In `sys/bin`, you ll have binaries which point to the created database.
- In `sys/etc/initd`, you ll have an init script to start the database.
- In `sys/var/data/postgresql/database`, you ll have the database.
- In `sys/var/log/postgresql`, you ll have the logs.


