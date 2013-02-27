---
title: Crear Proyecto Symfony
tags: wiki
---

crear la carpeta del proyecto

     $ mkdir /home/usuario/proyectos/proyecto1

"pararse" en la carpeta del proyect (siempre, para ejecutar un comando
symfony)

     $ cd /home/usuario1/proyectos/proyecto1

iniciar el proyecto

     $ symfony init-project proyecto1

iniciar la aplicacion del frontend (la aplicacion principal)

     $ symfony init-app frontend

ya estamos...solo resta crear un virtual host para esta web

NameVirtualHost 127.0.0.1:80

     <VirtualHost 127.0.0.1:80>
       ServerName proyecto1
       DocumentRoot "/home/usuario1/proyectos/proyecto1/web"
       DirectoryIndex index.php
       Alias /sf /usr/local/lib/php/data/symfony/web/sf
     
       <Directory "/home/usuario1/proyectos/proyecto1/web">
        AllowOverride All
       </Directory>
     </VirtualHost>

esto es lo basico. para mayor informacion ir a [la pagina de
symfony](http://www.symfony-project.org)
