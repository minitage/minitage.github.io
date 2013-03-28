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


Be sure to have tomcat installed, and moreover, you must have the JAVA_HOME variable defined in your environment.
Many distrib's as debian don't set it by default.
::

    export JAVA_HOME=/path/to/your/jdk
    minimerge tomcat-6.0.20 (if alreazdy installed : minimerge -NRuUv tomcat-6.0.20)

Installation
::

    easy_install minitage.paste.extras
    $EDITOR $MT/minilays/*/yourproject # add tomcat-6.0.20 to dependencies
    paster create -t minitage.instances.cas myproject

This instance will install a tomcat isntance where is installed a CAS server on top of it

    - In `sys/bin`, you ll have wrappers for original binaries pointing to your instance
    - In `sys/etc/init.d`, you ll have an init script to start the tomcat.
    - In `sys/etc/cas.project/`, you ll have the configuration files
    - In `sys/var/data/tomcat/cas`, you ll have the tomcat instance files.


