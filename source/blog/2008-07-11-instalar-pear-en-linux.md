---
title: Instalar PEAR en Linux
tags: wiki
---

\
 La instalación de Pear PHP en Ubuntu 8 es muy simple.

Primeramente vamos a "Sistema", luego "Administracion" y "Gestor de
paquetes synaptic"

Aqui vamos a buscar, y ponemos: "php-pear"

Nos va a seleccionar una lista, con lo que encontró. Seleccionamos el
paquete "php-pear", boton derecho del mouse y "Marcar para instalar".

Para asegurarnos que estamos marcando bien sobre el paquete, en la
descripcion del mismo, debería decir algo asi:

" PEAR - PHP Extension and Application Repository This package contains
the base PEAR classes for PHP, as well as the PEAR installer. Many PEAR
classes are already packaged . . . . . . . . . . . . .

\

Bueno, perfecto. Vamos bien. Ahora que ya debería estar seleccionado el
paquete debemos darle a "Aplicar", un boton grandote al lado de
"propiedades". . .

esperamos unos instantes, aceptamos, y listo!!!

ya tenemos instalado pear en nuestro ubuntu.

\
 Ahora si lo quisieramos hacer desde la linea de comando directamente,
seria de la siguiente manera:

en la linea de comandos, escribir:

sudo apt-get install php-pear

es probable que nos diga, que necesita instalar alguna otra cosita, si
es que no tienen ya instalado el php5. Simplemente le decimos que Yes. .
.

Y ya está instalado el pear.
