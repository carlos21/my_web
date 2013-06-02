
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


# Chat
Chat.create()



# Categories
Category.create(:name => 'CSS3', :tooltip => 'About CSS3', :image_url => 'css3.jpg', :status => 'A', :path => 'css3', :small_description => 'CSS3')
Category.create(:name => 'Backbone.js', :tooltip => 'About Backbone.js', :image_url => 'backbonejs.png', :status => 'A', :path => 'backbonejs', :small_description => 'BasckboneJS')
Category.create(:name => 'HTML5', :tooltip => 'About HTML5',:image_url => 'html5.png',  :status => 'A', :path => 'html5', :small_description => 'HTML 5')
Category.create(:name => 'JQuery', :tooltip => 'About JQuery',:image_url => 'jquery.gif',  :status => 'A', :path => 'jquery', :small_description => 'JQuery')
Category.create(:name => 'Node.js', :tooltip => 'About Node.js',:image_url => 'nodejs.png',  :status => 'A', :path => 'nodejs', :small_description => 'Node JS')
Category.create(:name => 'Rails', :tooltip => 'About Rails', :image_url => 'rails.png',  :status => 'A', :path => 'rails', :small_description => 'Rails')
Category.create(:name => 'Ruby', :tooltip => 'About Ruby', :image_url => 'ruby.jpg', :status => 'A', :path => 'ruby', :small_description => 'Ruby')
Category.create(:name => 'Ubuntu', :tooltip => 'About Ubuntu', :image_url => 'ubuntu.png', :status => 'A', :path => 'ubuntu', :small_description => 'Ubuntu')
Category.create(:name => 'Miscellaneous', :tooltip => 'A bit of everything', :image_url => 'm-icon.png', :status => 'A', :path => 'miscellaneous', :small_description => 'Some examples of many things')
Category.create(:name => 'Demo', :tooltip => 'My demos', :image_url => 'demo.png', :status => 'I', :path => 'demos', :small_description => 'Demo')
Category.create(:name => 'EaselJS', :tooltip => 'EaselJS Framework', :image_url => 'easeljs.jpg', :status => 'A', :path => 'easeljs', :small_description => 'EaselJS')

# Demos
Article.create(:name => 'Backbone', :category_id => 10, :path => 'backbone', :route => '/app/demos/en/backbone.txt', :small_description => 'This a great example if you want to start learning a javascript framework', :language => 'en', :messages => 0, :visits => 0, :image_url => 'backbone.jpg')
Article.create(:name => 'Drawing', :category_id => 10, :path => 'realtime-drawing', :route => '/app/demos/en/drawing.txt', :small_description => 'Drawing with HTML5 and at a real time', :language => 'en', :messages => 0, :visits => 0, :image_url => 'drawing.jpg')
Article.create(:name => 'Facebook', :category_id => 10, :path => 'facebook', :route => '/app/demos/en/facebook.txt', :small_description => 'Here you can see yout profile, your friends and add comments', :language => 'en', :messages => 0, :visits => 0, :image_url => 'facebook.jpg')
Article.create(:name => 'Github', :category_id => 10, :path => 'github', :route => '/app/demos/en/github.txt', :small_description => 'You will seeyour repors and gists', :language => 'en', :messages => 0, :visits => 0, :image_url => 'github.jpg')
Article.create(:name => 'Google', :category_id => 10, :path => 'google', :route => '/app/demos/en/google.txt', :small_description => 'Check your google profile', :language => 'en', :messages => 0, :visits => 0, :image_url => 'google.jpg')
Article.create(:name => 'Google Maps', :category_id => 10, :path => 'google-maps', :route => '/app/demos/en/google_maps.txt', :small_description => 'A little maintenance of locations using Google Maps', :language => 'en', :messages => 0, :visits => 0, :image_url => 'googlemaps.jpg')
Article.create(:name => 'Instagram', :category_id => 10, :path => 'instagram', :route => '/app/demos/en/instagram.txt', :small_description => 'Everytime a person uploads a photo to instagram 8using the PhotoMap) you will see that on a google map without moving a finger', :language => 'en', :messages => 0, :visits => 0, :image_url => 'instagram.jpg')
Article.create(:name => 'Twitter', :category_id => 10, :path => 'twitter', :route => '/app/demos/en/twitter.txt',  :small_description => 'Check yout profile and your recent tweets', :language => 'en', :messages => 0, :visits => 0, :image_url => 'twitter.jpg')
Article.create(:name => 'Scrum', :category_id => 10, :path => 'scrum', :route => '/app/demos/en/scrum.txt', :small_description => 'A good way to understand HTML5, JQuery, Rails, etc', :language => 'en', :messages => 0, :visits => 0, :image_url => 'scrum.jpg')

