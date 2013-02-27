---
title: IE para Ubuntu
tags: wiki
---

Primero cabe aclarar que instalando este paquete, tendrás la opción de
instalar las versiones 5 / 5.5 y 6.0 de Internet Explorer. Y que estas
versiones estan pensadas para que diseñadores y Programadores de paginas
web, lo usen con la sola intención de comprobar que lo q están
realizando funciona también correctamente en el IE. Entonces para
navegar continuemos usando el FireFox que funciona más que bien y su
código fuente es software libre, publicado bajo una triple licencia
GPL/LGPL/MPL, realizado por Corporación Mozilla y un gran número de
voluntarios externos.

Comencemos:

Primero tienes que habilitar los paquetes universe. También se
recomienda que utilices el paquete winehq oficial de Ubuntu:

\
 1) Abre una terminal

\
 2) Abre /etc/apt/sources.list

     $ sudo gedit /etc/apt/sources.list

\
 3) Descomenta las siguientes líneas:

deb http://us.archive.ubuntu.com/ubuntu edgy universe

deb-src http://us.archive.ubuntu.com/ubuntu edgy universe

\
 4) Agrega esta línea:

deb http://wine.budgetdedicated.com/apt edgy main

\

\5) Cierra gedit. Actualiza e instala wine y cabextract:

    $ sudo apt-get update
    $ sudo apt-get install wine cabextract

\6) Descarga e instala IEs4Linux

    $ wget http://www.tatanka.com.br/ies4linux/downloads/ies4linux-latest.tar.gz
    $ tar zxvf ies4linux-latest.tar.gz
    $ cd ies4linux-*
    $ ./ies4linux
