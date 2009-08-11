A plone3 project with relstorage (postgresql) and varnish2 support
####################################################################

First some variables::

    export prefix=/somewhere
    export python=$prefix/python
    export minitage=$prefix/minitage
    export ins=$minitage/zope/plony
    export paster=$mt/bin/paster

Bootstrap python::

    mkdir -p $python
    cd $python
    wget http://git.minitage.org/git/minitage/shell/plain/PyBootstrapper.sh
    bash ./PyBootstrapper.sh $python

Make a minitage instance::

    $python/bin/virtualenv --no-site-packages $minitage
    source $minitage/bin/activate
    easy_install -U minitage.core minitage.paste
    minimerge -s

Create and install a **plone3 with RelsSorage project** with the **varnish2** and **postgresql** profiles on top of it::

    $paster create -t minitage.plone3 plony with_psycopg2=yes mode=relstorage
    minimerge plony
    $paster create -t minitage.instances.varnish2 plony
    $paster create -t minitage.instances.postgresql plony

Launch the varnish if you want (you may edit the VCL in $ins/sys/etc/varnish before)::

    cd $mt/zope/plony
    $ins/sys/etc/init.d/plony-varnish2 restart
    $ins/sys/etc/init.d/postgresql_plony.minitagedb restart
    $ins/bin/instance fg

You can verify that you have things in the db::

    $sys/bin/minitagedb.psql

Play around and when your are ready, just version in this way:

    * $mt/category/project      -> http://url/buildouts/$category/plony
    * $mt/minilays/yourproject  -> http://url/minilays/plony

Of course, here category is zope.

Don't forget to adapt the `src_uri` or your minibuild::

    [minibuild]
    ...
    src_uri=http://url/buildouts/$category/plony
    ...

