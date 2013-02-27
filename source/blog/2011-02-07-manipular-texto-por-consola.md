---
title: Manipular texto por consola
tags: wiki
---

En varias oportunidades, manipular texto por consola puede ser mucho más
rápido que hacer desde un editor de texto o IDE. Sobre todo en los casos
en que es necesario operar sobre varios ficheros a la vez.

Conozco 2 programas de linux para hacerlo ( aunque hay muchos mas) Estos
son

-   grep
-   sed

No explicaré aquí como utilizar expresiones regulares...pongan regex en
el google.

Intentaré aquí describir algunas de las tareas que he realizado con
ellos:

GREP
----

Buscar todas las ocurrencias de una expresion regular en un directorio
de modo recursivo

    grep -i -R -n --exclude=*.svn* "header(\"Location:" *

-i: indica que no haga "caso al caso" ( case-insensitive) -R: recursivo
-n: que indique en que linea del archivo encontró la expresión
--exclude=\*.svn\*: que no "mire" en los archivos que coincidan con la
expresión \*.svn\* "header(\\"Location:": la expresión regular ( notar
como debo escapar la comilla doble interna con una barra (\\") )

-   que busque en todos los archivos

<!-- -->

    en modo recursivo (-R) solo es válido *... si se quisiera buscar en todos los archivos php, en lugar de *.php
    habría que poner --include:*.php y dejar * al final

SED
---

Reemplazar texto globalmente (s/regexp/replacement/)

\

    sed 's/GET/get/g' index.php 

la g al final es para que haga el reemplazo globalmente y no solo en a
primera ocurrencia. esto mostrará el resultado en pantalla. Si
quisieramos grabar la modificacion en otro archivo:

    sed 's/GET/get/g' index.php > index-modificado.php

Y si quisieramos grabarlo en el mismo archivo:

    sed -i 's/GET/get/g' index.php

-i: in-file. Ojo con esta opción que no se puede deshacer... hay que
estar muy seguro o hacer backups

\
[Mas info en este tuto](http://www.grymoire.com/Unix/Sed.html)

COMBINANDO LOS DOS
------------------

Ahora se pone bueno ( y raro)

    grep -Rl "path_to_root" * | xargs sed "s/path_to_root/path-to-root/g"

\
 Explicando esto:

    grep -Rl "path_to_root" * 

Obtiene un listado de los archivos que contienen la expresion regular
"path\_to\_root"

    |

pasa la salida al siguiente comando

    xargs

toma el STDOUT ( pasado por |) y ejecuta sed para cada linea

si hubiera necesidad de indicar explicitamente el valor de la linea, se
indica con '{}'

por ejemplo:

    grep -Rl "path_to_root" * | xargs sed "s/path_to_root/path-to-root/g" '{}'

Por ultimo:

    sed "s/path_to_root/path-to-root/g"

reemplaza cada ocurrencia de la expresion regular path\_to\_root, por
path-to-root ( para cada argumento de xargs)

* * * * *

Complicado al principio, pero muy útil.

En principio, se puede manipular texto de muy variadas formas... es
cuestión de imaginación.

Claro que, si es para un único archivo, es mas simple "find & replace"
del editor de texto.
