---
title: Como usar las migaciones de doctrine
tags: wiki
---

[Acá](http://www.slideshare.net/denderello/symfony-live-2010-using-doctrine-migrations)
pueden ver una presentacion de diapositivas muy sintetica al respecto.

Pero en síntesis, se usa del siguiente modo (ojo: para un proyecto
nuevo) :

1.  realizar las modificaciones necesarias al schema.yml
2.  crear los archivos de migraciones (comparando schema.yml con model)
3.  build model, y ejecutar migraciones

<!-- -->

     php symfony doctrine:generate-migrations-diff
     php symfony doctrine:build --all-classes --and-migrate

\
 El orden de estas dos acciones es critico, ya que si se hace
build-model antes de generar los archivos de migraciones, estos ultimos
no se podran crear ( ya que no habrá diferencia entre el modelo y el
schema)

Asi es que pienso que es una herramienta muy útil esta, pero a manejar
con cautela.
[Aquí](http://www.doctrine-project.org/projects/orm/1.2/docs/manual/migrations/en)
la documentación de doctrine sobre migraciones
