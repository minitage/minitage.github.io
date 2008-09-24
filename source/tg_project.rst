.. _tgprojects:

Turbogears Projects
####################

- Turbogears basic eggs needs some specific Turbogears stuff. So we will need to install our template in two steps.
- We add a wrapper to buildout to add those specific needs.

    - Running paster::
 
        paster create -t minitage.tg foo 
            Answer questions


    - Create and activate the envrionnement helper::

        paster create -t minitage.env foo 
        source ~/minitage/tg/foo/sys/share/minitage/minitage.env

    - minimerging your project::

        minimerge foo

    - running the post-installation script::

        bin/tgpostinstall

    - After that, do not use anymore `bin/buildout` but use instead::

        bin/tgbuildout

    -  You can also launch your brand new Turbogears project::
        
        bin/tg-admin sql create
        bin/start-foo


    - Or use tg-admin::

        bin/tg-admin --help

