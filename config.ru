require './config/environment'

use Rack::RequestId
use Rack::Deflater
use Prometheus::Middleware::Exporter
use Rack::Ougai::LogRequests, Application.logger

run Application
