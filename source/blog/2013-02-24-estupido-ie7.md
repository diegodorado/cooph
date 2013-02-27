---
title: Estupido IE7
tags: wiki
---

Aún dando por muerto al IE6 o bien presupuestando aparte la
compatibilidad con el, el IE7 ofrece varias resistencias para
comportarse según los estándares

En esta página describo algunos problemas con los que me encontré y cómo
sortearlos y/o evitarlos

Contenido
---------

-   [1 position: absolute](#position:_absolute)
-   [2 display: inline-block](#display:_inline-block)
-   [3 z-index](#z-index)
-   [4 @font-face](#.40font-face)
-   [5 Chrome frame](#Chrome_frame)

### position: absolute

Cuando usen esta propiedad, no olviden utilizar tambien top/bottom y
left/right. Una para el eje x y otra para el y.

Suena lógico, pero si uno la olvida y esta viendo el desarrollo en FF o
Chrome, tengan en cuenta que IE ubica los elementos con position:
absolute en lugares insospechados

Tampoco olviden ( y esto es para todos los browsers) que el elemento
antecesor debe tener explícitamente declarado position: relative

### display: inline-block

Si por ejemplo, quiero ubicar elementos uno al lado del otro, dentro de
un contenedor

     
      <div id="contenedor">
        <div>elemento 1</div>
        <div>elemento 1</div>
        <div>elemento 1</div>
      <div>
      
     

Flotando, este es el estilo:

     #contenedor{
       overflow: hidden;
       clear: both;
     }
     #contenedor > div{
       width: 200px:
       float: left;
     }

Para empezar, tengo que definir un ancho para los divs interiores... y
si no quiero???

Y si luego, quiero centrarlos dentro del contenedor?? Tengo que darle al
contenedor un padding lateral fijo ( y un ancho fijo tambien, tal vez)

O bien, agregar un wrapper al marcado, y un text-align:center

....muy complicado para tan poco

En esto casos, flotar no es la mejor opcion, sino display:inline-block

En el ejemplo, el estilo sería

\

     #contenedor{
       overflow: hidden;
       clear: both;
       text-align: center;
     }
     #contenedor > div{
       display: inline-block;
     }

Asi de simple, sin anchos fijos ni wrappers innecesarios... solo un
problema... que será?

IE7 no lo entiende.

Solución:

Ademas del estilo indicado, agregar otra hoja de estilo condicional para
IE, con las siguientes reglas

     #contenedor > div{
       zoom: 1;
       display: inline;
     }

La propiedad zoom, dispara una propiedad privativa de IE que corrige su
comportamiento.

No pregunten porque... ni ellos lo deben saber... simplemente funciona.

### z-index

No tengo muy estudiado este punto... solo advierto aquí que IE7 no hace
bien sus deberes con la propiedad z-index.

Así que al usarla, chequeen que se vea ok.

### @font-face

Siempre arial y verdana...no puedo utilizar otras fuentes?

Si, con la regla @font-face de css3. Es bastante simple y agiliza mucho
el desarrollo... solo hay que tener un par de cosas en cuenta para que
funcione bien en.... para variar: IE

A pesar de ser una regla de css3, las versiones viejas de IE ya lo
tenían incorporado. Aunque solo entienden el formato EOT (Embedded
OpenType). De modo que la regla de estilo que logra ser
cross-browser-compatible es un poco compleja. Pero funciona aun con IE6!

Miren en
[http://www.google.com/webfonts](http://www.google.com/webfonts) para
una implementación sencilla.

Sino, otra forma simple es, teniendo la fuente, generar el resto de los
formatos y las reglas de estilo con
[[fontsquirrel](http://www.fontsquirrel.com/fontface/generator)]

### Chrome frame

Bien, basta... no soporto IE, pero no puedo obligar a todos los usuarios
a no usarlo mas. Algún alivio para esto?

Google desarrolló Chrome frame para IE. En corto, es un plugin para IE
que utiliza el motor de webkit para renderizar las paginas que lo
soliciten así. se instala
[[aquí](http://code.google.com/intl/es/chrome/chromeframe/)]

Y se agrega el siguiente meta tag a la pagina para solicitar su uso

     <meta http-equiv="X-UA-Compatible" content="chrome=1">

Perfecto! html5 y css3 disponible para IE6+
