module AdsService
  module Api
    def update_coordinates(ad_id, coordinates)
      response = connection.post('update_coordinates') do |request|
        request.body = { id: ad_id, data: { lat: coordinates.first, lon: coordinates.last } }.to_json
      end
      p response
      response.success?
    end
  end
end
