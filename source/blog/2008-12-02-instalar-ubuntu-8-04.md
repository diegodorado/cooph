---
title: Instalar Ubuntu 8.04
tags: wiki
---

Contenido
---------

-   [1 CD de Instalación](#CD_de_Instalaci.C3.B3n)
-   [2 Preparar particiones](#Preparar_particiones)
-   [3 Gestor de actualizaciones](#Gestor_de_actualizaciones)
-   [4 Controladores de Hardware](#Controladores_de_Hardware)
-   [5 Gestor de Paquetes Synaptics](#Gestor_de_Paquetes_Synaptics)

### CD de Instalación

-   Conseguir un cd de instalacion de Ubuntu.
-   Reiniciar la maquina con el CD en la lectora.

### Preparar particiones

-   Cear una partición primaria ext3 en '/' de 20 GB
-   Cear una particion como área de intercambio de 1GB
-   Crear una particion logica ReiserFS en '/home' del resto del disco

Tener el home en una particion aparte, permite reinstalar el sistema sin
perder archivos ni configuraciones

### Gestor de actualizaciones

-   Instalar todos

### Controladores de Hardware

Esto instala los drivers propietarios que han hecho su version para
LINUX

### Gestor de Paquetes Synaptics

Esto es todo lo que necesite instalar:

    *ubuntu-restricted-extras
    *mysql-server
    **mysql-admin
    **mysql-query-browser
    *apache2
    *php5
    **php-pear
    **php5-mysql
    *vlc
    *firebug
    *gftp-gtk
    *quanta
    *rapidsvn
    *wine

Todo esto se puede instalar con un solo comando:

     sudo apt-get install ubuntu-restricted-extras mysql-server ... rapidsvn wine
