# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
#Article.delete_all
#Category.delete_all



# Categories
Category.create(:name => 'CSS3', :tooltip => 'About CSS3', :image_url => 'css3.jpg', :status => 'A', :path => 'css3', :small_description => 'CSS3')
Category.create(:name => 'Ember.js', :tooltip => 'About Ember.js', :image_url => 'emberjs.png', :status => 'A', :path => 'emberjs', :small_description => 'EmberJS')
Category.create(:name => 'HTML5', :tooltip => 'About HTML5',:image_url => 'html5.png',  :status => 'A', :path => 'html5', :small_description => 'HTML 5')
Category.create(:name => 'JQuery', :tooltip => 'About JQuery',:image_url => 'jquery.gif',  :status => 'A', :path => 'jquery', :small_description => 'JQuery')
Category.create(:name => 'Node.js', :tooltip => 'About Node.js',:image_url => 'nodejs.png',  :status => 'A', :path => 'nodejs', :small_description => 'Node JS')
Category.create(:name => 'Rails', :tooltip => 'About Rails', :image_url => 'rails.png',  :status => 'A', :path => 'rails', :small_description => 'Rails')
Category.create(:name => 'Ruby', :tooltip => 'About Ruby', :image_url => 'ruby.jpg', :status => 'A', :path => 'ruby', :small_description => 'Ruby')
Category.create(:name => 'Ubuntu', :tooltip => 'About Ubuntu', :image_url => 'ubuntu.png', :status => 'A', :path => 'ubuntu', :small_description => 'Ubuntu')
Category.create(:name => 'Miscellanious', :tooltip => 'A bit of everything', :image_url => 'ubuntu.png', :status => 'A', :path => 'a-bit-of-everything', :small_description => 'Some examples of many things')

######### English #########
# Ruby
Article.create(:name => 'Accessors', :small_description => 'jeje', :category_id => 7, :path => 'accessors', :route => '/app/guides/en/ruby/accessors.txt', :language => 'en', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)
Article.create(:name => 'Blocks', :small_description => 'jeje', :category_id => 7, :path => 'how-to-use-blocks', :route => '/app/guides/en/ruby/blocks.txt', :language => 'en', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)
Article.create(:name => 'Reading and writing a file', :small_description => 'jeje', :category_id => 7, :path => 'reading-and-writing-a-file', :route => '/app/guides/en/ruby/reading_and_writing_a_file.txt', :language => 'en', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)
Article.create(:name => 'Regular expressions', :small_description => 'jeje', :category_id => 7, :path => 'regular-expressions', :route => '/app/guides/en/ruby/regular_expressions.txt', :language => 'en', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)
Article.create(:name => 'Serialization', :small_description => 'jeje', :category_id => 7, :path => 'serialization', :route => '/app/guides/en/ruby/serialization.txt', :language => 'en', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)
Article.create(:name => 'Variables types', :small_description => 'jeje', :category_id => 7, :path => 'variables-types', :route => '/app/guides/en/ruby/variables_types.txt', :language => 'en', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)
Article.create(:name => 'Inheritance', :small_description => 'jeje', :category_id => 7, :path => 'inheritance', :route => '/app/guides/en/ruby/inheritance.txt', :language => 'en', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)

# Rails
Article.create(:name => 'How to integrate RedactorJS with Rails', :small_description => 'jeje', :category_id => 6, :path => 'how-to-use-redactor-with-rails', :route => '/app/guides/en/rails/how_to_use_redactor_with_rails.txt', :language => 'en', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'How to upload files with Carrierwave', :small_description => 'jeje', :category_id => 6, :path => 'how-to-upload-files-with-carrierwave', :route => '/app/guides/en/rails/how_to_upload_files_with_carrierwave.txt', :language => 'en', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'How to upload images with RedactorJS', :small_description => 'jeje', :category_id => 6, :path => 'how-to-upload-images-with-redactor', :route => '/app/guides/en/rails/how_to_upload_images_with_redactor.txt', :language => 'en', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'Named scopes and callbacks', :small_description => 'jeje', :category_id => 6, :path => 'named-scopes-and-callbacks', :route => '/app/guides/en/rails/named_scopes_and_callbacks.txt', :language => 'en', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'Creating ajax form', :small_description => 'jeje', :category_id => 6, :path => 'creating-ajax-form', :route => '/app/guides/en/rails/creating_ajax_form.txt', :language => 'en', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'Creating ajax links', :small_description => 'jeje', :category_id => 6, :path => 'creating-ajax-links', :route => '/app/guides/en/rails/creating_ajax_links.txt', :language => 'en', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'Creating mailers and sending emails', :small_description => 'jeje', :category_id => 6, :path => 'creating-mailers-and-sending-emails', :route => '/app/guides/en/rails/creating_mailers_and_sending_emails.txt', :language => 'en', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'Rendering options and RESTful routes', :small_description => 'jeje', :category_id => 6, :path => 'rendering-options-and-RESTful-routes', :route => '/app/guides/en/rails/rendering_options_and_restful_routes.txt', :language => 'en', :visits => 0, :image_url => 'rails.png', :messages => 0)

