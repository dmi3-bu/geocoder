require 'prometheus/client'
require 'prometheus/middleware/exporter'
require './app/lib/metrics'

Metrics.configure do |registry|
  registry.counter(
    :geocoding_requests_total,
    docstring: 'Total number of geocoding requests',
    labels: %i[result]
  )

  registry.histogram(
    :geocoder_request_duration_seconds,
    docstring: 'Geocoder request duration',
    labels: %i[service]
  )
end
