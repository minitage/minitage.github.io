Beginning a project with minitage: The Initial Steps
======================================================

Project initialization
--------------------------------------------------------

* Choose an existing  :ref:`minitage layout <minitageprojects>` if any suits your needs.
* Create the project itself and package it to be 'minitage compliant'
  (uploading, versionining). To quickstart, just just an existing minitage template.
* Create or edit a minibuild, in a minilays  which points to this layout::

    mkdir -p $mt/minilays/mynewminilay
    vim  $mt/minilays/mynewminilay/project

* Maybe, it is a good time to version the minilay.
* Lets go for the minimerge dance::

    minimerge myproject

.. _versioning_project:

Project versionning
-----------------------

* Play around and when your are ready, just version in this way:

    - $mt/category/project      -> http://url/buildouts/$category/myproject
    - $mt/minilays/yourproject  -> http://url/minilays/myproject

* Don't forget to adapt the `src_uri` or your minibuild::

    [minibuild]
    ...
    src_uri=http://url/buildouts/$category/myproject
    ...

