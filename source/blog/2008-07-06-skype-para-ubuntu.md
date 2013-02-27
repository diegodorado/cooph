---
title: Skype para Ubuntu
tags: wiki
---

Instalando Skype en Ubuntu
--------------------------

Skype es un soft propietario, por eso no esta en los repositorios de
Ubuntu

Hay dos modos de instalarlo:

-   con el repositorio de skype
-   con [Medibuntu](https://help.ubuntu.com/community/Medibuntu)

Repositorio de Skype
--------------------

1.  Agregar el repositorio de skype a source.list: deb
    http://download.skype.com/linux/repos/debian/ stable non-free
2.  Recargar o actualizar la información de paquetes.
3.  Instalar el paquete Skype.

Repositorio Medibuntu
---------------------

Agregar el repositorio Medibuntu

    $ sudo wget http://www.medibuntu.org/sources.list.d/hardy.list -O /etc/apt/sources.list.d/medibuntu.list

Agregar la clave GPG: (?)

    $ sudo apt-get update && sudo apt-get install medibuntu-keyring && sudo apt-get update

Te va a pedir de aceptar este paquete a pesar de no poder ser
autenticado. Es normal; darle *yes* significa que confias en Medibuntu.

Finalmente, instala el paquete Skype como lo harías normalmente.
