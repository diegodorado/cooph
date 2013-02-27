---
title: Carousel en Symfony
tags: wiki
---

No es tan trivial
-----------------

Me llevo un buen rato hacer funcionar el carousel en symfony

Puntos a tener en cuenta:

-   symfony tiene incorporadas las librerias de Prototype version 1.5
-   carousel utiliza las librerias de Prototype version 1.6
-   los dos js juntos entran en conflicto

Para salvar esto, se puede instalar un plugin, que reemplaza las
librerias de prototype por las mas nuevas. Esto se hace por consola
tipeando:

    $ symfony plugin-install http://plugins.symfony-project.com/sfPrototypePlugin
    $ symfony cc

Orden de los js
---------------

El orden en que deben levantarse los js para el funcionamiento del
carousel es el siguiente:

-   prototype
-   effects
-   carousel.packed

Estos se pueden indicar en el view.yml, pero mas recomendable es
incluirlo en una funcion de un Helper:

*EffectsHelper.php*

     <?php
     function carousel($element_id)
     {
       $response = sfContext::getInstance()->getResponse();
       $response->addJavascript(sfConfig::get('sf_prototype_web_dir').'/js/prototype');
       $response->addJavascript(sfConfig::get('sf_prototype_web_dir').'/js/effects');
       $response->addJavascript('carousel.packed.js');
       
       return  "
         function runTest() {
           carousel = new UI.Carousel('".$element_id."');
         }
         Event.observe(window, 'load', runTest);
       ";
     }
     ?>

\
 Luego, lo usamos en el template

*indexSuccess.php*

     <?php use_helper('Javascript','Effects') ?>
     ...
     <?php echo javascript_tag(carousel('carousel')) ?>
     ...

De este modo, se estarán cargando los js en el orden correcto, y la
versión correcta de los mismos.
