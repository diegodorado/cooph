---
title: Instalar Symfony
tags: wiki
---

PEAR 1.4.0 o superior
---------------------

Es lo que se necesita para instalar Symfony via PEAR ( que es el modo
mas sencillo)

-   PHP 5.1.0 ya incluye PEAR 1.4.5
-   [Instalar PEAR en
    Windows](/wiki/index.php?title=Instalar_PEAR_en_Windows "Instalar PEAR en Windows")
-   [Instalar PEAR en
    Linux](/wiki/index.php?title=Instalar_PEAR_en_Linux "Instalar PEAR en Linux")

Para actualizar PEAR, ejecutar:

     $ sudo pear upgrade PEAR

Instalar Symfony via PEAR
-------------------------

Sumar el canal symfony, ejecutando:

    $ sudo pear channel-discover pear.symfony-project.com

\
 Instalar la versión 1.0.0 de Symfony, ejecutando:

    $ sudo pear install symfony/symfony-1.0.0

\
 Revisar que Symfony se encuentra bien instalado, ejecutando:

    $ symfony -V
