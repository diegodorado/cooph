---
title: Probar el envío de mails con telnet
tags: wiki
---

Se puede probar la conexion, autentificacion SMTP e incluso enviar mail
usando telnet

    telnet dominio.com 25
    Trying 200.58.118.155...
    Connected to dominio.com.
    Escape character is '^]'.
    220-client.dominio.com ESMTP Exim 4.77 #2 Tue, 17 Jul 2012 12:57:21 -0300 
    220-  We do not authorize the use of this system to transport unsolicited, 
    220   and/or bulk e-mail. 

Para ver un listado de los comandos, tipear \*ehlo\*

\

    ehlo
    250-client.dominio.com  Hello  [195.191.24.216]
    250-SIZE 52428800
    250-PIPELINING
    250-AUTH LOGIN
    250-STARTTLS
    250 HELP

Para autentificarse, con usuario y contraseña, tipear \*auth login\*,
pero habrá que ingresar usuario y password codificado base64, para lo
cual puede usarse cualquier herramienta, como perl o ruby (en otra
terminal, o previamente).

con perl:

    perl -MMIME::Base64 -e 'print encode_base64("usuario\@dominio.com");' 
    Y29udGFjdG9AYWhvcnJhc2VndXJvLmNvbS5hcg==
    perl -MMIME::Base64 -e 'print encode_base64("password");' 
    Q29udDJBaG8=

con ruby

    ruby -e 'require "base64";puts Base64.encode64 "usuario@dominio.com"'
    Y29udGFjdG9AYWhvcnJhc2VndXJvLmNvbS5hcg==
    ruby -e 'require "base64";puts Base64.encode64 "password"'
    Q29udDJBaG8=

Luego, en la ventana de telnet tipeamos \*auth login\*

    auth login
    334 VXNlcm5hbWU6  #parece que esta linea nos pide el usuario
    Y29udGFjdG9AYWhvcnJhc2VndXJvLmNvbS5hcg==  #pegamos el valor codificado
    334 UGFzc3dvcmQ6  #aca nos pide la password
    Q29udDJBaG8=  #pegamos el valor codificado
    235 Authentication succeeded
    354 Enter message, ending with "." on a line by itself
    MAIL from: <usuario@dominio.com>
    250 OK
    RCPT to:<me@gmail.com>
    250 Accepted
    DATA
    354 Enter message, ending with "." on a line by itself
    Subject: asunto de prueba
    Mensaje de prueba
    .
    250 OK id=1SrAAG-0000Rr-AO
    quit
    221 client.dominio.com closing connection
    Connection closed by foreign host.

\
 Eso es todo
