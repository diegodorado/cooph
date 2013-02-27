---
title: Reinstalar el GRUB despues de que el WINDOWS lo elimine
tags: wiki
---

Si usas Linux y Windows, despues de tu reinstalacion mensual de Windows,
no ves mas el bootloader GRUB, por lo tanto, no podés iniciar Linux.

Esta es la forma de reinstalar el GRUB.

\1) Arrancar con un LiveCD

\2) Abrir un Terminal

Ejecutar

    sudo grub
    > find /boot/grub/stage1   #esto devuelve algo de la pinta (hdx,y)
    > root (hdx,y)             #segun lo obtenido antes 
    > setup (hdx)              #segun lo obtenido antes   
    > quit

Reiniciar (quitando el livecd), y todo volverá a la normalidad.

* * * * *

* * * * *

Si no funciona esa forma, aca paso una alternativa

     1) Arrancar un Live CD de Ubuntu.

\2) Una vez que se inicia el Sistema Operativo. Abrir una terminal y
crear una carpeta.

     $ sudo mkdir /mnt/linux

\3) Montar la particion de linux en el directorio recien creado.

Nota: para ver la particion (sda2 en este ejemplo, puede ser distinta)
que tenemos ubuntu, podemos ver con este comando:

sudo fdisk -l

y ver en qué partición está el XP. Sale una cosa así:

Disposit. Inicio Comienzo Fin Bloques Id Sistema

/dev/sda1 1277 10257471 83 Linux

/dev/sda2 \* 1278 3824 20458777+ 7 HPFS/NTFS

/dev/sda3 3825 14462 85449735 83 Linux

/dev/sda4 14463 14593 1052257+ 82 Linux swap / Solaris

     $ sudo mount /dev/sda2 /mnt/linux

\4) Por ultimo ejecutamos:

     sudo grub-install --root-directory=/mnt/linux /dev/sda

Nota: "sda" se utiliza sin número porque se carga en la MBR principal.
(cambiar "sda" por la particion en donde este el MBR) /dev/sda es si
tenés un disco SATA, cuando es PATA es /dev/hda . Y eso es si es el diso
maestro en el canal IDE primario, si es un esclavo es hdb y si está en
el IDE secundario es hdc o hdd dependiendo si es maestro o esclavo.

    Reiniciamos y listo :)
