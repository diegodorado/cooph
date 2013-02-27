---
title: Configuracion de SSH
tags: wiki
---

Esto va a ser cortito y al pie. Mucho y largo es lo que hay en la web
acerca de estos sistemas de seguridad informáticos.

Para que lo vamos a usar?

-   Para no estar escribiendo la password del usuario al que nos
    queremos conectar con ssh, scp, etc
-   Para generar un alias mas facil de tipear (vps en lugar de
    root@mivps.com)

Al principio me pareció mucho trabajo aprender esto por tan poca cosa...
pero a medida que se usa mas la consola se vuelve una necesidad.

Va entonces el paso a paso: (instrucciones para ubuntu... otras
distribuciones pueden variar)

\

Contenido
---------

-   [1 Paso 1](#Paso_1)
-   [2 Paso 2](#Paso_2)
-   [3 Paso 3](#Paso_3)
-   [4 Paso 4](#Paso_4)
-   [5 Bonus track](#Bonus_track)
-   [6 Problemas?](#Problemas.3F)

Paso 1
------

Abrir una terminal (ctrl + alt + T) y entrar al directorio \~/.ssh

     cd ~/.ssh

\

Paso 2
------

Generar una clave ssh

     ssh-keygen -t rsa -f vps_rsa

-t rsa: es el tipo de clave (no se que otros tipos hay) -f vps\_rsa: es
el nombre del archivo ( y la convencion parece ser nombre-amistoso\_rsa
)

Esto genera 2 archivos(vps\_rsa y vps\_rsa.pub): uno publico y uno
privado. El publico es el que se va a "inyectar" en la maquina remota.
El privado debe quedar en la maquina local solamente y cualquiera que
tenga acceso a el podría eventualmente conectar al servidor remoto
autentificando con el rsa privado y sin necesidad de ingresar ninguna
password propia del servidor. Tener en cuenta que este comando les va a
pedir una passphrase que proteje dicho rsa privado. Escribo passphrase
para diferenciar de las password de los servidores remotos (esta
passphrase se refiere a una proteccion del archivo rsa)

\

Paso 3
------

Copiar la clave publica en el servidor remoto

     scp vps_rsa.pub root@mivps.com:.ssh/authorized_keys

Esto indica al servidor remoto qué claves estan autorizadas a ingresar
al sistema (para este usuario, "root")

\

Paso 4
------

Configurar ssh para multiples servidores

Y ademas generar un "alias" local con todo el perfil de autentificacion.

Abrir \~/.ssh/config con algun editor de textos (si no existe el
archivo, crearlo)

     gedit ~/.ssh/config

Y escribir algo como sigue:

\

     Host vps
       HostName mivps.com
       PreferredAuthentications publickey
       IdentityFile ~/.ssh/vps_rsa
       User root
       
     Host montoto
       HostName montoto-la.com
       PreferredAuthentications publickey
       IdentityFile ~/.ssh/montoto_rsa
       User montoto
       

\
 Listo, ahora ya puedes conectar a estos servidores de un modo simple.

En lugar de

     ssh root@mivps.com  #y luego escribir la password de root en mivps.com
     ssh montoto@montoto-la.com  #y luego escribir la password de montoto en montoto-la.com

Entar con

     ssh vps
     ssh montoto

Lo mismo vale para scp (cp a traves de ssh)

     scp mi-archivo-local montoto@montoto-la.com:sitio/

Es reemplazado por

     scp mi-archivo-local montoto:sitio/

\

Bonus track
-----------

Cada vez que abramos la terminal y utilicemos una clave rsa, nos va a
pedir la passphrase ( que es la password del archivo rsa, no del
servidor remoto!)

Y nos diremos: que ganamos?

Un ultimo comando y no tendremos que ingresar mas esa passphrase

     ssh-add ~/.ssh/vps_rsa  #nos pedirá la passphrase

\
 Listo! ahora si que estamos comodos en la consola!!

Problemas?
----------

SSH doesn’t like it if your home or \~/.ssh directories have group write
permissions. Your home directory should be writable only by you, \~/.ssh
should be 700, and authorized\_keys should be 600 :

     chmod g-w ~/
     chmod 700 ~/.ssh
     chmod 600 ~/.ssh/authorized_keys

\

Mas info:
[[1]](http://users.telenet.be/mydotcom/howto/linux/sshpasswordless.htm)
