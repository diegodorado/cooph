---
title: Seminario Compass
tags: wiki
---

*03/03/10 - Perón 4083 5°12 (casa Hernan-Carlos-Santi), Almagro.*

\

Contenido
---------

-   [1 Explicación básica](#Explicaci.C3.B3n_b.C3.A1sica)
-   [2 Ejemplo CSS](#Ejemplo_CSS)
-   [3 Ejemplo SASS](#Ejemplo_SASS)
-   [4 MIXINs](#MIXINs)
-   [5 Instalando Compass](#Instalando_Compass)

Explicación básica
------------------

Compass es un framework de CSS, que hace que sus hojas de estilo y su
marcado HTML sea más fácil de construir y mantener. Con Compass,
escribes hojas de estilo en Sass, en lugar de CSS. Usando el poder de
Sass Mixins y la comunidad de Compass, puede aplicar estilos de
"frameworks" como | Blueprint a sus hojas de estilo en lugar de a su
marcado HTML.

+ info: [http://compass-style.org/](http://compass-style.org/)

\

Ejemplo CSS
-----------

Se escribió un breve CSS para tomar como referencia Ejemplo:

     div.nota {
       margin: 10px;
       padding: 10px;
       background:#333;
       border: 2px solid #777;
     }

\

Ejemplo SASS
------------

Se escribió el codigo en SASS que representa la salida en CSS del
ejemplo del punto 2. Ejemplo2 en SASS:

     div.nota
       margin: 10px
       padding: 10px
       background: #333
       border: 2px solid #777

\
 En este punto no se pueden apreciar las ventajas de utilizar SASS. Las
diferencias serian:

-   No se utilizan llaves ({})
-   Luego del selector se hace una bajada de carro (Enter)
-   Se tabula un nivel para indicar que los atributos responden a ese
    selector.
-   No se utiliza punto y coma (;) para finalizar la instrucción.

\

MIXINs
------

Son meta funciones que se utilizan para agilizar y optimizar el proceso
de codificación. Declaración de un MIXIN: Se declara pegado al margen
izq.

     = [nombreMIXIN](![Parametro1],![Parametro2],...)
       [atributoCSS] = !ParametroN
       [otras expresiones CSS]

Ejemplo: MIXIN que agrega las propiedades de alto, ancho, posición desde
arriba, posición desde la izq.

     = Box (!height, !width, !top, !left)
       height = !height + "px"
       width = !width + "px"
       top = !top + "px"
       left = !left + "px"

Se invoca con el simbolo "+"

Ejemplo: Le aplicamos al div nota los atributos: alto:200, ancho:200, lo
posicionamos a 50px desde arriba y 50px desde la izq.

     div.nota
       +Box(200,200,50,50)

\

\

Instalando Compass
------------------

Bajar e instalar Ruby:
[http://rubyforge.org/frs/download.php/29263/ruby186-26.exe](http://rubyforge.org/frs/download.php/29263/ruby186-26.exe)
Hacer el upgrade desde la línea de comandos: gem update --system
Constatar que la versión sea al menos la 1.3: gem -v Instalar Compass:

     gem sources --add http://gems.github.com/
     gem install chriseppstein-compass

Constatar la versión si se quiere:

     compass -v
