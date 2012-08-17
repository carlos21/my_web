# Load the rails application
require File.expand_path('../application', __FILE__)

ENV['RAILS_ENV'] ||= 'PRODUCTION'


# Initialize the rails application
MyWeb::Application.initialize!