Article.create(:name => 'Backbone', :category_id => 10, :path => 'backbone', :route => '/app/demos/en/backbone.txt', :small_description => 'Mantenimiento de autos usando Backbone', :language => 'es', :messages => 0, :visits => 0, :image_url => 'backbone.jpg')
Article.create(:name => 'Drawing', :category_id => 10, :path => 'realtime-drawing', :route => '/app/demos/en/drawing.txt', :small_description => 'Dibujando con HTML5 en tiempo real', :language => 'es', :messages => 0, :visits => 0, :image_url => 'drawing.jpg')
Article.create(:name => 'Facebook', :category_id => 10, :path => 'facebook', :route => '/app/demos/en/facebook.txt', :small_description => 'Aquí podrás ver algunas cosas de tu perfil, tus amigos y dejar comentarios =D', :language => 'es', :messages => 0, :visits => 0, :image_url => 'facebook.jpg')
Article.create(:name => 'Github', :category_id => 10, :path => 'github', :route => '/app/demos/en/github.txt', :small_description => 'Verás tus repos y tus gists a manera de ejemplo', :language => 'es', :messages => 0, :visits => 0, :image_url => 'github.jpg')
Article.create(:name => 'Google', :category_id => 10, :path => 'google', :route => '/app/demos/en/google.txt', :small_description => 'Mira tu perfil de google', :language => 'es', :messages => 0, :visits => 0, :image_url => 'google.jpg')
Article.create(:name => 'Google Maps', :category_id => 10, :path => 'google-maps', :route => '/app/demos/en/google_maps.txt', :small_description => 'Pequeño mantenimiento utilizando el API de Google Maps para grabar posiciones', :language => 'es', :messages => 0, :visits => 0, :image_url => 'googlemaps.jpg')
Article.create(:name => 'Instagram', :category_id => 10, :path => 'instagram', :route => '/app/demos/en/instagram.txt', :small_description => 'Cada vez que alguien suba una foto desde su celular a Instagram (usando el PhotoMap) lo verás automáticamente aquí sin apretar ni una sola tecla!', :language => 'es', :messages => 0, :visits => 0, :image_url => 'instagram.jpg')
Article.create(:name => 'Twitter', :category_id => 10, :path => 'twitter', :route => '/app/demos/en/twitter.txt', :small_description => 'Mira tu info, y los tweets recientes que hayas publicado =D', :language => 'es', :messages => 0, :visits => 0, :image_url => 'twitter.jpg')
Article.create(:name => 'Scrum', :category_id => 10, :path => 'scrum', :route => '/app/demos/en/scrum.txt', :small_description => 'Interesante aplicación que muestra lo que se puede hacer con HTML5, JQuery, Rails, Ruby, Javascript y un poco de creatividad :D', :language => 'es', :messages => 0, :visits => 0, :image_url => 'scrum.jpg')


######### English #########

# Backbone


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
Article.create(:name => 'Playing with polymorphic associations', :small_description => 'We''re gonna see the concept of polymorphic associations and how to handle them', :category_id => 6, :path => 'playing-with-polymorphic-associations', :route => '/app/guides/en/rails/playing_with_polymorphic_associations.txt', :language => 'en', :visits => 0, :image_url => 'rails.png', :messages => 0)

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
Article.create(:name => 'Understanding animations queues', :small_description => 'You will learn how to handle animation queues.', :category_id => 4, :path => 'understanding-animation-queues', :route => '/app/guides/en/jquery/understanding_animation_queues.txt', :language => 'en', :visits => 0, :image_url => 'jquery.gif', :messages => 0)

