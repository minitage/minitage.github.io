A turbogears project with a postgresql database
#################################################

First some variables::

    export prefix=/somewhere
    export python=$prefix/python
    export minitage=$prefix/minitage
    export ins=$minitage/zope/myproject

Bootstrap python::

    mkdir -p $python
    cd $python
    wget http://hg.minitage.org/hg/minitage/shell/raw-file/tip/PyBootstrapper.sh
    bash ./PyBootstrapper.sh -2.4 $python

Make a minitage instance::

    $python/bin/virtualenv --no-site-packages $minitage
    source $minitage/bin/activate
    easy_install -U minitage.core minitage.paste
    minimerge -s

Create and install a **turbogears project** with the postgresql profile::

    paster create -t minitage.tg myproject

Add postgresql dependencies, the database and the python bindings::

    sed -re "s/sqlite-3.5/postgresql-8.2 psycopg2-2.0.6 pypgsql-2.5.1/g" -i $minitage/minilays/myproject/myproject

Install a **turbogears project** with the **postgresql profile**::

    minimerge myproject
    paster create -t minitage.profils.postgresql myproject

Launch the database::

    $ins/sys/etc/init.d/postgresql_myproject.minitagedb restart

Use tg-admin::

    bin/tg-admin --help
    bin/tg-admin sql create

The code of your project is in ::

    $ins/src/myproject

And you can start the project::

    $ins/bin/start-myproject

