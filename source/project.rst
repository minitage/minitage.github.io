=======
Project
=======

*Warning*: this doc is for the old non-public v0.3.
A soon as the 0.4 is enought ready, i ll rewrite it according to needed changes.

The steps
=========

The steps for minitaging a project are:

    * Create the install part of the project.
    * Create a minibuild which points to this install

Begin a new project with buildout and minitage
==============================================

Sample projects layouts
-----------------------

I provided layouts that you can re use according to your needs (PROJECT_CATEGORY):
You can find them there: https://URL/samples/

create the project layout
-------------------------

.. sourcecode:: sh

    # Create a versionned directory in $bd
    # PROJECT_CATEGORY ::= egg | instance | dependency
    svn mkdir https://$url/$project/buildout
    for i in trunk tags branches;do svn mkdir https://$url/$project/buildout/$i;done
    svn co https://$url/$project/buildout/trunk $bd
    svn export https://URL/buildouts/buildout-meta/trunk/examples/[PROJECT_CATEGORY] .
    svn add *
    svn ci -m "initial layout"

add buildout helpers
--------------------

We need some helpers to make buildout very convenient. To make them available, we need to add them to the project.
There are 2 solutions:

    * Export them in your project directory

      .. sourcecode:: sh

        cd $bd
        svn export https://URL/hooks/trunk/ hooks
        svn add hooks
        svn export https://URL/shell/trunk/ shell
        svn add shell
        svn ci -m "adding shell and hooks directory"
        svn propset -F externals $bd/src -F $bd/src/EXTERNALS.txt
        svn ci -m "adding some externalised files"
        svn up src/

    * Better, with svn:externals

      .. sourcecode:: sh

        echo "hooks https://URL/buildouts/hooks/branches/meta">$bd/EXTERNALS.txt
        echo "shell https://URL/buildouts/shell/trunk">>$bd/EXTERNALS.txt
        echo "minitage.recipe.distros https://URL/eggs/minitage.recipe.distros/">$bd/src/EXTERNALS.txt
        svn propset svn:externals $bd -F $bd/EXTERNALS.txt
        svn propset svn:externals $bd/src -F $bd/src/EXTERNALS.txt
        svn add  $bd/EXTERNALS.txt $bd/src/EXTERNALS.txt
        svn ci -m "adding some externalised files"
        svn up

what category to choose?
========================

    * for libraries and applications, make a "dependencies" one
    * for "pur-python" eggs, make an "eggs" one
    * for eggs which need compilation, make an "eggs" one
    * for zope instances make an "zope" one
    * for django instances make an "django" one

Wrting buildout Parts
=====================

Writing buildouts for minitage is a little bit different to write mnolithic buildouts.
As you write light buildouts, you do not have there all the boiler plate variables you have in a classical buildout.
To work around that, a convenient way is to write variables sections:
EX:

.. sourcecode:: ini

     [project]
     eggs-directory=${buildout:directory}/../../eggs/cache
     develop-eggs-directory=${buildout:directory}/../../eggs/develop-cache
     directory=${buildout:directory}/../../
     dependencies=${buildout:directory}/../../dependencies
     parts =
        matplotlib
     ...
     [freetype]
     location=${project:dependencies}/freetype-2.1/part
     include=${project:dependencies}/freetype-2.1/linclude
     lib=${project:dependencies}/freetype-2.1/lib/lib

There you can reference easily:

    * ``${projet:eggs-directory}``: cache for eggs
    * ``${projet:develop-eggs-directory}``: cache for develop eggs
    * ``${project:dependencies}``: where the project dependencie are installed
    * ``${freeype:include}``: where the include for freetype are 
    * ``${freeype:lib}``: where the so for freetype are

