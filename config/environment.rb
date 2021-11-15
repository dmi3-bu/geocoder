ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/custom_logger'
Bundler.require(:default, ENV['RACK_ENV'])

Dir['./config/initializers/*.rb'].sort.reject { |file| file == './config/initializers/logger.rb' }.each { |file| require file }
Dir['./app/concerns/*.rb'].sort.each { |file| require file }
Dir['./app/serializers/*.rb'].sort.each { |file| require file }
Dir['./app/lib/**/*.rb'].sort.each { |file| require file }
require './app/application'
require './config/initializers/logger'
Dir['./config/consumer.rb'].sort.each { |file| require file }
