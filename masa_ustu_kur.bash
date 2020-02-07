#!/bin/bash
# GNU/Linux Mint 14 Masa üstü Ortamları Kurulum / Kaldırma Uygulaması
###############################################################################
# Ortam Değişkenleri
BACKTITLE="GNU/Linux Mint 14 Masa üstü Ortamları Kurulum / Kaldırma Uygulaması"
STDOUT=/tmp/stdout.txt.$$
STDERR=/tmp/stderr.txt.$$
STDMEN=/tmp/stdmen.txt.$$

#sudo add-apt-repository ppa:hannes-janetzek/enlightenment-svn
#sudo apt-get update
#sudo apt-get install e17

###############################################################################
# Karşılama Fonksiyonu tanımlanıyor.
function karsilama () {
dialog --backtitle "$BACKTITLE" --title "Karşılama..." --infobox "( rsync ) Dosya Kopyalama uygulamasına hoş geldiniz.\nHenüz TEST aşamasında\nDevam etmek için her hangi bir tuşa basınız..." 6 85;read
}
###############################################################################
# Temizle Fonksiyonu tanımlanıyor.
function temizle () {
[ -f $STDOUT ] && rm $STDOUT
[ -f $STDERR ] && rm $STDERR
[ -f $STDMEN ] && rm $STDMEN
}
###############################################################################
# Kaynak Fonksiyonu tanımlanıyor.
function kaynak_sec () {
KAYNAK=$(dialog --stdout --backtitle "$BACKTITLE" --title "Lütfen Dosya Kopyalamanın KAYNAK' ına ait Klasörü veya Dosyayı seçiniz..." --dselect "${KAYNAK}" 15 85)
islem
}
###############################################################################
# Hedef Fonksiyonu tanımlanıyor.
function hedef_sec () {
HEDEF=$(dialog --stdout --backtitle "$BACKTITLE" --title "Lütfen Dosya Kopyalamanın yapılacağı HEDEF Klasörü seçiniz..." --dselect "${HEDEF}" 15 85)
islem
}
###############################################################################
# Yedekle Fonksiyonu tanımlanıyor.
function kopyala () {
#echo rsync -avrpogtP "${KAYNAK}" "${HEDEF}" 2>> "${STDERR}" ;read
rsync -avrpogtP "${KAYNAK}" "${HEDEF}" 2>> "${STDERR}" | dialog --backtitle "$BACKTITLE" --title "Kopyalama Yapılıyor..." --programbox "Kopyalamanın Yapılacağı :\n\nKAYNAK : ${KAYNAK}\nHEDEF  : ${HEDEF}\n\nDosya/Dizinler Kopyalanırken lütfen bekleyiniz..." 35 85
islem
}
###############################################################################
# Hata Bilgisi Gösterme Fonksiyonu tanımlanıyor.
function hata_goster () {
dialog --backtitle "$BACKTITLE" --title "Hata Bilgisi" --textbox "${STDERR}" 35 85
islem
}
###############################################################################
# Çıkış Fonksiyonu tanımlanıyor.
function uygulamadan_cikis (){
dialog --backtitle "$BACKTITLE" --title "Çıkış?" --yesno "Uygulamadan çıkmak istediğinize emin misiniz?" 6 85
case $? in
	0) 
	temizle
	clear	
	exit
	;;
	1) 
	islem
	;;
	255) 
	islem
	;;
esac
}
###############################################################################
# İslem Fonksiyonu tanımlanıyor.
function islem () {
trap "rm $STDOUT; rm $STDERR; rm $STDMEN; exit" SIGHUP SIGINT SIGTERM
dialog --clear --backtitle "$BACKTITLE" --title "[ ANA MENÜ ]" --menu "Dosya Kopyalama uygulaması ana menü\nKAYNAK    : ${KAYNAK}\nHEDEF     : ${HEDEF} " 15 85 10 \
KAYNAK "Kaynak klasör veya dosya seçiniz." \
HEDEF "Hedef klasör veya dosya seçiniz." \
KOPYALA "Dosya Kopyalama işlemini başlat." \
HATA "Hata özetini göster (/tmp/stderr.txt.$$)." \
ÇIKIŞ "Uygulamadan çıkın." 2>"${STDMEN}"

DURUM=$(<"${STDMEN}")
case $DURUM in
	KAYNAK)
	kaynak_sec
	;;
	HEDEF)
	hedef_sec
;;
	KOPYALA)
	kopyala
;;	
	HATA)
	hata_goster
;;
	ÇIKIŞ)
	uygulamadan_cikis
	;;
esac
}
###############################################################################
# Ana  Uygulama tanımlanıyor.
karsilama
islem
temizle
clear
exit


