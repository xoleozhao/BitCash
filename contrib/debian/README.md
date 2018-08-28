
Debian
====================
This directory contains files used to package bitcashd/bitcash-qt
for Debian-based Linux systems. If you compile bitcashd/bitcash-qt yourself, there are some useful files here.

## bitcash: URI support ##


bitcash-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install bitcash-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your bitcash-qt binary to `/usr/bin`
and the `../../share/pixmaps/bitcash128.png` to `/usr/share/pixmaps`

bitcash-qt.protocol (KDE)

