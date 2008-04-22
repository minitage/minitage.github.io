=============
deps projects
=============

Purpose
=======

How to package a system dependency which is not python related software (not installed with distutils or setuptools) in minitage.
The minitage category is "dependencies".

Buidout
=======
You must install into minitage/dependencies/dependencyName/part !

Sample Layout
=============
You can use this sample ::

    https://URL/samples/dependency/

Configure && Make && Make Install parts
---------------------------------------

Above, You have that you can set some interessant variables that make easier the LD_FLAGS and CFLAGS handling.
Knowing that, you can define easily some compile parts:

    * CFLAGS : -I${A_DIRECTORY_WHERE_THE_COMPILER_CAN_FINd_SOME_C_HEADERS}
    * LD_FLAGS : -L${A_DIRECTORY_WHERE_THE_LINKER_CAN_FIND_LIBRARIES} -Wl,-rpath -Wl,${A_DIRECTORY_WHERE_THE_LINKER_CAN_FIND_LIBRARIES}

Example::

    [libbar]
    location=${project:dependencies}/libbar
    include=${project:dependencies}/libbar/include
    lib=${project:dependencies}/libbar/lib
    [libfoo]
    recipe = makina.recipe.cmmi
    url = ftp://ftp.remotesensing.org/pub/libfoo/foo-3.8.2.tar.gz
    md5sum = fbb6f446ea4ed18955e2714934e5b698
    configure-options =
        CFLAGS="-I${libbar:include}"
        LDFLAGS="-L${libbar:lib} -Wl,-rpath -Wl,${libbar:lib} $(bash -c "if [[ $(uname) == 'Darwin' ]];then echo '-mmacosx-version-min=10.5.0';fi")"

NB: ``$(bash -c "if [[ $(uname) == 'Darwin' ]];then echo '-mmacosx-version-min=10.5.0';fi")`` is for macintosh keep and dont touch it !

Complicated CMMI
""""""""""""""""

You can set addtionnal make target and also be able to disable parts in the cmmi procedure.
Example::

    [part]
    recipe = makina.recipe.cmmi
    url = http://85.25.128.62/gentoo/distfiles/bzip2-1.0.4.tar.gz
    md5sum = fc310b254f6ba5fbb5da018f04533688
    noconfigure = true
    nomake = true
    noinstall = true
    post-make-hook = ${buildout:hooks-directory}/cmmi-hooks.py:bz2
    additionnal-make-targets =
        -f Makefile-libbz2_so CFLAGS="-fpic -fPIC -Wall -Winline -O3  -I. -L."
        CFLAGS="-fpic -fPIC -Wall -Winline -O3  -I. -L. "

Definition of some variables that can be used:

``gmake = true``
    use gmake

``patches``
    list of patches to apply. Patches' names are separated by a space or a new
    line (``\n``).

Create the appropriate minibuild
--------------------------------

Create a minibuild for your dependency::

    $ cat yourproject
    install_method="buildout"
    src_uri="https://subversion.foo.net/yourproject/trunk"
    src_type="svn"
    category="dependencies"



