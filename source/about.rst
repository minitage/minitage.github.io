Minitage, the origins
=======================

Buildout Limits
---------------

First of all, do not buy a gun before using buildout
Buildout is not a magical tool and we just had quite a lot of drawbacks :

 - Today offline mode can be problematic
 - If you change your python, take a coffee.
 - 1GB per project, it s too much.
 - Buildout behaviour can be hard to predict even more if the configuration file is huge.

The Idea
---------

 - The idea is to write a light and simple package manager from scratch which will allow us to integrate various build systems.
 - What about shell scripts, buildout or makefiles interact together to assemble all the parts our project needs?
 - To allow this, the approach is to share a common 'well known' layout to install things in minitage. Then the referencing packages can address each other easily as they respect the layout.

Implementation goals
----------------------

 - Write just small specialized buildouts.
 - Reuse with svn:externals or others (mercurial forest extension, package manager fetching methods)
 - Centralize and re-use dependencies among projects.
 - Use different ways to install, One tool for one thing, remember the Unix way.
 - Deploy a project from start to end.
 - Isolate all the needed boilerplate from the host system. All stuff in minitage is supposed to be independant from the host base system. Compiled stuff is interlinked as much as possible.
 - Reproduce the same environement everywhere (on UNIX platforms). It will probably work on

     - Linux
     - MacOSX but at least OSX Leopard is required. (it has worked, but not tested recently)
     - FreeBSD (it has worked, but not tested recently)
 
