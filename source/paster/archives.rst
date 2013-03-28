Paster archives
#################

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
 
