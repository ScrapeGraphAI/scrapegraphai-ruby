# typed: strong

module Scrapegraphai
  module Resources
    class Validate
      # Validate the API key and retrieve associated user email
      sig do
        params(request_options: Scrapegraphai::RequestOptions::OrHash).returns(
          Scrapegraphai::Models::ValidateAPIKeyResponse
        )
      end
      def api_key(request_options: {})
      end

      # @api private
      sig { params(client: Scrapegraphai::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
