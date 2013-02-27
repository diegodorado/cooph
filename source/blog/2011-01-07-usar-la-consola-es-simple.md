---
title: Usar la consola es simple
tags: wiki
---

Usar la consola es simple. Y en muchos casos mas conveniente que
utilizar aplicaciones para las mismas operaciones.

Siempre que se pueda, claro. Pero es mas rapido por ejemplo subir un
tarball (.tar.gz) del sitio + db por ftp, y luego, en el servidor
descomprimirlo y cargar la db.

Contenido
---------

-   [1 Usando TAR](#Usando_TAR)
-   [2 Usando MySQL](#Usando_MySQL)
    -   [2.1 Otros comandos](#Otros_comandos)

-   [3 Usando FTP](#Usando_FTP)

Usando TAR
----------

Para comprimir todos los archivos de un directorio:

     tar cfz sitio.tar.gz *

Luego, para descomprimirlo:

     tar xvfz sitio.tar.gz

\

Usando MySQL
------------

Para crear una base de datos:

    mysql -u username -p
    mysql> create database databasename; #desde la consola mysql

Para crear un backup (dump):

    mysqldump -u username -p databasename > databasename-dump.sql

\
 Para levantar un backup:

     mysql -u username -p databasename < databasename-dump.sql

*este comando pasa una serie de instrucciones SQL que se encuentran en
databasename-dump.sql (sean las que fueren) a la consola de mysql, por
lo tanto hay que tener en cuenta que la db debe estar vacía.*

\

### Otros comandos

Para salir de la consola:

    mysql> exit;

Para listar las tablas de una base de datos:

    mysql -u username -p databasename
    mysql> show tables;

Para mostrar el resultado de una consulta:

    mysql> select * from table;

No olvidar terminar las instrucciones con punto y coma (;)

\

Usando FTP
----------

Esto lo propongo como una forma practica de enviar o descargar un
archivo por ftp (por ejemplo, un tarball del sitio). De tratarse de
varios archivos, es mas simple utilizar un programa con interfaz visual.

Para conectarse a un servidor:

    ftp servidor # opcion 1, ejemplo: ftp cooph.com.ar
    ftp ip       # opcion 2, ejemplo: ftp 201.125.123.2 

ó

    ftp
    ftp> open servidor  # desde la consola del ftp

Estos comandos pedirán usuario y contraseña para acceder. (Notar que aún
abierta la consola ftp puede que no se haya conectado al servidor) Una
vez en la consola ftp, podemos ejecutar comandos localente, o en el
servidor. Hay que tener en cuenta que localmente estamos parados en el
directorio donde estabamos antes de ejecutar ftp Son muchisimos los
comandos que se pueden ejecutar por ftp. Me limito a citar como listar
contenidos, cambiar de directorio, subir y bajar archivos.

    ftp> ls               # lista archivos en el servidor
    ftp> !ls              # lista archivos locales
    ftp> cd directorio    # cambia a la carpeta 'directorio' en el servidor
    ftp> lcd directorio   # cambia a la carpeta 'directorio' localmente
    ftp> put file         # sube 'file' al servidor
    ftp> get file         # descarga 'file' al disco local

Esto es suficiente para una administración básica de ftp por consola.
