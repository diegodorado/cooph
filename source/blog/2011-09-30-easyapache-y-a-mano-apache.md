---
title: EasyApache y a-mano-apache
tags: wiki
---

En un servidor con WHM/Cpanel, si se hicieron configuraciones del apache
"a mano", hay que tener ciertas precauciones para recompilar apache
utilizando EasyApache (que de todos modos es lo recomendado para que el
WHM/Cpanel haga su "magia")

En este caso, faltaban los modulos de svn para compilar apache con
EasyApache, por tanto, los configuré manualmente. Estos son los modulos
que faltan en el EasyApache y que compilé manualmente

-   /usr/local/apache/modules/mod\_authz\_svn.so
-   /usr/local/apache/modules/mod\_dav\_svn.so

\

En /usr/local/apache/conf/includes/pre\_main\_global.conf, comentar las
lineas que van a traer conflictos de este modo:

     #LoadModule dav_svn_module modules/mod_dav_svn.so
     #LoadModule authz_svn_module modules/mod_authz_svn.so
     #
     #<Location /svn>
     # DAV svn
     # Require valid-user
     # SVNParentPath /home/hormigon/usvn/files/svn
     # SVNListParentPath off
     # AuthType Basic
     # AuthName "SVN Cooperativa Hormigon"
     # AuthUserFile /home/hormigon/usvn/files/htpasswd
     # AuthzSVNAccessFile /home/hormigon/usvn/files/authz
     #</Location>

Esto es para que al compilar el apache, no haya errores de sintaxis ( ya
que estos modulos, no existen en esta version de EasyApache)

Luego, compilar apache con EasyApache.

Si todo va bien, copiar los modulos \*svn del backup al nuevo build:

     cp /usr/local/apache.backup/modules/*svn.* /usr/local/apache/modules/

Ahora que tenemos los modulos \*svn, podemos descomentar las lineas de
/usr/local/apache/conf/includes/pre\_main\_global.conf y restartear el
apache

Fin.
