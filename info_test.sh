#!/bin/bash
STOUT=/tmp/stdtest1.txt
STERR=/tmp/stdtest1.txt
BACKTITLE="bilgis"
dialog --begin 3 3 --clear --backtitle "$BACKTITLE" --title "Kurulum bilgisi STDOUT" \
--textbox /tmp/stdtest1.txt 30 150
dialog --begin 3 3 --clear --backtitle "$BACKTITLE" --title "Kurulum bilgisi STDERR" \
--textbox /tmp/stdtest2.txt 30 150