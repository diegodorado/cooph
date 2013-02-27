---
title: Crear repositorios
tags: wiki
---

PARA CREAR UN REPOSITORIO:

    Con el comando sudo svnadmin create [nombre_repo] en el directorio /home/svn

PARA MODIFICAR LOS PRIVILEGIOS:

    Con el comando chgrp -R modificar el Grupo
    Con el comando chmod -R 770 filename modificar los permisos
    La opción -R es para que la modificacion sea recursiva

PARA HABILITAR UN REPOSITORIO:

    Editar el archivo etc/apache2/mods-available/dav_svn.conf
    Agregando un bloque similar a los que ya estan.
    Restartear apache: sudo /etc/init.d/apache2 reload
