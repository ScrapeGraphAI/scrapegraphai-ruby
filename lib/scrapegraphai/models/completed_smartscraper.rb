# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Smartscraper#create
    class CompletedSmartscraper < Scrapegraphai::Internal::Type::BaseModel
      # @!attribute error
      #   Error message (empty on success)
      #
      #   @return [String, nil]
      optional :error, String

      # @!attribute request_id
      #   Unique request identifier
      #
      #   @return [String, nil]
      optional :request_id, String

      # @!attribute result
      #   Extracted data based on prompt/schema
      #
      #   @return [Object, nil]
      optional :result, Scrapegraphai::Internal::Type::Unknown, nil?: true

      # @!attribute status
      #   Processing status
      #
      #   @return [Symbol, Scrapegraphai::Models::CompletedSmartscraper::Status, nil]
      optional :status, enum: -> { Scrapegraphai::CompletedSmartscraper::Status }

      # @!attribute user_prompt
      #
      #   @return [String, nil]
      optional :user_prompt, String

      # @!attribute website_url
      #
      #   @return [String, nil]
      optional :website_url, String, nil?: true

      # @!method initialize(error: nil, request_id: nil, result: nil, status: nil, user_prompt: nil, website_url: nil)
      #   @param error [String] Error message (empty on success)
      #
      #   @param request_id [String] Unique request identifier
      #
      #   @param result [Object, nil] Extracted data based on prompt/schema
      #
      #   @param status [Symbol, Scrapegraphai::Models::CompletedSmartscraper::Status] Processing status
      #
      #   @param user_prompt [String]
      #
      #   @param website_url [String, nil]

      # Processing status
      #
      # @see Scrapegraphai::Models::CompletedSmartscraper#status
      module Status
        extend Scrapegraphai::Internal::Type::Enum

        QUEUED = :queued
        PROCESSING = :processing
        COMPLETED = :completed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
