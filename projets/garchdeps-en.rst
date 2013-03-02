public: true

Garchdeps
===============

garchdeps is tool that show graphical dependencies of the archlinux packages

Main functions
---------------------

- Show graphical dependencies of the Archlinux packages
- For each package display detailed informations (number of dependencies, width dependency, package size, related package packet size, etc ...)
- Affichage pour chaque paquet des informations détaillées (nombre de dépendances, largeur de dépendance, taille des paquets, taille des paquets liés, etc ...)
- Helper for searching orphan package (simulate removing packages)

Use
-----------

**Generate graph dependencies**

.. sourcecode:: bash

   ./garchdeps.py -f mplayer -g /tmp/graph.dot ; tred /tmp/graph.dot | dot -Tpng  -o /tmp/graph.png

.. image:: /static/garchdeps/garchdeps_dependencies.jpg
    :alt: garchdeps dependencies
    :align: center
    :width: 100%
    :target: http://www.flickr.com/photos/b_adele/8480760073/sizes/k/in/photostream/

**Detailed packages informations**

This table displays the name of the package, total dependencies for each package,  dependencies only related package (if the package should be deleted), packet size, etc.

.. sourcecode:: bash

   ./garchdeps.py


.. image:: ../../static/garchdeps/thumbnail.garchdeps_commande.png
    :alt: garchdeps dependencies
    :align: center
    :width: 100%

**Display orphan package if it deleted**

.. sourcecode:: bash

   ./garchdeps.py -o -s totalsize


.. image:: ../../static/garchdeps/thumbnail.commande_orphan.png
    :alt: detailed informations packages
    :align: center
    :width: 100%


**Display dependencies in tree mode**

.. sourcecode:: bash

   ./garchdeps.py -f tmux -t


.. image:: ../../static/garchdeps/garchdeps_tree.png
    :alt: tree dependencies mode
    :align: center
    :width: 100%

