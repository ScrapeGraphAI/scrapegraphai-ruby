# frozen_string_literal: true

module Scrapegraphai
  module Resources
    class Feedback
      # Submit feedback for a specific request
      #
      # @overload submit(rating:, request_id:, feedback_text: nil, request_options: {})
      #
      # @param rating [Integer] Rating score
      #
      # @param request_id [String] Request to provide feedback for
      #
      # @param feedback_text [String, nil] Optional feedback comments
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::FeedbackSubmitResponse]
      #
      # @see Scrapegraphai::Models::FeedbackSubmitParams
      def submit(params)
        parsed, options = Scrapegraphai::FeedbackSubmitParams.dump_request(params)
        @client.request(
          method: :post,
          path: "feedback",
          body: parsed,
          model: Scrapegraphai::Models::FeedbackSubmitResponse,
          options: options
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
