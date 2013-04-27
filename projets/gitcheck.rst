public: true

Gitcheck
========

Lorsque vous travaillez sur plusieurs dépots git, il est désagréable de devoir parcourir chaque projet un à un pour voir si des modifications ont été commitées. C'est pour cela que j'ai crée ce script qui permet de savoir quels sont les projets non commités.

Gitcheck permet de vérifier si vos modifications doivent être commitées, si elle doivent être pushées ou vérifier si il y'a des modifications sur les dépots distants.


Utilisation
-----------

**Commande**

.. sourcecode:: bash

   gitcheck.py
   ou
   gitcheck.py -v

**Version simplifiée**

Affiche le status de chaque dépôt, avec pour chaque projet git le nombre de fichier modifiés ainsi que pour chaque dépôts les push/pull non encore effectués.


.. image:: /static/gitcheck.png
   :width: 75%

- En vert les dépôts git non modifiés.
- En rose les dépôts git modifiés accompagnés des statistiques.


**Version verbose**

Par rapport à la version précédente, affiche les noms des fichiers concernés ainsi que pour chaque dépôts les commits non pushés

.. image:: /static/gitcheck_verbose.png
   :width: 75%

- En vert les dépôts git non modifiés.
- En rose les dépôts git modifiés accompagnés des statistiques.
- En orange les fichiers modifiés.

**Les sources**

Les sources du projet sont disponibles sur le dépot github https://github.com/badele/gitcheck
