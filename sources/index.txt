.. Minitage documentation master file, created by sphinx-quickstart on Mon Apr 21 15:18:26 2008.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to Minitage's documentation!
#######################################


What is minitage
=================

Minitage is all about deployment and projects packaging

.. toctree::
   :maxdepth: 2

   why
   spec

Project terminated
====================
Years have passed and now minitage can be in most cases superseeded by linux VMs or
containers.

As the project didn't get mass adoption, i decided to give it the end of life it
deserves.

Minitage goals are there, the project is stable and really useful.
On the other hand,  it is terribly time consuming in maintening terms.
We are agreeing that what is hard to maintain is the package tree and it
security  and not minitage itself.
It is also and was never made to be that easy to use.
minitagetool was there as a try to leverage the usage, but that's even didn't
made it

That's no doubt that There are uses cases where i will miss it like to snapshot old installations or
use a 'from source install' in an offline location, but i don't have the energy
to maintain this, for only those cases.

There are lot in the balance like:

    - No outside contributions, IOW no volunteers
    - A lot of work needed for maintaining packages
    - less and less benefits that using another modern isolation technology
    - Real life issues

Please migrate your projects to something else, and use your systeme packages.
Your options to isolate are:

    - Freebsd Jails
    - LXC linux containers, vservers, openvz
    - Xen,  KVM, Virtualbox
 
Usage
=================

.. toctree::
   :maxdepth: 1

   installation_prerequisite

.. toctree::
   :maxdepth: 2

   installation
   minitagetool

Advanced usage
=================
.. toctree::
   :maxdepth: 2

   usecases/index

.. toctree::
   :maxdepth: 3

   paster/index

How can i contribute to its development
=========================================
.. toctree::
   :maxdepth: 2

   develop

Doc Archives (not maintained)
====================================
.. toctree::
   :maxdepth: 1

   archives


.. Indices and tables
.. ==================
.. * :ref:`genindex`
.. * :ref:`modindex`
.. * :ref:`search`


