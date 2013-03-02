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
   avr-gcc                                  |      19 |       0 |        6 |        1 |    81 MB |     0 KB |    81 MB |   131 MB | ###        |
   inkscape                                 |     127 |       7 |       12 |        0 |    81 MB |    16 MB |    97 MB |   554 MB | ####       |
   gcc-multilib                             |      19 |       0 |        7 |        0 |    79 MB |     0 KB |    79 MB |   139 MB | ###        |
   fritzing                                 |     111 |       0 |       10 |        0 |    74 MB |     0 KB |    74 MB |   446 MB | ###        |
   virtualbox                               |      81 |       5 |        9 |        0 |    74 MB |   106 MB |   180 MB |   420 MB | #######    |
   gimp                                     |     153 |       4 |       13 |        0 |    69 MB |     9 MB |    78 MB |   605 MB | ###        |
   python2                                  |      30 |       0 |        7 |       29 |    69 MB |     0 KB |    69 MB |   193 MB | ##         |
   smbclient                                |      39 |       0 |        9 |        2 |    63 MB |     0 KB |    63 MB |   216 MB | ##         |
   linux                                    |      50 |       0 |        7 |        1 |    59 MB |     0 KB |    59 MB |   302 MB | ##         |
   gtk3                                     |     113 |       0 |       10 |        9 |    55 MB |     0 KB |    55 MB |   427 MB | ##         |
   foomatic-db-foo2zjs                      |      27 |       0 |        6 |        1 |    55 MB |     0 KB |    55 MB |   192 MB | ##         |
   gtk2                                     |      92 |       0 |       10 |       21 |    54 MB |     0 KB |    54 MB |   362 MB | ##         |

**Display orphan package if it deleted**

.. sourcecode:: bash

   ./garchdeps.py -o -s totalsize

   -----------------------------------------+---------+---------+----------+----------+----------+----------+----------+----------+------------+
   Package                                  | T. Deps | L. Deps | N. depth | N usedby |  P. Size |  L. Size |  T. Size |  D. Size |  % T. Size |
   -----------------------------------------+---------+---------+----------+----------+----------+----------+----------+----------+------------+
   libreoffice-common                       |      86 |       0 |        8 |        6 |   236 MB |     0 KB |   236 MB |   462 MB | ########## |
   ocaml                                    |       9 |       0 |        5 |        0 |   191 MB |     0 KB |   191 MB |    66 MB | ########   |
   virtualbox                               |      81 |       5 |        9 |        0 |    74 MB |   106 MB |   180 MB |   420 MB | #######    |
   arduino                                  |      65 |       3 |       11 |        0 |    46 MB |   116 MB |   162 MB |   445 MB | ######     |
   mono                                     |      39 |       1 |        7 |        0 |   136 MB |     1 MB |   137 MB |   157 MB | #####      |
   chromium                                 |     120 |       0 |       11 |        0 |   127 MB |     0 KB |   127 MB |   466 MB | #####      |
   emacs                                    |     137 |       3 |        8 |        0 |   102 MB |     7 MB |   109 MB |   522 MB | ####       |
   inkscape                                 |     127 |       7 |       12 |        0 |    81 MB |    16 MB |    97 MB |   554 MB | ####       |
   python                                   |      29 |       0 |        7 |       14 |    93 MB |     0 KB |    93 MB |   192 MB | ###        |
   qt                                       |     110 |       0 |        9 |        8 |    90 MB |     0 KB |    90 MB |   355 MB | ###        |
   jre                                      |      54 |       0 |       10 |        0 |    86 MB |     0 KB |    86 MB |   211 MB | ###        |
   avr-gcc                                  |      19 |       0 |        6 |        1 |    81 MB |     0 KB |    81 MB |   131 MB | ###        |
   gcc-multilib                             |      19 |       0 |        7 |        0 |    79 MB |     0 KB |    79 MB |   139 MB | ###        |
   gimp                                     |     153 |       4 |       13 |        0 |    69 MB |     9 MB |    78 MB |   605 MB | ###        |
   fritzing                                 |     111 |       0 |       10 |        0 |    74 MB |     0 KB |    74 MB |   446 MB | ###        |
   python2                                  |      30 |       0 |        7 |       29 |    69 MB |     0 KB |    69 MB |   193 MB | ##         |
   smbclient                                |      39 |       0 |        9 |        2 |    63 MB |     0 KB |    63 MB |   216 MB | ##         |
   linux                                    |      50 |       0 |        7 |        1 |    59 MB |     0 KB |    59 MB |   302 MB | ##         |
   gtk3                                     |     113 |       0 |       10 |        9 |    55 MB |     0 KB |    55 MB |   427 MB | ##         |
   foomatic-db-foo2zjs                      |      27 |       0 |        6 |        1 |    55 MB |     0 KB |    55 MB |   192 MB | ##         |


**Display dependencies in tree mode**

.. sourcecode:: bash

   ./garchdeps.py -f tmux -t

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
