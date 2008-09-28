Installation with a python 2.5
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
    bash ./PyBootstrapper.sh $python

Make a minitage instance::

    $python/bin/virtualenv --no-site-packages $minitage
    source $minitage/bin/activate
    easy_install -U minitage.core minitage.paste mercurial
    minimerge -s