# HTML 5
Article.create(:name => 'Drag and drop', :small_description => 'jeje', :category_id => 3, :path => 'drag-and-drop', :route => '/app/guides/en/html5/drag_and_drop.txt', :language => 'en', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Drawing forms', :small_description => 'jeje', :category_id => 3, :path => 'drawing-forms', :route => '/app/guides/en/html5/drawing_forms.txt', :language => 'en', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Editing elements', :small_description => 'jeje', :category_id => 3, :path => 'editing-elements', :route => '/app/guides/en/html5/editing_elements.txt', :language => 'en', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'New attributes and validations', :small_description => 'jeje', :category_id => 3, :path => 'new-attributes-and-validations', :route => '/app/guides/en/html5/new_attributes_and_validations.txt', :language => 'en', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Some new tags', :small_description => 'jeje', :category_id => 3, :path => 'some-new-tags', :route => '/app/guides/en/html5/some_new_tags.txt', :language => 'en', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Saving temporal data', :small_description => 'jeje', :category_id => 3, :path => 'saving-temporal-data', :route => '/app/guides/en/html5/saving_temporal_data.txt', :language => 'en', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Using the API Database', :small_description => 'jeje', :category_id => 3, :path => 'using-the-api-database', :route => '/app/guides/en/html5/using_the_api_database.txt', :language => 'en', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Video', :small_description => 'jeje', :category_id => 3, :path => 'video', :route => '/app/guides/en/html5/video.txt', :language => 'en', :visits => 0, :image_url => 'html5.png', :messages => 0)