# CSS3
Article.create(:name => 'Learning how to use pseudo classes', :small_description => 'jeje', :category_id => 1, :path => 'learning-how-to-use-pseudo-classes', :route => '/app/guides/en/css3/learning_how_to_use_pseudo_classes.txt', :language => 'en', :visits => 0, :image_url => 'css3.jpg', :messages => 0)

# Ubuntu
Article.create(:name => 'Ubuntu command line from zero', :small_description => 'Lets start running some commands on the terminal', :category_id => 8, :path => 'ubuntu-command-line-from-zero', :route => '/app/guides/en/ubuntu/learning_to_use_the_command_line.txt', :language => 'en', :visits => 0, :image_url => 'ubuntu.png', :messages => 0)
Article.create(:name => 'Basic commands', :small_description => 'These are the most popular comandos and we must to know them!', :category_id => 8, :path => 'ubuntu-basic-commands', :route => '/app/guides/en/ubuntu/basic_commands.txt', :language => 'en', :visits => 0, :image_url => 'ubuntu.png', :messages => 0)

# Miscellaneous
Article.create(:name => 'How to make a simple chat with Rails and Pusher - Part 1', :small_description => 'You can create your own chat from zero and add it all the functionalities that you want', :category_id => 9, :path => 'how-to-make-a-simple-chat-with-rails-and-pusher-part-1', :route => '/app/guides/en/miscellaneous/how_to_make_a_simple_chat_with_rails_and_pusher_part1.txt', :language => 'en', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'How to make a simple chat with Rails and Pusher - Part 2', :small_description => 'You can create your own chat from zero and add it all the functionalities that you want', :category_id => 9, :path => 'how-to-make-a-simple-chat-with-rails-and-pusher-part-2', :route => '/app/guides/en/miscellaneous/how_to_make_a_simple_chat_with_rails_and_pusher_part2.txt', :language => 'en', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'How to make a simple chat with Rails and Pusher - Part 3', :small_description => 'You can create your own chat from zero and add it all the functionalities that you want', :category_id => 9, :path => 'how-to-make-a-simple-chat-with-rails-and-pusher-part-3', :route => '/app/guides/en/miscellaneous/how_to_make_a_simple_chat_with_rails_and_pusher_part3.txt', :language => 'en', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Drawing in real time with pusher and HTML5 - Part 1', :small_description => 'We are going to draw in a unique canvas with other friends. It can get funny!', :category_id => 9, :path => 'drawing-in-real-time-with-pusher-and-html5-part-1', :route => '/app/guides/en/miscellaneous/drawing_in_real_time_pusher_and_html5_part1.txt', :language => 'en', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Drawing in real time with pusher and HTML5 - Part 2', :small_description => 'We are going to draw in a unique canvas with other friends. It can get funny!', :category_id => 9, :path => 'drawing-in-real-time-with-pusher-and-html5-part-2', :route => '/app/guides/en/miscellaneous/drawing_in_real_time_pusher_and_html5_part2.txt', :language => 'en', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'How to integrate your rails application with Facebook', :small_description => 'We will use the Open Graph API to let the user authenticate with his facebook account and get his public information', :category_id => 9, :path => 'how-to-integrate-your-rails-application-with-facebook', :route => '/app/guides/en/miscellaneous/how_to_integrate_your_rails_application_with_facebook.txt', :language => 'en', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'How to integrate your rails application with Github', :small_description => 'We will use the GIthub API to let the user authenticate with his github account and get his public information', :category_id => 9, :path => 'how-to-integrate-your-rails-application-with-github', :route => '/app/guides/en/miscellaneous/how_to_integrate_your_rails_application_with_github.txt', :language => 'en', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'How to integrate your rails application with Twitter', :small_description => 'We will use the Twitter API to let the user authenticate with his twitter account and get his public information', :category_id => 9, :path => 'how-to-integrate-your-rails-application-with-twitter', :route => '/app/guides/en/miscellaneous/how_to_integrate_your_rails_application_with_twitter.txt', :language => 'en', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'How to integrate your rails application with Google', :small_description => 'We will use the Google API to let the user authenticate with his google account and get his public information', :category_id => 9, :path => 'how-to-integrate-your-rails-application-with-google', :route => '/app/guides/en/miscellaneous/how_to_integrate_your_rails_application_with_google.txt', :language => 'en', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Learn how to use the Google Maps API - Part 1', :small_description => 'We will see some of the functionalities that GOogle Maps provide us', :category_id => 9, :path => 'how-to-use-the-google-maps-v3-part-1', :route => '/app/guides/en/miscellaneous/how_to_use_the_google_maps_api_v3_part_1.txt', :language => 'en', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Learn how to use the Google Maps API - Part 2', :small_description => 'We will see some of the functionalities that GOogle Maps provide us', :category_id => 9, :path => 'how-to-use-the-google-maps-v3-part-2', :route => '/app/guides/en/miscellaneous/how_to_use_the_google_maps_api_v3_part_2.txt', :language => 'en', :visits => 0, :image_url => 'm-icon.png', :messages => 0)

