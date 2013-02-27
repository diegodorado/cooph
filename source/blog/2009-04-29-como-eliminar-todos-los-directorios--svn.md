---
title: Como eliminar todos los directorios .svn?
tags: wiki
---

Ejecutar:

     rm -rf `find . -type d -name .svn`

Otras formas de hacerlo:

     find . -type d -name '.svn' -print0 | xargs -0 rm -rdf
     find . -name .svn -print0 | xargs -0 rm -rf
     find . -name .svn -exec 'rm -rf {}\;'

\
[fuente](http://lobotuerto.com/blog/2008/04/28/como-borrar-recursivamente-todos-los-subdirectorios-svn/)
