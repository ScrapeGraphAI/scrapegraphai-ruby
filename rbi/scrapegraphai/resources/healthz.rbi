# typed: strong

module Scrapegraphai
  module Resources
    class Healthz
      # Check the health status of the service
      sig do
        params(request_options: Scrapegraphai::RequestOptions::OrHash).returns(
          Scrapegraphai::Models::HealthzCheckResponse
        )
      end
      def check(request_options: {})
      end

      # @api private
      sig { params(client: Scrapegraphai::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
