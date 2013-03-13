public: true

Garchdeps
===============

English version http://bruno.adele.im/projets/garchdeps-en/

garchdeps est un outil qui permet d'analyser l'utilisation des paquets sur votre système archlinux.

Fonctions principales
---------------------
- `Affichage sous forme graphique`_ des dépendances d'un ou plusieurs paquets
- `Résumé de l'installation`_
- Affichage pour chaque paquet des `informations détaillées`_ (nombre de dépendances, largeur de dépendance, taille des paquets, taille des paquets liés, etc ...) ainsi qu'en mode `dépendance inversée`_
- Calcul des `paquets orphelins`_ (simulation de suppression de paquet)
- Affichage des dépendances `sous forme d'arbre`_ (en mode console)


Utilisation
-----------

.. _`Affichage sous forme graphique`:

**Génération d'un graphe de dépendance**

Affiche un graphe de dépendance, en magenta les 10 premiers paquets les plus utilisés sur l'installation, en cyan les 10 autres paquets les plus utilisés, en vert les paquets que l'on peut supprimer si on venait à supprimer le paquet principal, en l'occurence ici **mplayer**.

.. sourcecode:: bash

   garchdeps.py -f mplayer -g /tmp/graph.dot ; tred /tmp/graph.dot | dot -Tpng -o /tmp/graph.png

.. image:: /static/garchdeps/garchdeps_dependencies.jpg
    :alt: garchdeps dependencies
    :align: center
    :width: 100%
    :target: http://www.flickr.com/photos/b_adele/8480760073/sizes/k/in/photostream/


.. _`Résumé de l'installation`:

**Détails des informations**

Affiche un résumé de l'installation, en autre le nombre de paquets, la taille occupé sur le disque et diverses statistiques. 

.. sourcecode:: plaintext

   garchdeps.py -i 

   Total packages installed : 962
          All packages size : 3.74 GB
                   Max size : libreoffice-common(236 MB)
     Total Linked deps Size : arduino(116 MB)
             Max Nb used by : glibc(146)
             Max total deps : phonon-mplayer-git(184)
            Max linked deps : phonon-mplayer-git(18)
                 Max depths : zathura-djvu(13)


.. _`informations détaillées`:

**Affichage d'un tableau détaillé des paquets**

Ce tableau affiche le nom du paquet, les dépendances totales pour chaque paquet, les dépendances liées au paquet seulement (si le paquet doit être supprimé), taille des paquets, etc ...

.. sourcecode:: plaintext

   garchdeps.py

   -----------------------------------------+---------+---------+----------+----------+----------+----------+----------+----------+------------+
   Package                                  | T. Deps | L. Deps | N. depth | N usedby |  P. Size |  L. Size |  T. Size |  D. Size |  % T. Size |
   -----------------------------------------+---------+---------+----------+----------+----------+----------+----------+----------+------------+
   libreoffice-common                       |      86 |       0 |        8 |        6 |   236 MB |     0 KB |   236 MB |   462 MB | ########## |
   ocaml                                    |       9 |       0 |        5 |        0 |   191 MB |     0 KB |   191 MB |    66 MB | ########   |
   mono                                     |      39 |       1 |        7 |        0 |   136 MB |     1 MB |   137 MB |   157 MB | #####      |
   chromium                                 |     120 |       0 |       11 |        0 |   127 MB |     0 KB |   127 MB |   466 MB | #####      |
   emacs                                    |     137 |       3 |        8 |        0 |   102 MB |     7 MB |   109 MB |   522 MB | ####       |
   python                                   |      29 |       0 |        7 |       14 |    93 MB |     0 KB |    93 MB |   192 MB | ###        |
   qt                                       |     110 |       0 |        9 |        8 |    90 MB |     0 KB |    90 MB |   355 MB | ###        |
   jre                                      |      54 |       0 |       10 |        0 |    86 MB |     0 KB |    86 MB |   211 MB | ###        |

.. _`dépendance inversée`:

**Affichage des dépendance inversée**
Affiche les dépendances inversée, c'est à dire qui utilise le paquet recherché. Par exemple ci-dessous, la liste des paquet utilisant la librairie qt.

