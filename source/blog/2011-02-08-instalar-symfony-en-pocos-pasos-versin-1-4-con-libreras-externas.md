---
title: Instalar Symfony en pocos pasos (versión 1.4 con librerías externas)
tags: wiki
---

Contenido
---------

-   [1 Crear el directorio que contendrá todos los archivos del
    proyecto](#Crear_el_directorio_que_contendr.C3.A1_todos_los_archivos_del_proyecto)
-   [2 Crear dentro un directorio para instalar los archivos de
    symfony](#Crear_dentro_un_directorio_para_instalar_los_archivos_de_symfony)
-   [3 Instalar los archivos de Symfony 1.4 (o la versión que
    queramos)](#Instalar_los_archivos_de_Symfony_1.4_.28o_la_versi.C3.B3n_que_queramos.29)
-   [4 Generar la estructura del
    proyecto](#Generar_la_estructura_del_proyecto)
-   [5 Directorios en donde symfony escribe (LOG y
    CACHE)](#Directorios_en_donde_symfony_escribe_.28LOG_y_CACHE.29)
-   [6 Configurar el virtualhost](#Configurar_el_virtualhost)

Crear el directorio que contendrá todos los archivos del proyecto
-----------------------------------------------------------------

Tener cuidado que la ruta no contenga espacios Supongamos que es
C:\\proyectos\\miproyecto\\sitio Hacer un checkout del repo vacío.

Crear dentro un directorio para instalar los archivos de symfony
----------------------------------------------------------------

Convencionalmente lib\\vendor En nuestro caso:
C:\\proyectos\\miproyecto\\sitio\\lib\\vendor

Instalar los archivos de Symfony 1.4 (o la versión que queramos)
----------------------------------------------------------------

-   **Por línea de comandos**

<!-- -->

    svn propedit svn:externals lib/vendor

añadir la siguiente línea

    symfony http://svn.symfony-project.com/branches/1.4

y finalmente hacer un update

    svn update

-   **Para WIN**

Con TortoiseSVN sobre la carpeta lib\\vendor

    Botón Derecho >> TortoiseSVN >> Properties >> Add...

En la ventana que se abre seleccionar del combo Property name:
svn:externals En Propertie Value pegar symfony
[http://svn.symfony-project.com/branches/1.4/](http://svn.symfony-project.com/branches/1.4/)
Hacer un Update, lo cual va a descargar los archivos de Symfony en ese
directorio

Generar la estructura del proyecto
----------------------------------

Parado en el directorio C:\\proyectos\\miproyecto\\sitio ejecutar:

    php lib/vendor/symfony/data/bin/symfony generate:project miproyecto

Directorios en donde symfony escribe (LOG y CACHE)
--------------------------------------------------

Dar permisos de escritura (win vista y 7) Agregarlos a la ignore list
(Botón Derecho \>\> Add to ignore list)

Configurar el virtualhost
-------------------------

    <VirtualHost *:80>
     ServerName amapola
     DocumentRoot "C:\proyectos\miproyecto\sitio\web"
     DirectoryIndex index.php
     <Directory "C:\proyectos\miproyecto\sitio\web">
      AllowOverride All
      Allow from All
     </Directory>
    # ver NOTA
    # Alias /sf "C:\proyectos\miproyecto\sitio\lib\vendor\symfony\data\web\sf"
     <Directory "C:\proyectos\miproyecto\sitio\lib\vendor\symfony\data\web\sf">
      AllowOverride All
      Allow from All
     </Directory>
    </VirtualHost>

NOTA: El Alias a web/sf/ permite al apache encontrar algunos archivos
(imágenes, estilo y js) para la barra de debug, el admin generator y
otras cosas. Una alternativa es crear un link simbólico (symlink). Otra
alternativa (recomenda) es copiar el directorio
/lib/vendor/symfony/data/web/sf/ en /web/sf/ porque en definitiva a la
hora de implementar el sitio hay que hacer esta. (Ojo con las carpetas
.svn)

* * * * *

Para información más detallada consultar el sitio de symfony:
[http://www.symfony-project.org/installation](http://www.symfony-project.org/installation)
Consultar también por el instalador que compiló Diego
