---
title: Configurar vhost
tags: wiki
---

1:

    Crear un archivo en /etc/apache2/sites-available a partir de otro de los que estan en ese directorio.
    Modificarle las 3 líneas evidentes.

2:

    Crear el link en .../sites-enabled con "ln -s source destiny".
    Mejor aún, estando en available... sudo a2ensite [nombrearchivo]

3:

    Restartear apache con /etc/init.d/apache2 restart (o reload)
