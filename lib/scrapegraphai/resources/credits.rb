# frozen_string_literal: true

module Scrapegraphai
  module Resources
    class Credits
      # Retrieve the current credit balance and usage for the authenticated user
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::CreditRetrieveResponse]
      #
      # @see Scrapegraphai::Models::CreditRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "credits",
          model: Scrapegraphai::Models::CreditRetrieveResponse,
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
