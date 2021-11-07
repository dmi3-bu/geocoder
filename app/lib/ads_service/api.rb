module AdsService
  module Api
    def update_coordinates(ad_id, coordinates)
      response = connection.post('update_coordinates') do |request|
        request.body = { id: ad_id, data: { lat: coordinates.first, lon: coordinates.last } }.to_json
        request.headers['X-Request-Id'] = Thread.current[:request_id]
      end

      Application.logger.info(
        'update_coordinates', ad_id: ad_id, coordinates: coordinates, status: response.status
      )
      response.success?
    end
  end
end
