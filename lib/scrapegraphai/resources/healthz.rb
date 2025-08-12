# frozen_string_literal: true

module Scrapegraphai
  module Resources
    class Healthz
      # Check the health status of the service
      #
      # @overload check(request_options: {})
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::HealthzCheckResponse]
      #
      # @see Scrapegraphai::Models::HealthzCheckParams
      def check(params = {})
        @client.request(
          method: :get,
          path: "healthz",
          model: Scrapegraphai::Models::HealthzCheckResponse,
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
