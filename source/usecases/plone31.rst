A plone31 project with zeo and varnish
######################################

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
    easy_install -U minitage.core minitage.paste mercurial
    minimerge -s

Create and install a **plone31 with zeo project** with the varnish profile::

    paster create -t minitage.plone31zeo myproject
    minimerge myproject
    paster create -t minitage.profils.varnish myproject

Launch the varnish::

    cd zope/myproject
    $ins/sys/etc/init.d/myproject-varnish restart

Use svn from minitage thanks to the **minitage.env** profile.
You have not to install it as it is a **minitage.varnish** dependency::

    source $ins/sys/share/minitage/minitage.env
    svn import $ins http://foo.net/myproject/trunk

