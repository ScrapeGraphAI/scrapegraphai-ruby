# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Feedback#submit
    class FeedbackSubmitResponse < Scrapegraphai::Internal::Type::BaseModel
      # @!attribute feedback_id
      #
      #   @return [String, nil]
      optional :feedback_id, String

      # @!attribute feedback_timestamp
      #
      #   @return [Time, nil]
      optional :feedback_timestamp, Time

      # @!attribute message
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute request_id
      #
      #   @return [String, nil]
      optional :request_id, String

      # @!method initialize(feedback_id: nil, feedback_timestamp: nil, message: nil, request_id: nil)
      #   @param feedback_id [String]
      #   @param feedback_timestamp [Time]
      #   @param message [String]
      #   @param request_id [String]
    end
  end
end
