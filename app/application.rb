class Application < Sinatra::Base
  helpers Sinatra::CustomLogger
  include ::ApiErrors

  configure :development do
    register Sinatra::Reloader
    also_reload './app/**/*.rb'
    set :root, File.dirname(__FILE__)
    set :show_exceptions, false
  end

  error JSON::ParserError do
    error_response('Missing parameters', :unprocessable_entity)
  end

  def json_params
    JSON.parse(request.body.read).deep_symbolize_keys
  end
end
