public: true

Garchdeps
===============

garchdeps est un outil qui permet d'analyser l'utilisation des paquets sur votre système archlinux

Fonctions principales
---------------------

- Affichage sous forme graphique des dépendances d'un ou plusieurs paquets
- Affichage pour chaque paquet des informations détaillées (nombre de dépendances, largeur de dépendance, taille des paquets, taille des paquets liés, etc ...)
- Calcul des paquets orphelins (simulation de suppression de paquet)

Utilisation
-----------

**Génération d'un graphe de dépendance**

.. sourcecode:: bash

   ./garchdeps.py -f mplayer -g /tmp/graph.dot ; tred /tmp/graph.dot | dot -Tpng  -o /tmp/graph.png

.. image:: http://bruno.adele.im/data/uploads/graph_recuced.png
    :alt: garchdeps dependencies
    :align: center
    :width: 100%
    :target: http://www.flickr.com/photos/b_adele/8480760073/sizes/k/in/photostream/

**Affichage d'un tableau détaillé des paquets**

Ce tableau affiche le nom du paquet, les dépendances totales pour chaque paquet, les dépendances liées au paquet seulement (si le paquet doit être supprimé), taille des paquets, etc ...

.. sourcecode:: bash

   ./garchdeps.py


.. image:: ../../static/garchdeps/thumbnail.garchdeps_commande.png
    :alt: garchdeps dependencies
    :align: center
    :width: 100%

**Affichage des paquets orphelins en cas de suppression**

.. sourcecode:: bash

   ./garchdeps.py -o -s totalsize


.. image:: ../../static/garchdeps/thumbnail.commande_orphan.png
    :alt: garchdeps dependencies
    :align: center
    :width: 100%


**Affichage des dépendences sous forme d'arbre texte**

.. sourcecode:: bash

   ./garchdeps.py -f tmux -t


.. image:: ../../static/garchdeps/garchdeps_tree.png
    :alt: garchdeps dependencies
    :align: center
    :width: 100%

