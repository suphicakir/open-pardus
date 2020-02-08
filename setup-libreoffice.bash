#! /bin/bash
# Libreoffice 4.0 İndirme ve kurulum programı.

# Mevcut sürümü kaldır.
#sudo apt-get purge libreoffice*.*

#LibreOffice 4.0 sürümünü indir.
#echo "LibreOffice 4.0.0 indirme işlemi başlatıldı..."
#echo "LibreOffice_4.0.0_Linux_x86_deb.tar.gz indiriliyor..."
#aria2c -x16 http://download.documentfoundation.org/libreoffice/stable/4.0.0/deb/x86/LibreOffice_4.0.0_Linux_x86_deb.tar.gz
#echo "LibreOffice_4.0.0_Linux_x86_deb_langpack_tr.tar.gz indiriliyor..."
#aria2c -x16 http://download.documentfoundation.org/libreoffice/stable/4.0.0/deb/x86/LibreOffice_4.0.0_Linux_x86_deb_langpack_tr.tar.gz
#echo "LibreOffice_4.0.0_Linux_x86_deb_helppack_tr.tar.gz indiriliyor..."
#aria2c -x16 http://download.documentfoundation.org/libreoffice/stable/4.0.0/deb/x86/LibreOffice_4.0.0_Linux_x86_deb_helppack_tr.tar.gz
#echo "İndirme işlemi bitti"

# İndirilen LibreOffice tar dosyaları açışıyor.

#echo "tar -xvf LibreOffice_4.0.0_Linux_x86_deb.tar.gz [ Açılıyor ]"
#tar -xvf LibreOffice_4.0.0_Linux_x86_deb.tar.gz

#echo "tar -xvf LibreOffice_4.0.0_Linux_x86_deb_helppack_tr.tar.gz [ Açılıyor ]"
#tar -xvf LibreOffice_4.0.0_Linux_x86_deb_helppack_tr.tar.gz

#echo "tar -xvf LibreOffice_4.0.0_Linux_x86_deb_langpack_tr.tar.gz [ Açılıyor ]"
#tar -xvf LibreOffice_4.0.0_Linux_x86_deb_langpack_tr.tar.gz


#Açılan klasörlerde bulunan *.deb dosyaları dpkg -i *.deb komutu ile aşağıdaki sırayla kurulacak.
echo "[ ./LibreOffice_4.0.0.3_Linux_x86_deb/DEBS ] dizini altındaki tüm *.deb dosyaları kurulacak..."
sudo dpkg -i ./LibreOffice_4.0.0.3_Linux_x86_deb/DEBS/*.deb

echo "[ ./LibreOffice_4.0.0.3_Linux_x86_deb/DEBS/desktop-integration ] dizini altındaki tüm *.deb dosyaları kurulacak..."
sudo dpkg -i ./LibreOffice_4.0.0.3_Linux_x86_deb/DEBS/desktop-integration/*.deb

echo "[ ./LibreOffice_4.0.0.3_Linux_x86_deb_helppack_tr/DEBS ] dizini altındaki tüm *.deb dosyaları kurulacak..."
sudo dpkg -i ./LibreOffice_4.0.0.3_Linux_x86_deb_helppack_tr/DEBS/*.deb

echo "[ ./LibreOffice_4.0.0.3_Linux_x86_deb_langpack_tr/DEBS ] dizini altındaki tüm *.deb dosyaları kurulacak..."
sudo dpkg -i ./LibreOffice_4.0.0.3_Linux_x86_deb_langpack_tr/DEBS/*.deb

