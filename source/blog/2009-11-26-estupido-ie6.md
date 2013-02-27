---
title: Estupido IE6
tags: wiki
---

Aca pongo unos links que explican como lidiar con el IE6 y sus problemas
mentales

\

Contenido
---------

-   [1 2 bugs de Selectores CSS en
    IE6](#2_bugs_de_Selectores_CSS_en_IE6)
    -   [1.1 Multiple class bug](#Multiple_class_bug)
    -   [1.2 The ID-class bug](#The_ID-class_bug)

-   [2 Extendiendo el alto de una caja con hijos
    flotados](#Extendiendo_el_alto_de_una_caja_con_hijos_flotados)
-   [3 Varios Bugs del IE6](#Varios_Bugs_del_IE6)
-   [4 La declaracion del DOCTYPE no es
    joda](#La_declaracion_del_DOCTYPE_no_es_joda)
-   [5 IE PNG FIX](#IE_PNG_FIX)
-   [6 Otros Links](#Otros_Links)

2 bugs de Selectores CSS en IE6
-------------------------------

Estos bugs son una mierda, porque no tiene ningun fix prolijo...

#### Multiple class bug

    p.clase1.clase2 { text-align: center; color: red; }

es interpretado por IE6 como:

    p.clase2 { text-align: center; color: red; }

O sea, se aplica el estilo aunque p no sea de la clase clase1

#### The ID-class bug

    #tooltip.red { background: white; color: red; }
    #tooltip.yellow { background: black; color: red; }

Y en este caso, se aplica la primera linea para todos los casos...

[Ver
Fuente](http://paulirish.com/2008/the-two-css-selector-bugs-in-ie6/)

Extendiendo el alto de una caja con hijos flotados
--------------------------------------------------

No es la mejor solucion, ya que hay que agregar al markup un elemento
que arregle los errores del IE6, pero funciona.

[Ver
Articulo](/wiki/index.php?title=Floats_and_Container_Height "Floats and Container Height")

Otra solucion para el IE6, es agregarle {height: 100%;} a la caja
contenedora. Esto hará que la caja se expanda encerrando a sus hijos
flotados

Ver Fuente: [How to completely enclose a floated element in
CSS2](http://www.cs.hmc.edu/~mbrubeck/clear-after/)

Varios Bugs del IE6
-------------------

Temas tratados:

    *The Box Model
    *The Double Margin Bug
    *No Min Widths / Min Height
    *Stepdown
    *No Hover States
    *No Alpha Transparent PNG Support

[Ver
Fuente](http://css-tricks.com/ie-css-bugs-thatll-get-you-every-time/)

La declaracion del DOCTYPE no es joda
-------------------------------------

    acostumbrarse a poner: <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

[Ver
Fuente](http://www.bennadel.com/blog/953-IE-Has-Correct-Box-Model-In-Standards-Compliant-Mode.htm)

IE PNG FIX
----------

1.  Copiar iepngfix.htc y blank.gif.
2.  Agregar esto al CSS o al HTML:

<!-- -->

       <style type="text/css">
       img, div { behavior: url(iepngfix.htc) }
       </style> 

Se debe incluir todos los elementos para los cuales se quiere el fix. La
ruta del .HTC debe ser relativa al HTML, no al CSS

1.  Si usas subcarpetas, edita el .HTC file y cambia la variable
    blankImg para que la ruta de blank.gif sea relativa al HTML:

<!-- -->

       var blankImg = '/images/blank.gif';

[Ver Fuente](http://www.twinhelix.com/css/iepngfix/demo/)

Otros Links
-----------

-   [Internet Explorer vs. the
    Standards](http://positioniseverything.net/ie-primer.html)
-   [Explorer
    Exposed!](http://www.positioniseverything.net/explorer.html)
-   [Consejos, técnicas y trucos
    CSS](http://www.marciobarrios.com/consejos-css)
-   [JS que promete hacer IE6 y IE7 respetar
    W3C](http://code.google.com/p/ie7-js/)
