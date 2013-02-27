---
title: Crear DB a partir de un YML
tags: wiki
---

-   Primero hay que crear el esquema de la base con la sintaxis XML o
    YML correcta :) y meterlo en un archivo. Nosotros nos venimos
    manejando con YML y el archivo tiene que estar en la carpeta
    config/schema.yml (ojo, esa carpeta config es la de más afuera de
    todo).

-   Después se crea el modelo que se usa para acceder a la base. El
    modelo no son ni más ni menos que un conjunto de clases maravillosas
    en PHP que sirven para acceder a la base de forma muy simple. Para
    esto por línea de comandos ejecutar symfony propel-build-model.

-   A continuación se crea el script de SQL que va a servir para crear
    la base (a partir del schema que armamos antes). De nuevo, para esto
    hay que ejecutar desde la línea de comandos lo siguiente symfony
    propel-build-sql.

-   Finalmente hay que ejecutar dos cosas más para crear la base ya a
    partir del script. Estas líneas en nuestro caso son:

mysqladmin -u root -p create nombredelabase mysql -u root -p
nombredelabase < data/sql/lib.model.schema.sql

Observar que el script autogenerado anteriormente está ubicado en
data/sql/lib.model.schema.sql y que estamos suponiendo que usamos el
motor de db de mysql. Si fuera otro el lugar para configurarlo es
config/propel.ini. Y ya que estamos, el archivo donde se setean el
nombre de la base, el usuario y la contraseña es config/databases.yml
