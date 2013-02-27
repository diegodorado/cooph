---
title: Despúes de instalarlo . . .
tags: wiki
---

Despúes de instalarlo, hay algunos paquetes que podemos agregar para que
nuestro sistema funciona perfectamente y sea cómodo.

Instalamos un paquete para que yum encuentre más rapidamente los repo
donde están los paquetes, del repo más cercano.

     # yum install yum-fastestmirror

En el menú principal del fedora, por defecto no tenemos un 'apagar'.
Entonces instalamos un paquete para que aparezca. Luego de hacerlo
debemos cerrar sesión, y abrir nuevamente. (mo me funcionó en Fedora16,
sí para la 15)

     # yum install gnome-shell-extensions-alternative-status-menu

Instalamos FlashPlayer, para Fedora 64bit. Luego hay que reiniciar el
firefox. (Verificar los últimos flashplayer, quizás sea obsoleto ya)

     # yum install wget
     # cd /tmp
     # wget http://download.macromedia.com/pub/labs/flashplatformruntimes/flashplayer11/flashplayer11_b2_install_lin_64_080811.tar.gz
     # tar xzvf flashplayer11_b2_install_lin_64_080811.tar.gz
     # cp libflashplayer.so /usr/lib64/mozilla/plugins/
     # cp -R usr/ /

Instalamos FlashPlayer, para Fedora 32bit. Luego hay que reiniciar el
firefox.

     # rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-i386-1.0-1.noarch.rpm
     # rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
     # yum update
     # yum install flash-plugin

Instalar unrar
[[1]](http://www.howopensource.com/2011/08/how-to-extract-rar-files-in-fedora-15/)

\
 Instalamos un screen saver (la gente de GNOME3 les desagrada el tema
del protector de pantalla y no ponen más :( )

     # yum install xscreensaver

Luego lo configuramos, ya nos va a aparecer en la lista de 'Other' u
'All' en el Fedora; es simple.
