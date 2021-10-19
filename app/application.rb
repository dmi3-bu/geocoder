class Application < Sinatra::Base
  include ::ApiErrors

  configure :development do
    register Sinatra::Reloader
    also_reload './app/**/*.rb'
    set :root, File.dirname(__FILE__)
    set :show_exceptions, false
  end

  post '/geocode' do
    city = json_params[:city]
    return error_response('Missing parameters', :unprocessable_entity) unless city

    coords = Geocoder.geocode(city)
    if coords
      status :ok
      json(coords: { lat: coords[0], lon: coords[1] })
    else
      error_response('City not found', :unprocessable_entity)
    end
  end

  error JSON::ParserError do
    error_response('Missing parameters', :unprocessable_entity)
  end

  def json_params
    JSON.parse(request.body.read).deep_symbolize_keys
  end
end
