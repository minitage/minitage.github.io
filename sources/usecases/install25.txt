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
    wget http://git.minitage.org/git/minitage/shell/plain/PyBootstrapper.sh
    bash ./PyBootstrapper.sh $python

Make a minitage instance::

    $python/bin/virtualenv --no-site-packages $minitage
    source $minitage/bin/activate
    easy_install -U minitage minitage.paste
    minimerge -s


Install python-2.5::

    minimerge python-2.5

