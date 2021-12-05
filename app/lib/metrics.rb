module Metrics
  extend self

  def configure
    registry = Prometheus::Client.registry
    yield registry

    registry.metrics.each do |metric|
      define_method(metric.name) { metric }
    end
  end
end
