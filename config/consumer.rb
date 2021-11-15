require './app/lib/rabbit_mq'

return if Application.test?

channel = RabbitMq.consumer_channel
queue = channel.queue('geocoding', durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  Thread.current[:request_id] = properties.headers['request_id']
  payload = JSON(payload)
  coordinates = Geocoder.geocode(payload['city'])

  Application.logger.info('consumer', city: payload['city'], coordinates: coordinates)

  if coordinates.present?
    client = AdsService::Client.new
    client.update_coordinates(payload['id'], coordinates)
  end

  channel.ack(delivery_info.delivery_tag)
end