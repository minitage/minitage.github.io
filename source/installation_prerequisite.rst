.. _mininsprerequisites:

System Prerequisites
########################

.. contents::

Minitage requires:

    - GIT the DVCS
    - a complete GNU toolchain to build softwares

All those packages are mandatory :

    - git
    - m4
    - A c compiler (gcc ?)
    - pkg-config
    - autotools

        - automake
        - autoconf

    - libtool if your platform supports it
    - groff
    - man-db, man utils (AKA: man packages)


Debian/Ubuntu
-------------

    Prior to begin with the project, ensure that a decent toolchain is installed on your system :

        .. code-block:: sh

            apt-get install build-essential m4 libtool pkg-config autoconf gettext bzip2 groff man-db automake libsigc++-2.0-dev tcl8.4 git
            # or on recent versions
            apt-get install build-essential m4 libtool pkg-config autoconf gettext bzip2 groff man-db automake libsigc++-2.0-dev tcl8.5 git

FreeBSD
-------

    * git
    * gmake
    * gsed

        .. code-block:: sh

            cd /usr/ports/sysutils/portinstall
            make install clean
            for i in git gsed gmake autotools autoconf git;do portinstall $i;done

Gentoo
------
::

    emerge git


Suze
----

    Prior to begin with the project, ensure those dependencies are installed on
    your system:

    * toolchain (gcc, autotools, m4)
    * git

Centos
-----------

    Prior to begin with the project, ensure those dependencies are installed on
    your system:

    This one liner can help you

        .. code-block:: sh

             yum install automake autoconf libtool wget gcc-c++ patch gettext kernel-headers git


    You may have problem to build glib2, because centos ships old kernel headers

        .. code-block:: sh

            mv /usr/include/linux /usr/include/linux.old
            ln -s /usr/src/kernels/[YOURKERNEL]/include/linux /usr/include/linux

Fedora
-----------

    Prior to begin with the project, ensure those dependencies are installed on
    your system:

    This one liner can help you

        .. code-block:: sh

             yum install automake autoconf libtool wget gcc-c++ patch gettext kernel-headers git


MacOS X
-------

    Normally, you just need a copy of the XCode and git and you are ready to dance.


