# frozen_string_literal: true

module Scrapegraphai
  module Resources
    class Validate
      # Validate the API key and retrieve associated user email
      #
      # @overload api_key(request_options: {})
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::ValidateAPIKeyResponse]
      #
      # @see Scrapegraphai::Models::ValidateAPIKeyParams
      def api_key(params = {})
        @client.request(
          method: :get,
          path: "validate",
          model: Scrapegraphai::Models::ValidateAPIKeyResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Scrapegraphai::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
