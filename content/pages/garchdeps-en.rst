Garchdeps
#########

:lang: en
:url: /projets/garchdeps-en
:save_as: projets/garchdeps-en/index.html

garchdeps is tool that show graphical dependencies of the archlinux packages

Main functions
---------------------

- `Show graphical dependencies`_ of the Archlinux packages
- `Summaries informations`_
- For each package display `detailed informations`_ (number of dependencies, width dependency, package size, related package packet size, etc ...) and `reverse dependencies`_
- Helper for searching `orphan`_ package (simulate removing packages)
- Show dependencies in `tree in console mode`_

Use
-----------
.. _`Show graphical dependencies`:

**Generate graph dependencies**

Show graph dependencies, magenta 10 most packages used by your installation, cyan other 10 most packages used, gree packages used only by this primary package, in this example **mplayer**.

.. sourcecode:: bash

   ./garchdeps.py -f mplayer -g /tmp/graph.dot ; tred /tmp/graph.dot | dot -Tpng  -o /tmp/graph.png

.. image:: /static/garchdeps/garchdeps_dependencies.jpg
    :alt: garchdeps dependencies
    :align: center
    :width: 100%
    :target: http://www.flickr.com/photos/b_adele/8480760073/sizes/k/in/photostream/

.. _`Summaries informations`:


**Summary**

Show a summaries installation, total packages installed and totaly installed size on disk.

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


.. _`detailed informations`:

**Detailed packages informations**

This table displays the name of the package, total dependencies for each package,  dependencies only related package (if the package should be deleted), packet size, etc.

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


.. _`reverse dependencies`:

**Show reverse dependencies**

Show reverse dependencies, in this example, show who use qt 

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


.. _`orphan`:

**Display orphan package if it deleted**

Show remove command line for uninstalling package with only packages used by it (in green in graph dependencies at this top of this document)

.. sourcecode:: plaintext

   ocaml                                    191 MB     [  0] sudo pacman -R ocaml 
   virtualbox                               180 MB     [  0] sudo pacman -R virtualbox virtualbox-host-modules linux linux-firmware mkinitcpio mkinitcpio-busybox 
   arduino                                  162 MB     [  0] sudo pacman -R arduino avr-libc avr-gcc avr-binutils 
   mono                                     137 MB     [  0] sudo pacman -R mono libgdiplus 
   chromium                                 127 MB     [  0] sudo pacman -R chromium 
   emacs                                    109 MB     [  0] sudo pacman -R emacs libotf m17n-lib m17n-db 
   inkscape                                 97 MB      [  0] sudo pacman -R inkscape gc gsl gtkspell enchant aspell hspell poppler-glib 

.. _`tree in console mode`:

**Display dependencies in tree mode**

Show dependencies in tree for console.

.. sourcecode:: plaintext

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

**code**

The code is available in the github repository https://github.com/badele/garchdeps
