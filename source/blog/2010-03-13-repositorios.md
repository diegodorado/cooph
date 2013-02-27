---
title: Repositorios
tags: wiki
---

Vamos a realizar un repositorio sobre el VPS!

\

Contenido
---------

-   [1 $ sudo svnadmin create
    [nombre\_repositorio]](#.24_sudo_svnadmin_create_.5Bnombre_repositorio.5D)
-   [2 $ sudo chown -R cope:subversion
    [nombre\_repositorio]](#.24_sudo_chown_-R_cope:subversion_.5Bnombre_repositorio.5D)
-   [3 $ sudo chmod -R 770
    [nombre\_repositorio]](#.24_sudo_chmod_-R_770_.5Bnombre_repositorio.5D)
-   [4 $ sudo /etc/init.d/apache2
    reload](#.24_sudo_.2Fetc.2Finit.d.2Fapache2_reload)

$ sudo svnadmin create [nombre\_repositorio]
--------------------------------------------

Primero creamos el repositorio que vamos a utilizar. Es importante estar
parado para esto dentro de /home/svn; que es donde van a ir todos los
repositorios dentro de nuestro VPS.

\

$ sudo chown -R cope:subversion [nombre\_repositorio]
-----------------------------------------------------

Luego vamos a indicarle que va a pertenecer al usuario "cope" y va a
estar dentro del grupo "subversion", a esa carpeta, y a todos los
archivos y carpetas que se encuentren dentro recursivamente. Aquí
debemos estar parados también dentro de /home/svn

\

$ sudo chmod -R 770 [nombre\_repositorio]
-----------------------------------------

Luego le vamos a decir que los archivos aquí dentro, pueden ser
escritos, leídos y ejecutados por el propietario (en este caso "cope"),
y por el dueño del grupo (en este caso "subversion"), y para los
restantes grupos y usuarios no les damos permisos de nada. También
parados sobre /home/svn

\

Editamos el archivo /etc/apache2/mods-available/dav\_svn.conf, y
agregamos un bloque similar a los que están.

\

$ sudo /etc/init.d/apache2 reload
---------------------------------

Finalmente reiniciamos el apache
