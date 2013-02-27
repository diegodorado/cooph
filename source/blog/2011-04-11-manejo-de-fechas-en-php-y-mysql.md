---
title: Manejo de Fechas en PHP y MySQL
tags: wiki
---

Contenido
---------

-   [1 El problema](#El_problema)
    -   [1.1 ¿Cómo maneja las fechas
        PHP?](#.C2.BFC.C3.B3mo_maneja_las_fechas_PHP.3F)
        -   [1.1.1 Timestamp de UNIX](#Timestamp_de_UNIX)
        -   [1.1.2 Funciones de PHP útiles para el manejo de
            fechas](#Funciones_de_PHP_.C3.BAtiles_para_el_manejo_de_fechas)

    -   [1.2 ¿Cómo maneja las fechas
        MySQL?](#.C2.BFC.C3.B3mo_maneja_las_fechas_MySQL.3F)
        -   [1.2.1 DATETIME](#DATETIME)
        -   [1.2.2 DATE](#DATE)
        -   [1.2.3 TIMESTAMP](#TIMESTAMP)
        -   [1.2.4 Funciones Útiles
            (MySQL)](#Funciones_.C3.9Atiles_.28MySQL.29)

-   [2 Soluciones Posibles](#Soluciones_Posibles)
    -   [2.1 Solución 1](#Soluci.C3.B3n_1)
    -   [2.2 Solución 2](#Soluci.C3.B3n_2)
    -   [2.3 Solución 3](#Soluci.C3.B3n_3)

-   [3 Conclusión](#Conclusi.C3.B3n)
-   [4 Notas y referencias](#Notas_y_referencias)

El problema
-----------

El problema básicamente es que PHP y MySQL manejan formatos muy
diferentes para las fechas. Veámoslo un poco más en detalle...

### ¿Cómo maneja las fechas PHP?

Para el manejo de fechas, PHP usa los *Timestamps de UNIX*.

Claro que además cuenta con las funciones necesarias para convertirlos
al formato de texto que uno quiera, pero internamente se maneja con
Timestamps.

#### Timestamp de UNIX

Un *Timestamp de UNIX* es en realidad un entero.

Sí, un entero, más específicamente es el número de segundos que han
transcurrido desde la medianoche del 1 de Enero de 1970 (Greenwich). Es
una forma simple de contabilizar el tiempo y hasta simpática si se
quiere (aunque puede ocurrir que necesitemos manejar fechas anteriores
al 1 de Enero de 1970, y ahí va a resultarnos un poco menos simpática).

Por ejemplo, el Timestamp para el momento en que estoy escribiendo este
artículo (que es Domingo 10 de Abril de 2011 y son las 13:04:36) es
1302458676. Queda de tarea para el hogar hacer la cuenta a ver si está
bien... ja!

#### Funciones de PHP útiles para el manejo de fechas

-   time()

devuelve el *Timestamp de UNIX* correspondiente al momento actual

    // para imprimir en pantalla el Timestamp actual (algo del estilo 1302458676)...
    echo time();

-   date($formato, $timestamp)

devuelve el String con el formato pasado por parámetro, correspondiente
al *Timestamp de UNIX* pasado como segundo parámetro

    // para imprimir en pantalla la fecha y hora actual (algo del estilo 2011-04-10 13:04:36)...
    echo date('Y-m-d H:i:s', time());

-   strtotime($fecha\_formateada)

devuevle el *Timestamp de UNIX* correspondiente a la fecha (String) que
se le pasa como parámetro

    // para imprimir en pantalla el Timestamp correspondiente, en este caso 1302458676...
    echo strtotime('2011-04-10 13:04:36');

### ¿Cómo maneja las fechas MySQL?

MySQL tiene tres tipos de fecha disponibles para los campos de sus
tablas. Estos son *DATETIME*, *DATE* y *TIMESTAMP*.

Si bien se pueden usar "notaciones relajadas" en los tres casos, es
recomendable respetar el formato que indico en cada uno de los
apartados.

MySQL también cuenta con algunas funciones para la conversión de estos
tipos de datos.

#### DATETIME

Los campos del tipo *DATETIME* guardan la fecha y la hora como un String
con el formato 'YYYY-MM-DD HH:MM:SS' (ej. 2010-05-24 15:57:02)

El rango soportado va de '1000-01-01 00:00:00' a '9999-12-31 23:59:59'

#### DATE

Los campos del tipo *DATE* guardan sólo la parte correspondiente a la
fecha con el formato YYYY-MM-DD (ej. 2010-05-24)

El rango soportado va de '1000-01-01' a '9999-12-31'.

#### TIMESTAMP

Ojo con el nombre que confunde, este tipo de campo no tienen nada que
ver con los *Timestamps de UNIX* que usa PHP.

Los campos *TIMESTAMP* emplean el mismo formato que los campos
*DATETIME*, pero tienen algunas diferencias.

La principal diferencia radica en que los campos *TIMESTAMP* actualizan
su valor para el registro en cuestión, cada vez que el registro es
modificado.

Otra diferencia importante es que el rango soportado va de '1970-01-01
00:00:00' a '2036-12-31 23:59:59'

#### Funciones Útiles (MySQL)

-   UNIX\_TIMESTAMP

convierte un valor *DATETIME de MySQL* en un valor de tipo *Timestamp de
Unix*

    // para traer registros que en el resultado ya incluyan el valor convertido a Timestamp de UNIX, haríamos una consulta de este tipo...
    $query = "SELECT UNIX_TIMESTAMP(datetimefield)
              FROM table WHERE...";

-   FROM\_UNIXTIME

convierte un *Timestamp de Unix* en un *DATETIME* para MySQL.

    // para modificar el valor de un campo DATETIME haríamos una query como esta...
    $query = "UPDATE table SET
              datetimefield = FROM_UNIXTIME($phpdate)
              WHERE...";

Soluciones Posibles
-------------------

### Solución 1

Una solución posible es guardar las fechas en campos DATETIME (MySQL) y
usar las funciones *date()* y *strtotime()* de PHP para hacer las
conversiones necesarias. Sería algo así:

    // para convertir $phpdate (timestamp UNIX) en $mysqldate (DATETIME de MySQL)...
    $mysqldate = date( 'Y-m-d H:i:s', $phpdate );

    // para convertir $mysqldate (DATETIME de MySQL) en $phpdate (timestamp UNIX)...
    $phpdate = strtotime( $mysqldate );

### Solución 2

Otra solución posible es usar las funciones UNIX\_TIMESTAMP y
FROM\_UNIXTIME de MySQL a la hora de acceder a la base de datos y dejar
que MySQL haga el trabajo, como indicamos en
[Manejo\_de\_Fechas\_en\_PHP\_y\_MySQL\#Funciones\_.C3.9Atiles\_.28MySQL.29](/wiki/index.php?title=Manejo_de_Fechas_en_PHP_y_MySQL#Funciones_.C3.9Atiles_.28MySQL.29 "Manejo de Fechas en PHP y MySQL")

### Solución 3

Otra opción es simplemente usar en todos lados el formato *Timestamp de
UNIX* que usa PHP.

Como el Timestamp que usa PHP es un entero, tranquilamente podemos usar
un campo *INT* de MySQL para guardarlo. De esta forma podemos guardar y
recuperar Timestamps (de PHP) en la base de datos sin realizar ninguna
conversión.

Hay que tener en cuenta que con esta solución se pierde la funcionalidad
que pueda proveer MySQL en cuanto al manejo de fechas. Mejor dicho, para
poder usar cualquier función de MySQL que actúe sobre fechas y horas,
habrá primero que usar FROM\_UNIXTIME para que funcionen. Ahora, si la
base de datos se usa únicamente para guardar las fechas y no para
manipularlas, esto no representaría un problema.

Conclusión
----------

Entonces... ¿Qué solución elegir?

La verdad es que cada una tiene sus pro y sus contras, y la solución a
elegir va a estar determinada por las necesidades que tengamos.

Por ejemplo:

-   La Solución 3 es piola porque es fácil de usar y es la más eficiente
    en términos de espacio físico y velocidad de ejecucón para leer y
    escribir los datos en la base de datos. Pero, si por alguna razón
    necesitamos manipular los datos dentro de MySQL, probablemente no
    nos sea tan práctica. O mismo algunas consultas a la base de datos
    pueden resultar un poco complicadas, como por ejemplo traer todos
    los usuarios que cumplan años hoy.
-   Otra cuestión para tener en cuenta es que los Timestamps no sirven
    para fechas anteriores a 1970 o posteriores a 2036, con lo cual en
    muchos casos no nos alcanzará para resolver nuestras necesidades.
-   Por último, si dadas nuestras necesidades optamos por descartar la
    Solución 3, la elección entre la Solución 2 y la Solución 1
    dependerá de si nos sentimos más a gusto haciendo las conversiones
    en el código PHP o en las queries MySQL.

Notas y referencias
-------------------

-   [[1]](http://dev.mysql.com/doc/refman/5.0/es/datetime.html)
    [http://dev.mysql.com/doc/refman/5.0/es/datetime.html](http://dev.mysql.com/doc/refman/5.0/es/datetime.html)
-   [[2]](http://www.richardlord.net/blog/dates-in-php-and-mysql)
    [http://www.richardlord.net/blog/dates-in-php-and-mysql](http://www.richardlord.net/blog/dates-in-php-and-mysql)
-   [[3]](http://www.plus2net.com/php_tutorial/php_date_time.php)
    [http://www.plus2net.com/php\_tutorial/php\_date\_time.php](http://www.plus2net.com/php_tutorial/php_date_time.php)
