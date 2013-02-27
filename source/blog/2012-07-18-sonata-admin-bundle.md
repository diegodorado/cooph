---
title: Sonata Admin Bundle
tags: wiki
---

INSTALARLO COMPLETO
-------------------

Primeramente hay que agregar en el archivo deps los repo que debemos
tener. todos los paquetes:

     [SonataCacheBundle]
       git=http://github.com/sonata-project/SonataCacheBundle.git
       target=/bundles/Sonata/CacheBundle
       version=origin/2.0
     [SonataBlockBundle]
       git=http://github.com/sonata-project/SonataBlockBundle.git
       target=/bundles/Sonata/BlockBundle
       version=origin/2.0
     [KnpMenu]
       git=https://github.com/KnpLabs/KnpMenu.git
     [KnpMenuBundle]
       git=https://github.com/KnpLabs/KnpMenuBundle.git
       target=bundles/Knp/Bundle/MenuBundle
     [SonatajQueryBundle]
       git=https://github.com/sonata-project/SonatajQueryBundle
     [exporter]
       git=https://github.com/sonata-project/exporter
     [SonataDoctrineORMAdminBundle]
       git=http://github.com/sonata-project/SonataDoctrineORMAdminBundle.git
       target=/bundles/Sonata/DoctrineORMAdminBundle
       version=origin/2.0
     # optional bundle
     [EntityAudit]
       git=git://github.com/simplethings/EntityAudit.git
       target=/bundles/SimpleThings/EntityAudit

Luego ejecutar por línea de comando

     $ php bin/vendors install

Luego cargamos los bundles en el AppKernel.php, e indicamos sus rutas en
el autoload.php

     // AppKernel.php
     new Sonata\CacheBundle\SonataCacheBundle(),
     new Sonata\BlockBundle\SonataBlockBundle(),
     new Sonata\jQueryBundle\SonatajQueryBundle(),
     new Knp\Bundle\MenuBundle\KnpMenuBundle(),

     // autoload.php
       'Sonata'            => __DIR__ . '/../vendor/bundles',
       'Exporter'   => __DIR__.'/../vendor/exporter/lib',
       'Knp\Bundle' => __DIR__.'/../vendor/bundles',
       'Knp\Menu'   => __DIR__.'/../vendor/KnpMenu/src',

Chicos, ojo con el jQueryBundle, que yo lo tuve que meter dentro de
vendor/bundles/Sonata para que funcionara. Revisen eso.

otros
-----

ask hdkaja skdj hsakjdash d
