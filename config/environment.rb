# Load the rails application
require File.expand_path('../application', __FILE__)

ENV['RAILS_ENV'] ||= 'development'

LANG_ENGLISH = 'en'
LANG_SPANISH = 'es'

DASHBOARD_MENU = 'Dashboard'
DASHBOARD_MENU_PATH = '/'

CSS3_MENU = 'Css3'
CSS3_MENU_PATH = '/guides/css3'

RAILS_MENU = 'Rails'
RAILS_MENU_PATH = '/guides/rails'

# Initialize the rails application
MyWeb::Application.initialize!