.. sourcecode:: plaintext

   garchdeps.py -f qt -r -s totalsize
   -----------------------------------------+---------+---------+----------+----------+----------+----------+----------+----------+------------+
   Package                                  | T. Deps | L. Deps | N. depth | N usedby |  P. Size |  L. Size |  T. Size |  D. Size |  % T. Size |
   -----------------------------------------+---------+---------+----------+----------+----------+----------+----------+----------+------------+
   fritzing                                 |     111 |       0 |       10 |        0 |    74 MB |     0 KB |    74 MB |   446 MB | ########## |
   phonon-mplayer-git                       |     184 |      18 |       11 |        0 | 448.0 KB |    30 MB |    30 MB |   624 MB | ####       |
   keepassx                                 |     115 |       0 |        9 |        0 |     3 MB |     0 KB |     3 MB |   462 MB |            |
   python-shiboken                          |     112 |       0 |       10 |        0 |     2 MB |     0 KB |     2 MB |   540 MB |            |
   generatorrunner                          |     114 |       1 |       11 |        0 | 364.0 KB |     1 MB |     1 MB |   462 MB |            |
   phonon                                   |     184 |       0 |       10 |        1 |     1 MB |     0 KB |     1 MB |   624 MB |            |
   apiextractor                             |     113 |       0 |       10 |        1 |     1 MB |     0 KB |     1 MB |   461 MB |            |
   libqzeitgeist                            |     111 |       0 |       10 |        1 | 396.0 KB |     0 KB | 396.0 KB |   446 MB |            |
   automoc4                                 |     111 |       0 |       10 |        0 |  84.0 KB |     0 KB |  84.0 KB |   446 MB |            |



.. _`paquets orphelins`:

**Affichage des paquets orphelins en cas de suppression**

Permet d'afficher la commandes de suppression du paquet principal ansi que les paquets liée (en vert sur le graphe ci-dessus)

.. sourcecode:: plaintext

   ocaml                                    191 MB     [  0] sudo pacman -R ocaml 
   virtualbox                               180 MB     [  0] sudo pacman -R virtualbox virtualbox-host-modules linux linux-firmware mkinitcpio mkinitcpio-busybox 
   arduino                                  162 MB     [  0] sudo pacman -R arduino avr-libc avr-gcc avr-binutils 
   mono                                     137 MB     [  0] sudo pacman -R mono libgdiplus 
   chromium                                 127 MB     [  0] sudo pacman -R chromium 
   emacs                                    109 MB     [  0] sudo pacman -R emacs libotf m17n-lib m17n-db 
   inkscape                                 97 MB      [  0] sudo pacman -R inkscape gc gsl gtkspell enchant aspell hspell poppler-glib 


.. _`sous forme d'arbre`:

**Affichage des dépendences sous forme d'arbre texte**

Permet d'afficher l'arborescence des dépendance sous forme d'arbre en mode console.

.. sourcecode:: plaintext

   garchdeps.py -f tmux -t

   ──tmux 
      ├─ncurses 
         └─glibc 
            ├─linux-api-headers 
            ├─tzdata 
            └─filesystem 
               └─iana-etc 
      └─libevent 
         └─openssl 
            └─perl 
               ├─gdbm 
                  ├─glibc 
                  └─sh(by bash) 
                     ├─readline 
                        ├─glibc 
                        └─ncurses 
                     └─glibc 
               ├─db 
                  ├─gcc-libs(by gcc-libs-multilib) 
                     ├─glibc 
                     └─lib32-gcc-libs 
                        ├─lib32-glibc 
                        └─gcc-libs(by gcc-libs-multilib) 
                  └─sh(by bash) 
               ├─coreutils 
                  ├─glibc 
                  ├─pam 
                     ├─glibc 
                     ├─db 
                     ├─cracklib 
                        ├─glibc 
                        └─zlib 
                           └─glibc 
                     ├─libtirpc 
                        └─libgssglue 
                           └─glibc 
                     └─pambase 
                  ├─acl 
                     └─attr 
                        └─glibc 
                  ├─gmp 
                     ├─gcc-libs(by gcc-libs-multilib) 
                     └─sh(by bash) 
                  └─libcap 
                     ├─glibc 
                     └─attr 
               ├─glibc 
               └─sh(by bash) 

**Les sources**

Les sources du projet sont disponible sur le dépot github https://github.com/badele/garchdeps
