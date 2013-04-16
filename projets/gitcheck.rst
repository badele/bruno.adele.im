public: true

Gitcheck
========

Lorsque vous travaillez sur plusieurs dépots git, il est désagréable de devoir parcourir chaque projet un à un pour voir si des modifications ont été commitées. C'est pour cela que j'ai crée ce script qui permet de savoir quels sont les projets non commités.


Utilisation
-----------

**Commande**

.. sourcecode:: bash

   gitcheck.py
   ou
   gitcheck.py -v

**Version simplifiée**

Affiche le status de chaque dépôt, avec pour chaque projet git le nombre de modifications.


.. image:: /static/gitcheck.png
   :width: 75%

- En vert les dépôts git non modifiés.
- En rose les dépôts git modifiés accompagnés des statistiques.


**Version verbale**

Sensiblement identique à la version précédente, mais indique également les fichiers modifiés.

.. image:: /static/gitcheck_verbose.png
   :width: 75%

- En vert les dépôts git non modifiés.
- En rose les dépôts git modifiés accompagnés des statistiques.
- En orange les fichiers modifiés.

**Les sources**

Les sources du projet sont disponibles sur le dépot github https://github.com/badele/gitcheck
