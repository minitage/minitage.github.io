minitage.instances.env
=============================
Installation::

    paster create -t minitage.instances.env myproject

**This is maybe the most important instance.**

This instance will install a 'minitage.env' shell script.

When you source this shell script, all the environnement of the project is pushed into the current environment.

This will enable `PATH`, and  `LD_LIBRARY_PATH` to be filled with all the dependencies subdirectories.

the `LD_LIBRARY_PATH` setted by minitage.paste may interact with the rest of the system. if you get troubles, just unset it::

    unset LD_LIBRARY_PATH


For example, if your project has `postgresql` as a dependency, sourcing `sys/share/minitage/minitage.env` will give you `psql` in the `PATH`.

It will also register some environement variables like:

    - `MT`: the path to the minitage top directory
    - `INS`: the path to the current project

minitage.instances.postgresql
==================================
Installation::

    paster create -t minitage.instances.postgresql myproject

This instance will install a 'postgresql database'.

When you answer to question, think that the 'main user' is a system user.

    - In `sys/bin`, you ll have binaries which point to the created database.
    - In `sys/etc/init.d`, you ll have an init script to start the database.
    - In `sys/var/data/postgresql/database`, you ll have the database.
    - In `sys/var/log/postgresql`, you ll have the logs.


minitage.instances.varnish
=============================
Installation::

    paster create -t minitage.instances.varnish myproject

This instance will install a varnish instance.

    - In `sys/bin`, you ll have wrappers for original varnish binaries pointing to your instance
    - In `sys/etc/init.d`, you ll have an init script to start the cache.
    - In `sys/etc/varnish/`, you ll have the VCL configuration file
    - In `sys/var/data/varnish`, you ll have the cache file.

minitage.instances.varnish2
========================================
Installation::

    paster create -t minitage.instances.varnish2 myproject

This instance will install a varnish2 instance.

    - In `sys/bin`, you ll have wrappers for original varnish binaries pointing to your instance
    - In `sys/etc/init.d`, you ll have an init script to start the cache.
    - In `sys/etc/varnish/`, you ll have the VCL configuration file
    - In `sys/var/data/varnish`, you ll have the cache file.

minitage.instances.paste-initd
=================================
Installation::

    paster create -t minitage.instances.paste-initd myproject

This instance will install an initd script to wrap a paste configuration start throught paster serve (with appropriate project dependencies).

    - In `sys/etc/init.d`, you ll have an init script to start the project.

minitage.instances. mysql=================================
Installation::

    paster create -t minitage.instances.paste-initd myproject

This instance will install an initd script to wrap a paste configuration start throught paster serve (with appropriate project dependencies).

    - In `sys/etc/init.d`, you ll have an init script to start the project.

minitage.instances.mysql
=================================
Installation::

    paster create -t minitage.instances.mysql myproject

This instance will install a 'mysql database'.

When you answer to question, think that the 'main user' is a system user.

    - In `sys/bin`, you ll have binaries which point to the created database.
    - In `sys/etc/init.d`, you ll have an init script to start the database.
    - In `sys/var/data/mysql/database`, you ll have the database.
    - In `sys/var/log/mysql`, you ll have the logs. 

minitage.instances.cas
=================================
Installation::

    easy_install minitage.paste.cas
    minimerge tomcat-0.0.20 # or add it to your minibuild and launch minimerge my project
    paster create -t minitage.instances.cas myproject

This instance will install a tomcat isntance where is installed a CAS server on top of it

    - In `sys/etc/init.d`, you ll have an init script to start the project.
    - In `sys/bin`, you ll have wrappers for original binaries pointing to your instance
    - In `sys/etc/init.d`, you ll have an init script to start the tomcat.
    - In `sys/etc/cas.project/`, you ll have the configuration files
    - In `sys/var/data/tomcat/cas`, you ll have the tomcat instance files.


