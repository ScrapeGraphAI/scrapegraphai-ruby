# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Searchscraper#create
    class CompletedSearchScraper < Scrapegraphai::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [String, nil]
      optional :error, String, nil?: true

      # @!attribute num_results
      #
      #   @return [Integer, nil]
      optional :num_results, Integer

      # @!attribute reference_urls
      #   URLs of sources used
      #
      #   @return [Array<String>, nil]
      optional :reference_urls, Scrapegraphai::Internal::Type::ArrayOf[String]

      # @!attribute request_id
      #
      #   @return [String, nil]
      optional :request_id, String

      # @!attribute result
      #   Merged results from all scraped websites
      #
      #   @return [Object, nil]
      optional :result, Scrapegraphai::Internal::Type::Unknown

      # @!attribute status
      #
      #   @return [Symbol, Scrapegraphai::Models::CompletedSearchScraper::Status, nil]
      optional :status, enum: -> { Scrapegraphai::CompletedSearchScraper::Status }

      # @!attribute user_prompt
      #
      #   @return [String, nil]
      optional :user_prompt, String

      # @!method initialize(error: nil, num_results: nil, reference_urls: nil, request_id: nil, result: nil, status: nil, user_prompt: nil)
      #   @param error [String, nil]
      #
      #   @param num_results [Integer]
      #
      #   @param reference_urls [Array<String>] URLs of sources used
      #
      #   @param request_id [String]
      #
      #   @param result [Object] Merged results from all scraped websites
      #
      #   @param status [Symbol, Scrapegraphai::Models::CompletedSearchScraper::Status]
      #
      #   @param user_prompt [String]

      # @see Scrapegraphai::Models::CompletedSearchScraper#status
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
