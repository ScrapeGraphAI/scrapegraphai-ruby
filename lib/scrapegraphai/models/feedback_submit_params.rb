# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Feedback#submit
    class FeedbackSubmitParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      # @!attribute rating
      #   Rating score
      #
      #   @return [Integer]
      required :rating, Integer

      # @!attribute request_id
      #   Request to provide feedback for
      #
      #   @return [String]
      required :request_id, String

      # @!attribute feedback_text
      #   Optional feedback comments
      #
      #   @return [String, nil]
      optional :feedback_text, String, nil?: true

      # @!method initialize(rating:, request_id:, feedback_text: nil, request_options: {})
      #   @param rating [Integer] Rating score
      #
      #   @param request_id [String] Request to provide feedback for
      #
      #   @param feedback_text [String, nil] Optional feedback comments
      #
      #   @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
