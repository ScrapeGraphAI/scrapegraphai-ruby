# frozen_string_literal: true

module Scrapegraphai
  module Models
    class FailedSmartscraper < Scrapegraphai::Internal::Type::BaseModel
      # @!attribute error
      #   Error description
      #
      #   @return [String, nil]
      optional :error, String

      # @!attribute request_id
      #
      #   @return [String, nil]
      optional :request_id, String

      # @!attribute result
      #
      #   @return [Object, nil]
      optional :result, Scrapegraphai::Internal::Type::Unknown, nil?: true

      # @!attribute status
      #
      #   @return [Symbol, Scrapegraphai::Models::FailedSmartscraper::Status, nil]
      optional :status, enum: -> { Scrapegraphai::FailedSmartscraper::Status }

      # @!attribute user_prompt
      #
      #   @return [String, nil]
      optional :user_prompt, String

      # @!attribute website_url
      #
      #   @return [String, nil]
      optional :website_url, String, nil?: true

      # @!method initialize(error: nil, request_id: nil, result: nil, status: nil, user_prompt: nil, website_url: nil)
      #   @param error [String] Error description
      #
      #   @param request_id [String]
      #
      #   @param result [Object, nil]
      #
      #   @param status [Symbol, Scrapegraphai::Models::FailedSmartscraper::Status]
      #
      #   @param user_prompt [String]
      #
      #   @param website_url [String, nil]

      # @see Scrapegraphai::Models::FailedSmartscraper#status
      module Status
        extend Scrapegraphai::Internal::Type::Enum

        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