# EaselJS
Article.create(:name => 'Getting started with EaselJS', :small_description => 'We''re gonna see how to create an animation with EaselJS', :category_id => 11, :path => 'getting-started-with-easeljs', :route => '/app/guides/en/easeljs/getting_started_with_easeljs.txt', :language => 'en', :visits => 0, :image_url => 'easeljs.jpg', :messages => 0)

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
Article.create(:name => 'Jugando con asociaciones polimórficas', :small_description => 'Vamos a ver un poco del concepto de asociaciones polimórficas y cómo manejarlas!', :category_id => 6, :path => 'playing-with-polymorphic-associations', :route => '/app/guides/en/rails/playing_with_polymorphic_associations.txt', :language => 'es', :visits => 0, :image_url => 'rails.png', :messages => 0)

# HTML 5
Article.create(:name => 'Arrastrar y soltar', :small_description => 'Atractivo comportamiento de arrastrar y soltar usando un poco de jquery', :category_id => 3, :path => 'drag-and-drop', :route => '/app/guides/en/html5/drag_and_drop.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Dibujando formas con canvas', :small_description => 'Usando el API de HTML5 para crear rectas, curvas, etc', :category_id => 3, :path => 'drawing-forms', :route => '/app/guides/en/html5/drawing_forms.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Editando elementos', :small_description => 'Hagamos editable elementos html, no necesariamente cuadros de texto', :category_id => 3, :path => 'editing-elements', :route => '/app/guides/en/html5/editing_elements.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Nuevos atributos y validaciones de HTML5', :small_description => 'Algunos atributos que HTML5 nos ofrece para simplificarnos la vida', :category_id => 3, :path => 'new-attributes-and-validations', :route => '/app/guides/en/html5/new_attributes_and_validations.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Algunos nuevos tags', :small_description => 'Nuevos tags para hacer de nuestro código algo más legible', :category_id => 3, :path => 'some-new-tags', :route => '/app/guides/en/html5/some_new_tags.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Grabando datos temporales', :small_description => 'Almacena datos sin necesidad de usar un lenguaje del lado del servidor', :category_id => 3, :path => 'saving-temporal-data', :route => '/app/guides/en/html5/saving_temporal_data.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Usando el API para crear y conectarse a una base de datos', :small_description => 'Una de las cosas más interesantes que nos trae HTML5 es el hecho de poder crear nuestra propia base de datos local con la misma syntaxis SQL que conocemos', :category_id => 3, :path => 'using-the-api-database', :route => '/app/guides/en/html5/using_the_api_database.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)
Article.create(:name => 'Video', :small_description => 'Maneja, crea o personaliza tu propio reproductor con esta nueva funcionalidad de HTML5', :category_id => 3, :path => 'video', :route => '/app/guides/en/html5/video.txt', :language => 'es', :visits => 0, :image_url => 'html5.png', :messages => 0)

# JQuery
Article.create(:name => 'Cómo crear un tooltip personalizado', :small_description => 'Dale la forma que quieras, ponle un tiempo antes de que aparezca o muestra lo que desees cuando tengas que dar algún detalle de las opciones que tenga tu página web.', :category_id => 4, :path => 'how-to-create-a-custom-tooltip', :route => '/app/guides/en/jquery/how_to_create_a_custom_tooltip.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Creando tabs simples con algunos efectos - Parte 1', :small_description => 'Crear tabs nunca fue tan fácil como ahora gracias a JQuery.', :category_id => 4, :path => 'creating-simple-tabs-with-jquery-part-1', :route => '/app/guides/en/jquery/creating_simple_tabs_with_jquery_part1.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Haciendo llamadas AJAX - Parte 2', :small_description => 'Construye una web amigable sin recargar la página. Dale el gusto al usuario :, :messages => 0).', :category_id => 4, :path => 'making-ajax-calls-part-2', :route => '/app/guides/en/jquery/making_ajax_calls_part2.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Seleccionadores', :small_description => 'Obtén elementos del DOM de una manera muy pero muy sencilla.', :category_id => 4, :path => 'selectors', :route => '/app/guides/en/jquery/selectors.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Seleccionadores personalizados', :small_description => 'Obtén elementos del DOM de una manera muy pero muy sencilla.', :category_id => 4, :path => 'customized-selectors', :route => '/app/guides/en/jquery/customized_selectors.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)
Article.create(:name => 'Entendiendo las colas de animaciones', :small_description => 'Cómo manejar las colas de aniimaciones? Mira esto!.', :category_id => 4, :path => 'understanding-animation-queues', :route => '/app/guides/en/jquery/understanding_animation_queues.txt', :language => 'es', :visits => 0, :image_url => 'jquery.gif', :messages => 0)

# CSS3
Article.create(:name => 'Aprendiendo a usar pseudo classes', :small_description => 'Estas pseudo classes nos ayudarán obtener elementos más fácilmente', :category_id => 1, :path => 'learning-how-to-use-pseudo-classes', :route => '/app/guides/en/css3/learning_how_to_use_pseudo_classes.txt', :language => 'es', :visits => 0, :image_url => 'css3.jpg', :messages => 0)

# Ubuntu
Article.create(:name => 'Ubuntu línea de comandos desde cero', :small_description => 'Vamos a empezar corriendo algunos comandos en el terminal', :category_id => 8, :path => 'ubuntu-command-line-from-zero', :route => '/app/guides/en/ubuntu/learning_to_use_the_command_line.txt', :language => 'es', :visits => 0, :image_url => 'ubuntu.png', :messages => 0)
Article.create(:name => 'Comandos básicos', :small_description => 'Estos comandos son unos de los más usados y debemos saberlos!', :category_id => 8, :path => 'ubuntu-basic-commands', :route => '/app/guides/en/ubuntu/basic_commands.txt', :language => 'es', :visits => 0, :image_url => 'ubuntu.png', :messages => 0)

# Miscellaneous
Article.create(:name => 'Cómo hacer un chat simple con Rails y Pusher - Parte 1', :small_description => 'Ahora puedes crear tu propio chat y ponerle toda la funcionalidad que desees!', :category_id => 9, :path => 'how-to-make-a-simple-chat-with-rails-and-pusher-part-1', :route => '/app/guides/en/miscellaneous/how_to_make_a_simple_chat_with_rails_and_pusher_part1.txt', :language => 'es', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Cómo hacer un chat simple con Rails y Pusher - Parte 2', :small_description => 'Ahora puedes crear tu propio chat y ponerle toda la funcionalidad que desees!', :category_id => 9, :path => 'how-to-make-a-simple-chat-with-rails-and-pusher-part-2', :route => '/app/guides/en/miscellaneous/how_to_make_a_simple_chat_with_rails_and_pusher_part2.txt', :language => 'es', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Como hacer un chat simple con Rails y Pusher - Parte 3', :small_description => 'Ahora puedes crear tu propio chat y ponerle toda la funcionalidad que desees!', :category_id => 9, :path => 'how-to-make-a-simple-chat-with-rails-and-pusher-part-3', :route => '/app/guides/en/miscellaneous/how_to_make_a_simple_chat_with_rails_and_pusher_part3.txt', :language => 'es', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Dibujando en tiempo real con Pusher y HTML5 - Parte 1', :small_description => 'Vamos a dibujar en un solo lienzo con otros amigos. Se puede poner divertido!', :category_id => 9, :path => 'drawing-in-real-time-with-pusher-and-html5-part-1', :route => '/app/guides/en/miscellaneous/drawing_in_real_time_pusher_and_html5_part1.txt', :language => 'es', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Dibujando en tiempo real con Pusher y HTML5 - Parte 2', :small_description => 'Vamos a dibujar en un solo lienzo con otros amigos. Se puede poner divertido!', :category_id => 9, :path => 'drawing-in-real-time-with-pusher-and-html5-part-2', :route => '/app/guides/en/miscellaneous/drawing_in_real_time_pusher_and_html5_part2.txt', :language => 'es', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Cómo integrar tu aplicación de Rails con Facebook', :small_description => 'Vamos a usar el Open Graph API para permitirle al usuario loguearse con su cuenta de facebook y obtener su información pública', :category_id => 9, :path => 'how-to-integrate-your-rails-application-with-facebook', :route => '/app/guides/en/miscellaneous/how_to_integrate_your_rails_application_with_facebook.txt', :language => 'es', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Cómo integrar tu aplicación de Rails con Github', :small_description => 'Vamos a usar el API de GIthub para permitirle al usuario loguearse con su cuenta de github y obtener su información pública', :category_id => 9, :path => 'how-to-integrate-your-rails-application-with-github', :route => '/app/guides/en/miscellaneous/how_to_integrate_your_rails_application_with_github.txt', :language => 'es', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Cómo integrar tu aplicación de Rails con Twitter', :small_description => 'Vamos a usar el API de Twitter para permitirle al usuario loguearse con su cuenta de twitter y obtener su información pública', :category_id => 9, :path => 'how-to-integrate-your-rails-application-with-twitter', :route => '/app/guides/en/miscellaneous/how_to_integrate_your_rails_application_with_twitter.txt', :language => 'es', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Cómo integrar tu aplicación de Rails con Google', :small_description => 'Vamos a usar el API de Google para permitirle al usuario loguearse con su cuenta de google y obtener su información pública', :category_id => 9, :path => 'how-to-integrate-your-rails-application-with-google', :route => '/app/guides/en/miscellaneous/how_to_integrate_your_rails_application_with_google.txt', :language => 'es', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Aprende a usar el API de Google Maps - Part 1', :small_description => 'En esta ocasión veremos las posibilidades que nos ofrece Google con sus mapas! ;)', :category_id => 9, :path => 'how-to-use-the-google-maps-v3-part-1', :route => '/app/guides/en/miscellaneous/how_to_use_the_google_maps_api_v3_part_1.txt', :language => 'es', :visits => 0, :image_url => 'm-icon.png', :messages => 0)
Article.create(:name => 'Aprende a usar el API de Google Maps - Part 2', :small_description => 'En esta ocasión veremos las posibilidades que nos ofrece Google con sus mapas! ;)', :category_id => 9, :path => 'how-to-use-the-google-maps-v3-part-2', :route => '/app/guides/en/miscellaneous/how_to_use_the_google_maps_api_v3_part_2.txt', :language => 'es', :visits => 0, :image_url => 'm-icon.png', :messages => 0)

# EaselJS
Article.create(:name => 'Empezando con EaselJS', :small_description => 'Vamos a ver cómo crear una animación con EaselJS', :category_id => 11, :path => 'getting-started-with-easeljs', :route => '/app/guides/en/easeljs/getting_started_with_easeljs.txt', :language => 'es', :visits => 0, :image_url => 'easeljs.jpg', :messages => 0)

###########################


# Comments
Comment.create(:article_id => 1, :name => 'Carlos', :email => 'darkzeratul64@hotmail.com', :description => 'Muy buena pagina sigue adelante!')

CarUser.create(username: 'carlos', password: 'carlos')

Brand.create(name: 'Alfa Romeo', description: 'Alfa Romeo', image: 'alfaromeo.png', status: 'A')
Brand.create(name: 'Audi', description: 'Audi', image: 'audi.png', status: 'A')
Brand.create(name: 'Bentley', description: 'Bentley', image: 'bentley.png', status: 'A')
Brand.create(name: 'BMW', description: 'BMW', image: 'bmw.png', status: 'A')
Brand.create(name: 'Crisler', description: 'Crisler', image: 'crisler.png', status: 'A')
Brand.create(name: 'Dodge', description: 'Dodge', image: 'dodge.png', status: 'A')
Brand.create(name: 'Fiat', description: 'Fiat', image: 'fiat.png', status: 'A')
Brand.create(name: 'Ford', description: 'Ford', image: 'ford.png', status: 'A')
Brand.create(name: 'Lamborghini', description: 'Lamborghini', image: 'lamborghini.png', status: 'A')
Brand.create(name: 'Mercedes', description: 'Mercedes', image: 'mercedes.png', status: 'A')
Brand.create(name: 'Mini', description: 'Mini', image: 'mini.png', status: 'A')
Brand.create(name: 'Mitsubishi', description: 'Mitsubishi', image: 'mitsubishi.png', status: 'A')
Brand.create(name: 'Peugeot', description: 'Peugeot', image: 'peugeot.png', status: 'A')
Brand.create(name: 'Porsche', description: 'Porsche', image: 'porsche.png', status: 'A')
Brand.create(name: 'Renault', description: 'Renault', image: 'renault.png', status: 'A')
Brand.create(name: 'Subaru', description: 'Subaru', image: 'subaru.png', status: 'A')
Brand.create(name: 'Suzuki', description: 'Suzuki', image: 'suziki.png', status: 'A')
Brand.create(name: 'Toyota', description: 'Toyota', image: 'toyota.png', status: 'A')
Brand.create(name: 'Volkswagen', description: 'Volkswagen', image: 'volkswagen.png', status: 'A')

Brand.create(name: 'Alfa Romeo', description: 'Alfa Romeo', image: 'alfaromeo.png', status: 'A')
Brand.create(name: 'Audi', description: 'Audi', image: 'audi.png', status: 'A')
Brand.create(name: 'Bentley', description: 'Bentley', image: 'bentley.png', status: 'A')
Brand.create(name: 'BMW', description: 'BMW', image: 'bmw.png', status: 'A')
Brand.create(name: 'Crisler', description: 'Crisler', image: 'crisler.png', status: 'A')
Brand.create(name: 'Dodge', description: 'Dodge', image: 'dodge.png', status: 'A')
Brand.create(name: 'Fiat', description: 'Fiat', image: 'fiat.png', status: 'A')
Brand.create(name: 'Ford', description: 'Ford', image: 'ford.png', status: 'A')
Brand.create(name: 'Lamborghini', description: 'Lamborghini', image: 'lamborghini.png', status: 'A')
Brand.create(name: 'Mercedes', description: 'Mercedes', image: 'mercedes.png', status: 'A')
Brand.create(name: 'Mini', description: 'Mini', image: 'mini.png', status: 'A')
Brand.create(name: 'Mitsubishi', description: 'Mitsubishi', image: 'mitsubishi.png', status: 'A')
Brand.create(name: 'Peugeot', description: 'Peugeot', image: 'peugeot.png', status: 'A')
Brand.create(name: 'Porsche', description: 'Porsche', image: 'porsche.png', status: 'A')
Brand.create(name: 'Renault', description: 'Renault', image: 'renault.png', status: 'A')
Brand.create(name: 'Subaru', description: 'Subaru', image: 'subaru.png', status: 'A')
Brand.create(name: 'Suzuki', description: 'Suzuki', image: 'suzuki.png', status: 'A')
Brand.create(name: 'Toyota', description: 'Toyota', image: 'toyota.png', status: 'A')
Brand.create(name: 'Volkswagen', description: 'Volkswagen', image: 'volkswagen.png', status: 'A')