# JQuery
Article.create(:name => 'How to create a custom tooltip', :small_description => 'jeje', :category_id => 4, :path => 'how-to-create-a-custom-tooltip', :route => '/app/guides/en/jquery/how_to_create_a_custom_tooltip.txt', :language => 'en', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Creating simple tabs with some efects - Part 1', :small_description => 'Creating tabs never was that easy like now thanks to JQuery.', :category_id => 4, :path => 'creating-simple-tabs-with-jquery-part-1', :route => '/app/guides/en/jquery/creating_simple_tabs_with_jquery_part1.txt', :language => 'en', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Making AJAX calls - Parte 2', :small_description => 'Build a friendly web without refreshing the page. Take care about the user :, :messages => 0)', :category_id => 4, :path => 'making-ajax-calls-part-2', :route => '/app/guides/en/jquery/making_ajax_calls_part2.txt', :language => 'en', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Selectors', :small_description => 'Obtaining elements from DOM on an easy way.', :category_id => 4, :path => 'selectors', :route => '/app/guides/en/jquery/selectors.txt', :language => 'en', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Custom selectors', :small_description => 'Obtaining elements from DOM on an easy way.', :category_id => 4, :path => 'custom-selectors', :route => '/app/guides/en/jquery/customized_selectors.txt', :language => 'en', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Understanding animations queues', :small_description => 'You will learn how to handle animation queues.', :category_id => 4, :path => 'selectors', :route => '/app/guides/en/jquery/customized_selectors.txt', :language => 'en', :visits => 0, :image_url => 'jquery.gif', :messages => 0)

# CSS3
Article.create(:name => 'Learning how to use pseudo classes', :small_description => 'jeje', :category_id => 1, :path => 'learning-how-to-use-pseudo-classes', :route => '/app/guides/en/css3/learning_how_to_use_pseudo_classes.txt', :language => 'en', :visits => 0, :image_url => 'css3.jpg', :messages => 0)

# Ubuntu
Article.create(:name => 'Ubuntu command line from zero', :small_description => 'Lets start running some commands on the terminal', :category_id => 8, :path => 'ubuntu-command-line-from-zero', :route => '/app/guides/en/ubuntu/learning_to_use_the_command_line.txt', :language => 'en', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Basic commands', :small_description => 'These are the most popular comandos and we must to know them!', :category_id => 8, :path => 'ubuntu-basic-commands', :route => '/app/guides/en/ubuntu/basic_commands.txt', :language => 'en', :visits => 0, :image_url => 'jquery.gif', :messages => 0)

###########################



######### Español #########

# Ruby
Article.create(:name => 'Accessors', :small_description => 'Son aquellos que dan permisos de lectura o escritura a las variables de un objeto', :category_id => 7, :path => 'accessors', :route => '/app/guides/en/ruby/accessors.txt', :language => 'es', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)
Article.create(:name => 'Bloques', :small_description => 'Es una forma de agrupar instrucciones o porciones de código y que sólo se pueden aparecer después de usar un método', :category_id => 7, :path => 'how-to-use-blocks', :route => '/app/guides/en/ruby/blocks.txt', :language => 'es', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)
Article.create(:name => 'Escribiendo y leyendo un archivo', :small_description => 'Aprenderás cómo leer y escribir en un archivo de texto', :category_id => 7, :path => 'reading-and-writing-a-file', :route => '/app/guides/en/ruby/reading_and_writing_a_file.txt', :language => 'es', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)
Article.create(:name => 'Expresiones regulares', :small_description => 'Veamos cómo especificar un patrón de caracteres para luego buscar en una cadena', :category_id => 7, :path => 'regular-expressions', :route => '/app/guides/en/ruby/regular_expressions.txt', :language => 'es', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)
Article.create(:name => 'Serialización', :small_description => 'Veremos cómo transfomar nuestros datos de disintas formas así como también sus posibles usos', :category_id => 7, :path => 'serialization', :route => '/app/guides/en/ruby/serialization.txt', :language => 'es', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)
Article.create(:name => 'Tipos de variables', :small_description => 'Aprende qué tipos de variables existen así como también cómo acceder a ellos', :category_id => 7, :path => 'variables-types', :route => '/app/guides/en/ruby/variables_types.txt', :language => 'es', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)
Article.create(:name => 'Herencia', :small_description => 'A veces es necesario usar el comportamiento de un objeto desde otro', :category_id => 7, :path => 'inheritance', :route => '/app/guides/en/ruby/inheritance.txt', :language => 'es', :visits => 0, :image_url => 'ruby.jpg', :messages => 0)

# Rails
Article.create(:name => 'Cómo integrar RedactorJS con Rails?', :small_description => 'RedactorJS es un editor de texto simple. Tiene las opciones necesarias para crear cosas interesantes', :category_id => 6, :path => 'how-to-use-redactor-with-rails', :route => '/app/guides/en/rails/how_to_use_redactor_with_rails.txt', :language => 'es', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'Cómo subir archivos con Carrierwave', :small_description => 'Carrierwave es una gema que nos facilita la vida para subir archivos de una manera rápida y fácil', :category_id => 6, :path => 'how-to-upload-files-with-carrierwave', :route => '/app/guides/en/rails/how_to_upload_files_with_carrierwave.txt', :language => 'es', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'Cómo subir imágenes con RedactorJS', :small_description => 'RedactorJS peude subir imágenes con tan sólo arrastrar tu imagen hacia la web. Atractivo no?', :category_id => 6, :path => 'how-to-upload-images-with-redactor', :route => '/app/guides/en/rails/how_to_upload_images_with_redactor.txt', :language => 'es', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'Named scopes and callbacks', :small_description => 'jeje', :category_id => 6, :path => 'named-scopes-and-callbacks', :route => '/app/guides/en/rails/named_scopes_and_callbacks.txt', :language => 'es', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'Creando un formulario con AJAX', :small_description => 'Veamos cómo enviar datos desde un formulario sin que nuestra página se resfresque', :category_id => 6, :path => 'creating-ajax-form', :route => '/app/guides/en/rails/creating_ajax_form.txt', :language => 'es', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'Creando links con AJAX', :small_description => 'Veamos cómo enviar datos mediante links, sin que se refresque nuestra página', :category_id => 6, :path => 'creating-ajax-links', :route => '/app/guides/en/rails/creating_ajax_links.txt', :language => 'es', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'Creando y enviando emails', :small_description => 'Vamos a ver cómo crear plantillas para emails que desees enviar a tus clientes por ejemplo', :category_id => 6, :path => 'creating-mailers-and-sending-emails', :route => '/app/guides/en/rails/creating_mailers_and_sending_emails.txt', :language => 'es', :visits => 0, :image_url => 'rails.png', :messages => 0)
Article.create(:name => 'Renderizando opciones con RESTFUL', :small_description => 'jeje', :category_id => 6, :path => 'rendering-options-and-RESTful-routes', :route => '/app/guides/en/rails/rendering_options_and_restful_routes.txt', :language => 'es', :visits => 0, :image_url => 'rails.png', :messages => 0)

# HTML 5
Article.create(:name => 'Arrastrar y soltar', :small_description => 'Atractivo comportamiento de arrastrar y soltar usando un poco de jquery', :category_id => 3, :path => 'drag-and-drop', :route => '/app/guides/en/html5/drag_and_drop.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Dibujando formas con canvas', :small_description => 'Usando el API de HTML5 para crear rectas, curvas, etc', :category_id => 3, :path => 'drawing-forms', :route => '/app/guides/en/html5/drawing_forms.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Editando elementos', :small_description => 'Hagamos editable elementos html, no necesariamente cuadros de texto', :category_id => 3, :path => 'editing-elements', :route => '/app/guides/en/html5/editing_elements.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Nuevos atributos y validaciones de HTML5', :small_description => 'Algunos atributos que HTML5 nos ofrece para simplificarnos la vida', :category_id => 3, :path => 'new-attributes-and-validations', :route => '/app/guides/en/html5/new_attributes_and_validations.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Algunos nuevos tags', :small_description => 'Nuevos tags para hacer de nuestro código algo más legible', :category_id => 3, :path => 'some-new-tags', :route => '/app/guides/en/html5/some_new_tags.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Grabando datos temporales', :small_description => 'Almacena datos sin necesidad de usar un lenguaje del lado del servidor', :category_id => 3, :path => 'saving-temporal-data', :route => '/app/guides/en/html5/saving_temporal_data.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Usando el API para crear y conectarse a una base de datos', :small_description => 'Una de ls cosas más interesantes que nos trae HTML5 es el hecho de poder crear nuestra propia base de datos local con la misma syntaxis SQL que conocemos', :category_id => 3, :path => 'using-the-api-database', :route => '/app/guides/en/html5/using_the_api_database.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Video', :small_description => 'Maneja, crea o personaliza tu propio reproductor con esta nueva funcionalidad de HTML5', :category_id => 3, :path => 'video', :route => '/app/guides/en/html5/video.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)

# JQuery
Article.create(:name => 'Cómo crear un tooltip personalizado', :small_description => 'Dale la forma que quieras, ponle un tiempo antes de que aparezca o muestra lo que desees cuando tengas que dar algún detalle de las opciones que tenga tu página web.', :category_id => 4, :path => 'how-to-create-a-custom-tooltip', :route => '/app/guides/en/jquery/how_to_create_a_custom_tooltip.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Creando tabs simples con algunos efectos - Parte 1', :small_description => 'Crear tabs nunca fue tan fácil como ahora gracias a JQuery.', :category_id => 4, :path => 'creating-simple-tabs-with-jquery-part-1', :route => '/app/guides/en/jquery/creating_simple_tabs_with_jquery_part1.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Haciendo llamadas AJAX - Parte 2', :small_description => 'Construye una web amigable sin recargar la página. Dale el gusto al usuario :, :messages => 0).', :category_id => 4, :path => 'making-ajax-calls-part-2', :route => '/app/guides/en/jquery/making_ajax_calls_part2.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Seleccionadores', :small_description => 'Obtén elementos del DOM de una manera muy pero muy sencilla.', :category_id => 4, :path => 'selectors', :route => '/app/guides/en/jquery/selectors.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Seleccionadores personalizados', :small_description => 'Obtén elementos del DOM de una manera muy pero muy sencilla.', :category_id => 4, :path => 'selectors', :route => '/app/guides/en/jquery/customized_selectors.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Entendiendo las colas de animaciones', :small_description => 'Cómo manejar las colas de aniimaciones? Mira esto!.', :category_id => 4, :path => 'selectors', :route => '/app/guides/en/jquery/customized_selectors.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)

# CSS3
Article.create(:name => 'Learning how to use pseudo classes', :small_description => 'Estas pseudo classes nos ayudarán obtener elementos más fácilmente', :category_id => 1, :path => 'learning-how-to-use-pseudo-classes', :route => '/app/guides/en/css3/learning_how_to_use_pseudo_classes.txt', :language => 'es', :visits => 0, :image_url => 'css3.jpg', :messages => 0)

# Ubuntu
Article.create(:name => 'Ubuntu línea de comandos desde cero', :small_description => 'Vamos a empezar corriendo algunos comandos en el terminal', :category_id => 8, :path => 'ubuntu-command-line-from-zero', :route => '/app/guides/en/ubuntu/learning_to_use_the_command_line.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Comandos básicos', :small_description => 'Estos comandos son unos de los más usados y debemos saberlos!', :category_id => 8, :path => 'ubuntu-basic-commands', :route => '/app/guides/en/ubuntu/basic_commands.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)

###########################


# Comments
Comment.create(:article_id => 1, :name => 'Carlos', :email => 'darkzeratul64@hotmail.com', :description => 'Muy buena pagina sigue adelante!')

