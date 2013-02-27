---
title: Instalarlo y Primeros Pasos
tags: wiki
---

Instalar [GIT](http://git-scm.com/download), para bajarse Symfony2. En
Fedora, Red Hat, centOS (como root):

     $ yum install git

Luego, bajamos el repo del symfony2:

     # git clone https://github.com/symfony/symfonysandbox.git carpeta_destino

ops, en mi computadora esto no me funciona, me tira el siguiente error:

     Cloning into symfony2...
     fatal: https://github.com/symfony/symfonysandbox.git/info/refs not found: did you run git update-server-info on the server?

Habría que solucionar este problema, por el momento no logro hacerlo. Lo
dejo en manos de otro wikiman capaz.

Instalamos Symfony2 con otro método más simple. Vamos a [siti oficial de
Symfony2](http://symfony.com/download) y aquí bajamos alguna de las
primeas dos versiones (.tgz o .zip) Luego descomprimimos:

     # tar -xvf Symfony_Standard_Vendors_2.0.12.tgz

y copiamos los archivos en la carpeta destino:

     # cp Symfony/* /var/www/html/carpeta_destino -Rv

Ahora debemos crear el virtualhost correspondiente hacia /web (esto es
lo mismo con symfony 1), y que las carpetas tengan los permisos
correspondientes, esta vez log y cache están en /app/cache y /app/logs.
Ya todo es correcto, y entonces reiniciamos el servicio httpd y todo
deberia comenzar a funcionar:

     # service httpd restart (para Fedora, Redhat, centOS)

Vamos al explorador ahora. Ingresamos en la barra de dirección:
[http://symfony2/app\_dev.php](http://symfony2/app_dev.php) Y nos
deberia aparecer la página de inicio del symfony2. Con varias opciones.
Perfecto! Hemos iniciado Symfony2.

\
 Ahora vayamos a la siguiente dirección:
[http://symfony2/config.php](http://symfony2/config.php) Aquí nos va a
decir si existiese algún problema para correr symfony2 sobre nuestro
servidor, y nos va a decir algunas recomendaciones por las cuales el
framework funcionaria más eficientemente. También podemos configurar
desde aquí algunas cositas de las bases de datos, y cosas básicas.

En mi caso me decia que instale un PHP accelerator, como APC, que
habilite intl, que cambie el valor de short\_open\_tag a off, y que
instale php\_posix.

Instalé php\_posix:

     # yum install php-process

Lo demás por el momento lo dejé como estaba

Ahora sí, tenemos que comenzar a usar este fabuloso framework. Para esto
por el momento recomiendo hacer el siguiente tutorial, totalmente
práctico, parecido al jobeet para la version 1 del Symfony, pero con la
creación de un blog!! Aquí dejo en link: [pinche
lenovo](http://symblog.site90.net/index.html)
