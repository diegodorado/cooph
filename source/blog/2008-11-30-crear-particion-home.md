---
title: Crear particion /home
tags: wiki
---

1.  Carga gparted u otro programa para particionar con un LiveCD.
2.  Crea una partición logica en formato ReiserFS.
3.  Aplica los cambios.

Anota como se llama esa partición.

Una vez creada la partición montala en un directorio de nombre
temporario para poder copiar a ella los archivos del /home original.

Creas el directorio y montas la particion

    sudo mkdir /media/hometemp
    sudo mount /dev/nombredelaparticion /media/hometemp

Para copiar:

    cd /home
    sudo cp -ax . /media/hometemp

Esta última linea es la única que sirve para clonar, atención con "."

Ahora montas el nuevo /home previo renombrar el /home viejo.

    cd /
    sudo mv /home /home.old
    sudo mkdir /home
    sudo mount /dev/nombredelaparticion /home

Ahora tienes que averiguar la UUID de la partición y editar el
/etc/fstab, para montar la partición al inicio. Respalda antes
/etc/fstab

    sudo cp /etc/fstab /etc/fstab.old
    sudo vol_id --uuid /dev/nombre de la partición
    sudo gedit /etc/fstab

Y añades estas lineas al final.

    #/dev/nombredelaparticion
    UUID=a673dafc-1032-45c2-a1b4-a615703bdaaf /home reiserfs defaults 1 2

Reemplaza el valor despues de = por el de tu partición

Al reiniciar tendrás todo funcionando exactamente igual, pero con
particiones separadas.

Una vez que todo esta funcionando bien, borras el /home.old.

\

Problemas?
----------

Podés volver atras teniendo respaldado tu home y fstab Inicia por
consola aprueba de fallos ( o con un LiveCD si esto no funciona)

    sudo mv /home /home.new
    sudo mv /home.old /home
    sudo cp /etc/fstab /etc/fstab.new
    sudo cp /etc/fstab.old /etc/fstab

Reinicia el sistema y debería funcionar como antes.

\

Fuentes
-------

-   [ubuntu-es.org](http://www.ubuntu-es.org/index.php?q=node/75626)
-   [Trauko's
    Blog](http://trauko.wordpress.com/2007/11/06/crear-una-particion-home-separada-en-ubuntu/)

sudo rm /home.old
