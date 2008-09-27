minitage.env
=============
**This is maybe the most important profil.**

This profil will install a 'minitage.env' shell script.

When you source this shell script, all the environnement of the project is pushed into the current environment.

This will enable `PATH`, and  `LD_LIBRARY_PATH` to be filled with all the dependencies subdirectories.

For example, if your project has `postgresql` as a dependency, sourcing `sys/share/minitage/minitage.env` will give you `psql` in the `PATH`.

It will also register some environement variables like:

    - `MT`: the path to the minitage top directory
    - `INS`: the path to the current project


minitage.postgresql
====================
This profil will install a 'postgresql database'.

When you answer to question, think that the 'main user' is a system user.

    - In `sys/bin`, you ll have binaries which point to the created database.
    - In `sys/etc/init.d`, you ll have an init script to start the database.
    - In `sys/var/data/postgresql/database`, you ll have the database.
    - In `sys/var/log/postgresql`, you ll have the logs.


minitage.varnish
==================
This profil will install a varnish instance.

    - In `sys/bin`, you ll have wrappers for original varnish binaries pointing to your instance
    - In `sys/etc/init.d`, you ll have an init script to start the cache.
    - In `sys/etc/varnish/`, you ll have the VCL configuration file
    - In `sys/var/data/varnish`, you ll have the cache file.

