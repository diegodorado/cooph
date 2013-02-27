---
title: Solución a los problemas más comunes
tags: wiki
---

Puesta en Producción (Implementación)
-------------------------------------

### Directorio Raíz Web (Directorio Público)

Por cuestiones de seguridad, no es una buena práctica que todos los
archivos sean de acceso público. Los archivos que no son de accesso
público, se guardan en subdirectorios correspondientes dentro del raiz o
en el directorio raíz directamente.

Symfony guarda los archivos que sí deben ser accesibles por el navegador
en una directorio público al que llama /web.

Ocurre que en muchos casos, a la hora de implementar un sitio, el
directorio público del servidor de producción puede tener otro nombre.
Los nombres más comunes suelen ser:

-   /public\_html
-   /www

\
 En estos casos, hay que indicar que el directorio público lleva un
nombre distinto en la versión puesta en producción. Esto podemos hacerlo
agregando la siguiente línea al final de la función setup del archivo
/config/ProjectConfiguration.class.php:

    $this->setWebDir($this->getRootDir().'/public_html');

Funcionamiento en Servidor Local (Localhost)
--------------------------------------------
