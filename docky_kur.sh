#!/bin/bash
# docky
mkdir dockbarx-mate
cd dockbarx-mate
wget -c http://dl.dropbox.com/u/35943691/Dosyalar/dockbarx_0.48.mate.tar.gz
tar xvf dockbarx_0.48.mate.tar.gz
sudo ./setup.py install
killall mate-panel
