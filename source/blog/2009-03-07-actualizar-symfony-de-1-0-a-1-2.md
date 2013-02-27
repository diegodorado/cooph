---
title: Actualizar symfony de 1.0 a 1.2
tags: wiki
---

Esta es una sintesis de operaciones necesarias para actualizar los
proyectos de symfony 1.0, segun las caracteristicas que hemos utilizado.

    $ sudo pear channel-discover pear.symfony-project.com
    $ sudo pear uninstall symfony/symfony
    $ sudo pear install symfony/symfony-1.2.4

    $ cp /path/to/symfony/lib/task/generator/skeleton/project/symfony symfony
    $ cp /path/to/symfony/lib/task/generator/skeleton/project/config/ProjectConfiguration.class.php config/ProjectConfiguration.class.php
    Editar este archivo, reemplazar ##symfony_lib_dir##

    $ php symfony project:upgrade1.1

Por consola especifica las acciones que realizó.

Ej.:

     >> config    The following file is not used anymore. Please remove it.
       /home/diego/proyectos/duerme/apps/frontend/config/logging.yml
     >> config    The following file is not used anymore. Please remove it.
       /home/diego/proyectos/duerme/apps/frontend/config/i18n.yml
     >> config    The following file is not used anymore. Please remove it.
       /home/diego/proyectos/duerme/apps/frontend/config/config.php
     >> config      If you made some customization in this file,
     >> config      please migrate the content to the configuration classes.
     >> config    The following file is not used anymore. Please remove it.
       /home/diego/proyectos/duerme/config/config.php
     >> config      If you made some customization in this file,
     >> config      please migrate the content to the configuration classes.
     >> config    Migrated "/home/diego/proyectos/duerme/web/frontend_dev.php"
     >> config      You made some customization in the following file:
       /home/diego/proyectos/duerme/web/index.php
     >> config      Please, upgrade manually (new code appended as a comment)
     >> file+     /home/diego/proyectos/duerme/ap...frontendConfiguration.class.php
     >> tokens    /home/diego/proyectos/duerme/ap...frontendConfiguration.class.php
     >> factories.yml Migrating /home/diego/proyectos...s/frontend/config/factories.yml
     >> flash     Migrating /home/diego/proyectos...pps/frontend/config/filters.yml
     >> propel    Migrating /home/diego/proyectos/duerme/config/propel.ini
     >> propel    Migrating /home/diego/proyectos/duerme/config/propel.ini
     >> settings.yml Migrating /home/diego/proyectos...ps/frontend/config/settings.yml
     >> factories.yml Migrating /home/diego/proyectos...s/frontend/config/factories.yml
     >> settings.yml Migrating /home/diego/proyectos...ps/frontend/config/settings.yml
     >> test      Migrating /home/diego/proyectos/duerme/test/bootstrap/unit.php
     >> test      Migrating /home/diego/proyectos...e/test/bootstrap/functional.php
     >> web_debug Migrating /home/diego/proyectos...pps/frontend/config/filters.yml

Despues de acomodar lo indicado, ejecutar nuevamente

    $ php symfony project:upgrade1.1

Si no aparece ningun mensaje, esta parte va OK.

Para habilitar la compatibilidad con algunas funciones de symfony 1.0
(validaciones por ejemplo) hay que habilitar sfCompat10Plugin en
config/ProjectConfiguration.class.php

     <?php
     
     require_once '/usr/share/php/symfony/autoload/sfCoreAutoload.class.php';
     sfCoreAutoload::register();
     
     class ProjectConfiguration extends sfProjectConfiguration
     {
       public function setup()
       {
         // for compatibility / remove and enable only the plugins you want
         $this->enableAllPluginsExcept(array('sfDoctrinePlugin', 'sfCompat10Plugin'));
       }
     }

Dejandolo asi:

     <?php
     
     require_once '/usr/share/php/symfony/autoload/sfCoreAutoload.class.php';
     sfCoreAutoload::register();
     
     class ProjectConfiguration extends sfProjectConfiguration
     {
       public function setup()
       {
         // for compatibility / remove and enable only the plugins you want
         $this->enableAllPluginsExcept(array('sfDoctrinePlugin'));
       }
     }

\
 la funcion link\_to(), en el modo link\_to('my link', 'myModuleName')
ha dejado de funcionar debe reemplazarse con link\_to('my link',
'myModuleName/myActionName') o bien: link\_to('my link',
'@myRoutingRule')

\
 Luego, hay que hacer lo siguiente:

    $ php symfony project:upgrade1.2

    $ sudo apt-get install php5-xsl
    $ sudo /etc/init.d/apache2 reload

(o su equivalente en windows)

    $ php symfony propel:build-model
    $ php symfony cc
