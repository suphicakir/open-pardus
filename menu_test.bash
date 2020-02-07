#!/bin/bash
# sysinfo.run
STDOUT=/tmp/stdout.txt.$$
STDERR=/tmp/stderr.txt.$$
SECENEK=/tmp/secenek.txt.$$
BACKTITLE="nano Kurulum uygulaması ( bash script ) v.1.0.0"
dialog --clear --backtitle "$BACKTITLE" --title "[ ANA MENÜ ]" \
--menu "nan kurulum uygulaması seçenekleri. yön tuşları, harfler ve rakamları kullanabilirsiniz." 15 55 6 \
1 "Kur" \
2 "Kaldır" \
3 "Kontrol et" \
4 "Programı sonlandır" 2>"${SECENEK}"