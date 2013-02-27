---
title: Implementacion
tags: wiki
---

Implementacion provisoria de una demo en el VPS
-----------------------------------------------

1.  renombrar la carpeta public\_html de la home de la cuenta del
    dominio
2.  crear un link simbolico llamado public\_html que apute a la carpeta
    web de la demo

Ej.:

     mv /home/plantilla1/public_html /home/plantilla1/public_html.original
     ln -s /home/ruta-a-la-demo/ /home/plantilla1/public_html

Implementacion definitiva de una demo en el VPS
-----------------------------------------------

Pasos para un sitio hecho con symfony

1.  Reestablecer la carpeta de la home del dominio como originalmente
    las creara el WHM (eliminar links simbolicos, etc)
2.  Copiar el contenido de la demo a la home del dominio ( no copiar
    cache ni log... o bien, eliminarlos luego)
3.  Eliminar todos los archivos .svn si se hubieran copiado en el punto
    anterior
4.  Reemplazar los links simbolicos por los contenidos de las carpetas a
    las que apuntan
5.  Clonar las bases de datos y configurarlas ( no olvidar el clear
    cache)
6.  Reestablecer los dueños y grupos de los archivos
7.  Poner como grupo a 'nobody' para la carpeta public\_html
8.  Chequear permisos de carpetas que deben ser "escribibles" ( log,
    cache, public\_html/uploads, y data/a\_writable en caso de
    apostrophe)

No olvidar cambiar la configuracion de la carpeta web:

     // config/ProjectConfiguration.class.php
     class ProjectConfiguration extends sfProjectConfiguration
     {
       public function setup()
       {
         $this->setWebDir($this->getRootDir().'/public_html');
       }
     }

Chequear que se pueda subir una imagen.
