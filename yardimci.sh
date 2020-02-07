#!/bin/bash
# yardimci.run
# belirlenen dizin ve alt dizinleri, kullanıcısını ve gurubunu değiştirmek için kullanlır.

###############################################################################################
#
#            Değişkenler
#
BACKTITLE="Yardımcım (suphicakir@gmail.com)"
DIZIN=/tmp/dizin.txt
KULLANICI=/tmp/kullanici.txt
GRUP=/tmp/grup.txt

# Boş dosya oluştur.
>$DIZIN
>$KULLANICI
>$GRUP
trap "rm $DIZIN;rm $KULLANICI;rm $GRUP; exit" SIGHUP SIGINT SIGTERM
###############################################################################################

###############################################################################################
#
#            Fonksiyonlar
#
function uygulama_baslat() {

# Dizin bilgisi alınıyor.
dialog --clear --backtitle "$BACKTITLE" --title "Dizin Bilgisi" --inputbox "Lütfen dizin patikasını giriniz" 8 70 2>$DIZIN
durum=$?
dizin_yolu=$(<$DIZIN)
case $durum in
  0)
    dialog --clear --backtitle "$BACKTITLE" --title "Kullanıcı Bilgisi" --inputbox "Lütfen Kullanıcı Adını giriniz" 8 70 2>$KULLANICI
    kullanici_adi=$(<$KULLANICI)
    dialog --clear --backtitle "$BACKTITLE" --title "Grup Bilgisi" --inputbox "Lütfen Grup Adını giriniz" 8 70 2>$GRUP
    grup_adi=$(<$GRUP)
    dialog --backtitle "$BACKTITLE" --title "İşlem yapılıyor ..." --infobox "chown -R $kullanici_adi $dizin_yolu --> işlem gerçekleştiriliyor " 6 70;chown -R "$kullanici_adi" "$dizin_yolu" 2>/tmp/hata1.txt
    dialog --backtitle "$BACKTITLE" --title "İşlem yapılıyor ..." --infobox "chgrp -R $grup_adi $dizin_yolu --> işlem gerçekleştiriliyor " 6 70;chgrp -R "$grup_adi" "$dizin_yolu" 2>/tmp/hata2.txt
    dialog --backtitle "$BACKTITLE" --title "İşlem Tamamlandı ..." --infobox "Programdan çıkmak için her hangi bir tuşa basınız... " 6 70;read
    clear
  ;;
  1)
  dialog --backtitle "$BACKTITLE" --title "İşlem İPTAL ..." --infobox "Programdan çıkmak için her hangi bir tuşa basınız... " 6 70;read
  ;;
  255)
  dialog --backtitle "$BACKTITLE" --title "İşlem İPTAL ..." --infobox " ESC Programdan çıkmak için her hangi bir tuşa basınız... " 6 70;read
  ;;
esac
}
###############################################################################################

###############################################################################################
#
#            Buradan Başla
#
###############################################################################################
uygulama_baslat
