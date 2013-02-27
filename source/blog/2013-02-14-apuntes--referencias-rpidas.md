---
title: Apuntes / Referencias Rápidas
tags: wiki
---

Contenido
---------

-   [1 Error por carpeta /dev](#Error_por_carpeta_.2Fdev)
-   [2 Configuración inicial en Symfony
    2](#Configuraci.C3.B3n_inicial_en_Symfony_2)
-   [3 Generar un Bundle (paquete).](#Generar_un_Bundle_.28paquete.29.)
-   [4 Eliminar un Bundle.](#Eliminar_un_Bundle.)
-   [5 Creando una Entidad.](#Creando_una_Entidad.)
-   [6 Consultas](#Consultas)
-   [7 Validadores y Formularios](#Validadores_y_Formularios)
-   [8 Entidades Relacionadas](#Entidades_Relacionadas)

Error por carpeta /dev
----------------------

Si te tira este error: Whoops, looks like something went wrong. 1/1
RuntimeException: Failed to write cache file
"/xxxxx/app/cache/dev/classes.php". Hay algun permiso que está mal sobre
la carpeta /dev o /logs Hay que hacer lo siguiente (sobre Fedora): 1ero
borra todo lo que halla:

     rm -rf app/cache/*
     rm -rf app/logs/*

Luego (en Fedora):

     # setfacl -R -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs
     # setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs

Si lo anterior es aceptado, perfecto. Ya solucionaste.

Si no fue así y si tu sistema acepta -a en el chmod:

     sudo chmod +a "www-data allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs
     sudo chmod +a "`whoami` allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs 

Hay que tener en cuenta en los dos casos que el nombre del usuario del
apache puede ser diferente dependiendo del sistema. En mi caso con
Fedora 15 use el usuario 'apache' y funciona perfecto.

\

\

\

Configuración inicial en Symfony 2
----------------------------------

La configuración principal de la aplicación esté en el archivo
app/config/parameters.ini

     ; These parameters can be imported into other config files
     ; by enclosing the key with % (like %database_user%)
     ; Comments start with ';', as in php.ini
     [parameters]
         database_driver   = pdo_mysql
         database_host     = localhost
         database_port     =
         database_name     = name_database
         database_user     = user
         database_password = pass
         mailer_transport  = smtp
         mailer_host       = localhost
         mailer_user       = 
         mailer_password   =
         locale            = en
         secret            = ThisTokenIsNotSoSecretChangeIt

\

\

\

Generar un Bundle (paquete).
----------------------------

Lo haremos por la línea de comandos. Todo en symfony2 se hace por medio
de los paquetes, reemplazaria a las aplicaciones del symfony1. La idea
es que el paquete que generes, lo puedas usar así como está en otro
proyecto también. Es una mezcla de aplicaciones y plugins del symfony1.
Todo nuestro código va a ir dentro de **/src/nombre\_empres/paquetes**
Acordarse que no estés como root en la creación del bundle, por que
luego no vas a poder editarlo facilmente.

Entonces, estando parado en el proyecto:

     php app/console -s         (abrimos el entorno del Symfony2)
     generate:bundle --namespace=Ford/DemoBundle --format=yml

Aquí configuramos lo siguiente:

\_ Lo primero que nos pide será el namespace o carpeta contenedora del
Bundle para lo que le diremos que deberá estar dentro de una carpeta
"cliente" y el nombre de la carpeta de nuestro bundle será DemoBundle.
Esto lo hacemos escribiendo: Ford/DemoBundle.

\_ A continuación nos pedirá un nombre identificador del Bundle para el
proyecto y nos propone entre corchetes la concatenación FordDemoBundle.
Para aceptar la propuesta daremos enter.

\_ A continuación nos preguntará donde queremos que se guarde el nuevo
bundle creado. Aceptaremos la propuesta.

\_ Nos pide el formato de archivo que usará para las configuraciones del
Bundle. Nos propone [annotations] pero le diremos que queremos que sea
“yml”.

\_ Luego nos pregunta si queremos que nos genere una estructura completa
para el bundle y le vamos a decir que “no” ya que necesitamos solo la
base.

\_ Confirmamos si todo esta bien.

\_ Nos pregunta si queremos registrar nuestro Bundle en el archivo
app\\AppKernel.php a lo que le diremos que si.

\_ Nos pregunta si queremos actualizar el archivo
app\\config\\routing.yml y le decimos que si.

\

Eliminar un Bundle.
-------------------

por ejemplo Acme.

\1. Elimina la carpeta src/Acme

\2. Elimina la línea $bundles[] = new
Acme\\DemoBundle\\AcmeDemoBundle(); del app/AppKernel.php

\3. Eliminas las rutas que hagan referencia a Acme (son 3) en el archivo
app/config/routing\_dev.yml, app/config/routing.yml

Creando una Entidad.
--------------------

Primero debemos saber que está bien configurados las configuraciones de
la base de datos.

Symfony2 nos puede crear la base de datos si la configuracion es
correcta:

     php app/console doctrine:database:create

\
 Y aquí tenemos dos opciones para hacerlo. Una es creando las
propiedades de la clase y editando los metados (CASO 1), el otro con la
consola directo (CASO 2)

\
 (CASO 1) Luego teniendo ya creado el bundle, cargamos en un archivo la
clase:

     // src/Acme/GuardaBundle/Entity/Producto.php
     namespace Acme\GuardaBundle\Entity;
     class Producto {
       protected $nombre;
       protected $precio;
       protected $descripcion;
     }

Indicamos en forma YAML, de anotación, php o XML los "metadatos", es
decir la configuración que le dice a Doctrine exactamente cómo debe
asignar la clase Producto y sus propiedades a la base de datos.

     # src/Acme/GuardaBundle/Resources/config/doctrine/Producto.orm.yml
     Acme\GuardaBundle\Entity\Producto:
       type: entity
       table: producto
       id:
         id:
           type: integer
           generator: { strategy: AUTO }
       fields:
         nombre:
           type: string
           length: 100
         precio:
           type: decimal
           scale: 2
         descripcion:
           type: text

Ahora es necesario que Doctrine nos cree los métodos de la clase, así la
podemos usar. (ejemplo, getNombre(), setNombre()) Lo hacemos fácilmente:

     $ php app/console doctrine:generate:entities Acme/GuardaBundle/Entity/Producto

Esta orden se asegura de que se generen todos los captadores y
definidores para la clase Producto. Esta es una orden segura - la puedes
ejecutar una y otra vez: sólo genera captadores y definidores que no
existen (es decir, no sustituye métodos existentes).

\
 Ahora debemos crear la tabla/esquema en la base de datos

     $ php app/console doctrine:schema:update --force

\

(CASO 2)

     $ php app/console doctrine:generate:entity

     Welcome to the Doctrine2 entity generator  
     The Entity shortcut name:   AcmeLearningBundle:Articles
     Configuration format (yml, xml, php, or annotation) [annotation]: yml
     New field name (press <return> to stop adding fields): title
     Field type [string]: 
     Field length [255]: 
     New field name (press <return> to stop adding fields): author
     Field type [string]: 
     Field length [255]:
     New field name (press <return> to stop adding fields): content
     Field type [string]: text
     New field name (press <return> to stop adding fields): tags
     Field type [string]: 
     Field length [255]: 
     New field name (press <return> to stop adding fields): created
     Field type [string]: date
     New field name (press <return> to stop adding fields): updated
     Field type [string]: date
     New field name (press <return> to stop adding fields): slug
     Field type [string]: 
     Field length [255]: 
     New field name (press <return> to stop adding fields): category
     Field type [string]: 
     Field length [255]: 
     New field name (press <return> to stop adding fields):
     Do you want to generate an empty repository class [no]? yes
     You are going to generate a "AcmeLearningBundle:Articles" Doctrine2 entity
     using the "yml" format.
     Do you confirm generation [yes]? yes

\
 Ya tendremos creada nuestra entidad.

\
 Ahora generamos las tablas dependiendo de las entidades que hayamos
creado:

     $ php app/console doctrine:schema:create

Consultas
---------

Conectamos siempre antes de hacer nada con el Administrador de las
Entidades

     $em = $this->getDoctrine()->getEntityManager();

\
 Obtenemos todos los artículos de la tabla

     $articulos = $em->getRepository('AcmeDemoBundle:Articles')->findAll();

\
 Obtenemos el artículo con el id igual a 5

     $articulo = $em->getRepository('AcmeDemoBundle:Articles')->find(5);

\
 Obtenemos el artículo cuyo slug sea "articulo-1"

     $articulos = $em->getRepository('AcmeDemoBundle:Articles')->findOneBy(array('slug' => 'articulo-1'));

\
 Obtenemos todos los artículos de autor John Doe que sean de la
categoría "Symfony"

     $articulos = $em->getRepository('AcmeDemoBundle:Articles')->findBy(array(
                                                                      'author' => 'John Doe',
                                                                  'category' => 'Symfony'));

Validadores y Formularios
-------------------------

Antes vimos que cada tabla de nuestra base de datos es representada por
medio de una Entity, en donde usamos annotations para definir los
metadatos. Para usar esto importamos el paquete “use
Doctrine\\ORM\\Mapping as ORM;”

\
 Para la validación de los datos importaremos otro namespace: “use
Symfony\\Component\\Validator\\Constraints as Assert;” y por medio del
alias Assert, utilizando annotations definiremos los validadores para
los campos que queramos.

\
[Listado de
validadores](http://symfony.com/doc/current/book/validation.html#constraints)

\
 Entonces en la definición de metadatos utlizamos @ORM para realmente
definir el Entity y @Assert para definir el validador que va a utilizar.

\
 Por ejemplo para asegurarnos de que no sea nulo a la hora de ingresar
los datos, y encima de esto indicarle un mensaje de error, hacemos lo
siguiente:

     /**
     * @var string $title
     *
     * @ORM\Column(name="title", type="string", length=255)
     * @Assert\NotNull(message="Debe escribir un titulo")
     */
     private $title;

\
 Si quisiéramos validar que un campo debe ser de tipo email:

     /**
     * @Assert\Email(
     *     message = "El mail '{{ value }}' ingresado no tiene el formato correcto.",
     * )
     */
     protected $email;

Haciendo referencia a {{ value }} va a mostrar el valor ingresado como
parte del mensaje.

\

Si quisiéramos validar la máxima cantidad de caracteres ingresados,
podríamos usar el @Assert\\MaxLength(), y para minima
@Assert\\MinLength() :

     /**
     * @var string $title
     *
     * @ORM\Column(name="title", type="string", length=255)
     * @Assert\NotNull(message="Debe escribir un titulo")
     * @Assert\MaxLength(255)
     * @Assert\MinLength(5)
     */
     private $title;

\

Y de la siguiente manera validamos realmente dentro del controlador;
debemos hacer algo antes de que llegue al EntityManager:

     $errores = $this->get('validator')->validate($articulo);

Por medio del objeto $this-\>get(‘validator’) le decimos que valide la
entidad $articulo, quién ya sabe como validarse por si misma ya que los
annotations están dentro de la misma. Este método validate() nos
devolverá un array de errores que podemos iterar y obtenerlos por medio
del método getMessage():

\
 Sería algo así:

     public function crearAction() {
       $articulo = new Articles();
       
       $articulo->setAuthor('John Doe');
       $articulo->setContent('Contenido');
       // Seguimos con los set que sean necesarios.
       // Aqui tener en cuenta de no cargar sel setTittle, de esta manera nos va a tirar error
       $errores = $this->get('validator')->validate($articulo);
       if(!empty($errores)) {
           foreach($errores as $error)
             echo $error->getMessage();
           return new Response();
       }
       $em = $this->getDoctrine()->getEntityManager();
       $em->persist($articulo);
       $em->flush();
       return $this->render('MDWDemoBundle:Articulos:articulo.html.twig', array('articulo' => $articulo));
    }

En el código de arriba falta la línea del setTitle(). Esto nos mostrará
en pantalla el mensaje “Debe escribir un titulo” y si tenemos más
errores los mensajes por cada error.

Esto en realidad, no sirve de mucho, por que los datos no los está
escribiendo un usuario. Pero para adentrarnos en ese tema, debemos
conocer bien el maravilloso manejo que hace Symfony 2 con los
formularios.

\
**FORMULARIOS**

Estos son programados como objetos y Symfony se encarga de renderizarlo
al HTML5, de la mejor manera posible.

Un formulario siempre debería ser representado por un objeto que se lo
conoce como Type. Este objeto hace referencia a otro que puede ser un
Entity o un POPO (Plain Old PHP Object), que esto es simplemente una
clase con propiedades y métodos tradicionales, pero sin annotations.

\

Un objeto Type se debe tomar como la definición del formulario. Este
objeto recibirá cual es el Entity o POPO en el cual se almacenan los
datos cargados en el formulario. Podríamos tener más de un Type para un
mismo objeto ya que dependiendo de ciertos perfiles por ejemplo,
podríamos querer mostrar algunos campos u otros dependiendo de que el
usuario sea operador normal o administrador.

\

**Definición de nuestro formulario**

\
 Para nuestro ejemplo tomaremos en cuenta el Entity Article que venimos
usando y crearemos un objeto Type para representar a este formulario.
Los formularios se deben crear dentro de nuestro Bundle en una carpeta
Form por lo que **crearemos el archivo ArticleType dentro de nuestra
carpeta src/MDW/DemoBundle/Form**:

     <?php
     namespace MDW\DemoBundle\Form;
     use Symfony\Component\Form\AbstractType;
     use Symfony\Component\Form\FormBuilder;
     class ArticleType extends AbstractType
     {
       public function buildForm(FormBuilder $builder, array $options)
       {
           $builder->add('title')
                   ->add('author')
                   ->add('created');
       }
       public function getName()
       {
           return 'article_form';
       }
     }

\
 Como podemos ver en el ejemplo, el nombre de la clase esta formado por
un nombre que yo he elegido concatenado con el sufijo Type y debe
heredar de AbstractType para contener las funcionalidades base.

\
 En el método buildForm(), por medio del $builder, que se recibe como
argumento, agregamos los campos que vamos a usar. Estos campos son los
nombres de los campos que tendrá el formulario y deben coincidir con las
propiedades de nuestro Entity Article aunque todavía no hemos dicho que
el formulario representará a Article ya que eso lo hacemos en la
invocación desde el controller. El argumento options nos servirá para
crear el formulario con otras opciones de personalización.

\
 El método getName() deberá retornar el identificador de nuestro
formulario y este String puede tomar el nombre que queramos siempre y
cuando sea único. Tenemos que tener en cuenta que este nombre será usado
para los atributos “name” de los componentes de formularios. Por ejemplo
vemos que tenemos un componente llamado “title” que hemos agregado en el
método buildForm() por lo que la etiqueta creada será:

<input type="text" name="article\_form[title]" /\>

Hay que notar que esta es la sintaxis para cargar datos en un array
(usando los corchetes) por lo que “article\_form” será simplemente un
array con una clave asociativa “title” que contendrá el valor ingresado
por el usuario. Esta sintaxis nos permite tener en un array todos los
datos del formulario al hacer el submit.

\
 Escribiendo los objetos Type NO definimos como será visualmente el
formulario sino como será CONCEPTUALMENTE.

\

**Invocación y Visualización del formulario**

\
 Para poder mostrar el formulario HTML en nuestra página debemos invocar
a nuestra clase ArticleType desde nuestro controlador, o más
específicamente desde el action que llama a nuestra página, para esto
vamos a crear un action nuevo dentro de nuestro ArticulosController al
que vamos a llamar newAction.

\
 Primeramente creamos nuestra ruta en el archivo routing.yml

     articulo_new:
      pattern: /articulo/new
      defaults: { _controller: MDWDemoBundle:Articulos:new }

\
 Una vez creada nuestra ruta iremos a crear nuestro newAction en
src\\MDW\\DemoBundle\\Controller\\ArticulosController.php
(MDWDemoBundle:Articulos:new). Para esto agregamos el siguiente código:

     //--  Al estar utilizando la clase ArticleType dentro de nuestro método no debemos olvidar importar el namespace al principio del archivo
     use MDW\DemoBundle\Form\ArticleType; 
     //-- Agregar este método como uno nuevo
     public function newAction()
     {
       $articulo = new Articles();
       $form = $this->createForm(new ArticleType(), $articulo);
       return $this->render('MDWDemoBundle:Articulos:new.html.twig', array(
           'form' => $form->createView(),
       ));
     }

\
 Si queremos, por ejemplo en un formulario de modificación de registro,
mostrar ya los datos del artículo a modificar esto simplemente
implicaría obtener los datos desde la base de datos utilizando un DQL o
el método find() que vimos en el capítulo anterior antes de pasarlo al
método createForm(). Capturar a Evernote

\
 El código que debe contener nuestro action es muy sencillo.
Primeramente creamos un objeto Article y luego, por medio del método
$this-\>createForm() invocamos a nuestro objeto ArticleType pasándole
nuestro objeto recién creado $articulo, devolviéndonos un objeto de tipo
formuario. Finalmente invocamos a la vista como siempre hacemos y
pasamos como parámetro el resultado de ejecutar $form-\>createView().

\
 Con esto ya seremos capaces de ver el código de nuestra vista
MDWDemoBundle:Articulos:new.html.twig que de acuerdo a este nombre
lógico debemos **crear el archivo new.html.twig** **dentro de** la
carpeta **src/MDW/DemoBundle/Resources/views/Articulos/** con el
siguiente código:

     <form action="{{ path('articulo_new') }}" method="post">
       {{ form_widget(form) }}
       <input type="submit" />
     </form>

\
 La creación de la etiqueta formulario la hacemos normalmente así como
también el botón de submit. Lo único importante aquí es que el action
del form debe apuntar a la misma página por lo que creamos el link por
medio de path(‘articulo\_new’).

\
 La parte mágica está en {{ form\_widget(form) }} donde, por medio de
form\_widget y Twig, pasamos como argumento la variable que nuestro
action nos ha enviado y se imprime en la página el código necesario para
nuestro formulario. Es decir que veremos el formulario al ingresar a la
dirección:
[http://localhost/Symfony/web/app\_dev.php/articulo/new](http://localhost/Symfony/web/app_dev.php/articulo/new)

\
 Si miramos el código HTML veremos lo siguiente:

     <form action="/Symfony/web/app_dev.php/articulo/new" method="post">
       <div id="article_form">
          <input type="hidden" id="article_form__token" name="article_form[_token]" value="62bc1a503b32de46b8755e9a5f5d8855bc8eb877" />
          <div>
            <label for="article_form_title" class=" required">Title</label>
            <input type="text" id="article_form_title" name="article_form[title]" required="required" maxlength="20" />
          </div>
          <div>
            <label for="article_form_author" class=" required">Author</label>
            <input type="text" id="article_form_author" name="article_form[author]" required="required" maxlength="255" />
          </div>
          <div>
            <label class=" required">Created</label>
            <div id="article_form_created">
              <select id="article_form_created_year" name="article_form[created][year]" required="required">
                <option value="2007">2007</option>
                <option value="2008">2008</option>
                ...
              </select>
            </div>
          </div>
        </div>
        <input type="submit" />
      </form>

\
 Si miramos el código podemos notar los atributos “name” como los
explicamos arriba y también vemos que mágicamente el campo “created” se
muestra como un campo para seleccionar una fecha. Esto es debido a que
el framework reconoce el tipo de input a mostrar ya que sabe, por medio
del objeto Articles, que esa propiedad es una fecha. Esto es
tremendamente útil ya que muchas veces podría ya reconocer que type
agregarle a las etiquetas input, pero si necesitamos definir por
nosotros mismos el atributo type lo hacemos agregando un segundo
argumento al momento de agregar el campo al $builder:

     public function buildForm(FormBuilder $builder, array $options)
     {
       $builder->add('title')
           ->add('author', 'checkbox')
           ->add('created');
     }

\
 Mientras que si necesitamos hacer que un campo no sea obligatorio lo
hacemos enviando un array como tercer argumento ya que por defecto todos
los campos son puestos como requeridos con validaciones HTML5:

     public function buildForm(FormBuilder $builder, array $options)
     {
       $builder->add('title')
           ->add('author', 'text', array('required' => false))
           ->add('created');
     }

\
 El formulario HTML es impreso directamente en la página usando el {{
form\_widget(form) }}. Y si quisieramos generar formularios más
complejos en diseño también se cuentan con las siguientes opciones:

     form_errors(form): Renderiza lo errores que se encuentren en el formulario.
     form_rest(form): Renderiza los campos de formulario que no hayan sido agregados manualmente con el form_row.
     form_row(form.field): Renderiza un campo específico dentro de un div.
     form_errors(form.field): Renderiza el error para un campo específico.
     form_label(form.field): Renderiza la etiqueta label para un campo específico.
     form_widget(form.field): Renderiza un campo específico.

**Procesamiento del Formulario**

\
 Ahora debemos modificar un poco el código del método newAction() para
ver cuando es un submit (ya llenó el formulario y envió), por ejemplo.
Entonces con un if() le preguntamos al $request si es un métoso post o
get:

     public function newAction()
     {
       //-- Obtenemos el request que contendrá los datos
        $request = $this->getRequest();

        $articulo = new Articles();
        $form = $this->createForm(new ArticleType(), $articulo);

        //-- En caso de que el request haya sido invocado por POST
        //   procesaremos el formulario
        if($request->getMethod() == 'POST')
        {
            //-- Pasamos el request el método bindRequest() del objeto 
            //   formulario el cual obtiene los datos del formulario
            //   y los carga dentro del objeto Article que está contenido
            //   también dentro del objeto Type
            $form->bindRequest($request);

            //-- Con esto nuestro formulario ya es capaz de decirnos si
            //   los dato son válidos o no y en caso de ser así
            if($form->isValid())
            {
                //-- Procesamos los datos que ya están automáticamente
                //   cargados dentro de nuestra variable $articulo, ya sea
                //   grabándolos en la base de datos, enviando un mail, etc

                //-- Finalmente, al finalizar el procesamiento, siempre es
                //   importante realizar una redirección para no tener el
                //   problema de que al intentar actualizar el navegador
                //   nos dice que lo datos se deben volver a reenviar. En
                //   este caso iremos a la página del listado de artículos
                return $this->redirect($this->generateURL('articulos'));
            }
        }
        return $this->render('MDWDemoBundle:Articulos:new.html.twig', array(
            'form' => $form->createView(),
        ));
      }

\
 Como vemos en las explicaciones del código casi todo es automáticamente
realizado por el objeto ArticleType quién al conocer el request ya nos
devuelve el mismo objeto original $articulo que le fue entregado en el
createForm(new ArticleType(), $articulo);.

\
 En caso de que los datos no sean válidos y el método isValid() retorne
false seguirá el hasta mostrar nuevamente el formulario llamando al
método $this-\>render() y el {{ form\_widget(form) }} puesto en nuestra
misma vista se encargará de mostrar los errores de validación.

\
*Nota*

*Symfony2 agrega las validaciones de los formularios en HTML5 y del lado
del servidor. Si el navegador no soporta las validaciones por medio de
HTML5 el método isValid() lo valida en el servidor y al retornar la
respuesta por el método render() se mostrarán los mensajes de validación
del servidor. Puede que tu navegador ya acepte las validaciones HTML5
por lo que al intentar enviar los datos no notes la validación del lado
del servidor aunque lo mismo se están realizando.* *Por ejemplo el campo
$title está puesto como <input type=”text” id=”article\_form\_title”
name=”article\_form[title]” required=”required” maxlength=”255″
pattern=”.{10,255}” /\> donde se puede ver que las validaciones de HTML5
fueron ya puestas.* *Si no tienes un navegador que NO soporte HTML5 para
probar como se muestran los mensajes de validación del servidor puedes,
utilizando el Firebug del Firefox, eliminar el texto required=”required”
maxlength=”255″ pattern=”.{10,255}” de la etiqueta input y luego
presionar el botón de submit :-)* Como verás, los hackers que quieren
usar esta técnica también serán detenidos por las validaciones del
servidor.

\

Entidades Relacionadas
----------------------

Mapa de la entidad producto:

     # paquete/xxxxxBundle/Resource/config/doctrine/Product.orm.yml
     Primero\AgendaBundle\Entity\Product:
     type: entity
     table: null
     fields:
       id:
         type: integer
         id: true
         generator:
           strategy: AUTO
       name:
         type: string
         length: '255'
       price:
         type: decimal
         length: '2'
       description:
         type: text
         length: null
     manyToOne:
           category:
               targetEntity: Category
               inversedBy: products
               joinColumn:
                   name: category_id
                   referencedColumnName: id
     lifecycleCallbacks: {  }

Mapa de la entidad categoria:

     # paquete/xxxxxBundle/Resource/config/doctrine/Category.orm.yml
     Primero\AgendaBundle\Entity\Category:
     type: entity
     table: null
     fields:
       id:
         type: integer
         id: true
         generator:
           strategy: AUTO
       name:
         type: string
         length: '255'
     oneToMany:
           products:
               targetEntity: Product
               mappedBy: category
     lifecycleCallbacks: {  }

Clase Product:

     <?php
     // paq/xxxBundle/Entity/Product.php
     namespace Primero\AgendaBundle\Entity;
     
      use Doctrine\ORM\Mapping as ORM;
      /**
       * Primero\AgendaBundle\Entity\Product
       */

      class Product
      {
     
      }
      

Clase Category:

     <?php
     // paq/xxxBundle/Entity/Category.php
     namespace Primero\AgendaBundle\Entity;
     
      use Doctrine\ORM\Mapping as ORM;
      use Doctrine\Common\Collections\ArrayCollection;

      /**
       * Primero\AgendaBundle\Entity\Category
       */
      class Category
      {

        /**
         * @ORM\OneToMany(targetEntity="Product", mappedBy="category")
         */
        protected $products;

        public function __construct()
        {
            $this->products = new ArrayCollection();
        }
        
      } 

por línea de comandos, ejecutar:

     $ app/console doctrine:generate:entities Primero/AgendaBundle/Entity

Luego:

     $ app/console doctrine:schema:update --force

Con esto vamos a haber creado dos tablas relacionadas, pudiendo
seleccionar el category\_id en la tabla producto.
