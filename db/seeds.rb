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

# Ruby
Article.create(:name => 'Accessors', :small_description => 'jeje', :category_id => 7, :path => 'accessors', :route => '/app/guides/en/ruby/accessors.txt', :language => 'en', :visits => 0)
Article.create(:name => 'Blocks', :small_description => 'jeje', :category_id => 7, :path => 'how-to-use-blocks', :route => '/app/guides/en/ruby/blocks.txt', :language => 'en', :visits => 0)
Article.create(:name => 'Reading and writing a file', :small_description => 'jeje', :category_id => 7, :path => 'reading-and-writing-a-file', :route => '/app/guides/en/ruby/reading_and_writing_a_file.txt', :language => 'en', :visits => 0)
Article.create(:name => 'Regular expressions', :small_description => 'jeje', :category_id => 7, :path => 'regular-expressions', :route => '/app/guides/en/ruby/regular_expressions.txt', :language => 'en', :visits => 0)
Article.create(:name => 'Serialization', :small_description => 'jeje', :category_id => 7, :path => 'serialization', :route => '/app/guides/en/ruby/serialization.txt', :language => 'en', :visits => 0)
Article.create(:name => 'Variables types', :small_description => 'jeje', :category_id => 7, :path => 'variables-types', :route => '/app/guides/en/ruby/variables_types.txt', :language => 'en', :visits => 0)

# Rails
Article.create(:name => 'How to integrate RedactorJS with Rails', :small_description => 'jeje', :category_id => 6, :path => 'how-to-use-redactor-with-rails', :route => '/app/guides/en/rails/how_to_use_redactor_with_rails.txt', :language => 'en', :visits => 0)
Article.create(:name => 'How to upload files with Carrierwave', :small_description => 'jeje', :category_id => 6, :path => 'how-to-upload-files-with-carrierwave', :route => '/app/guides/en/rails/how_to_upload_files_with_carrierwave.txt', :language => 'en', :visits => 0)
Article.create(:name => 'How to upload images with RedactorJS', :small_description => 'jeje', :category_id => 6, :path => 'how-to-upload-images-with-redactor', :route => '/app/guides/en/rails/how_to_upload_images_with_redactor.txt', :language => 'en', :visits => 0)
Article.create(:name => 'Named scopes and callbacks', :small_description => 'jeje', :category_id => 6, :path => 'named-scopes-and-callbacks', :route => '/app/guides/en/rails/named_scopes_and_callbacks.txt', :language => 'en', :visits => 0)

# Comments
Comment.create(:article_id => 1, :name => 'Carlos', :email => 'darkzeratul64@hotmail.com', :description => 'Muy buena pagina sigue adelante!')

