ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/custom_logger'
Bundler.require(:default, ENV['RACK_ENV'])

Dir['./app/concerns/*.rb'].sort.each { |file| require file }
Dir['./app/serializers/*.rb'].sort.each { |file| require file }
Dir['./app/lib/**/*.rb'].sort.each { |file| require file }
require './app/application'
Dir['./config/consumer.rb'].sort.each { |file| require file }
Dir['./config/initializers/*.rb'].sort.each { |file| require file }
