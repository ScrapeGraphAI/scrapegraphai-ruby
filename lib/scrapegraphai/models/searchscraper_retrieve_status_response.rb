# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Searchscraper#retrieve_status
    module SearchscraperRetrieveStatusResponse
      extend Scrapegraphai::Internal::Type::Union

      variant -> { Scrapegraphai::CompletedSearchScraper }

      variant -> { Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse }

      class FailedSearchScraperResponse < Scrapegraphai::Internal::Type::BaseModel
        # @!attribute error
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute num_results
        #
        #   @return [Integer, nil]
        optional :num_results, Integer

        # @!attribute reference_urls
        #
        #   @return [Array<String>, nil]
        optional :reference_urls, Scrapegraphai::Internal::Type::ArrayOf[String]

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
        #   @return [Symbol, Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse::Status, nil]
        optional :status,
                 enum: -> { Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse::Status }

        # @!attribute user_prompt
        #
        #   @return [String, nil]
        optional :user_prompt, String

        # @!method initialize(error: nil, num_results: nil, reference_urls: nil, request_id: nil, result: nil, status: nil, user_prompt: nil)
        #   @param error [String]
        #   @param num_results [Integer]
        #   @param reference_urls [Array<String>]
        #   @param request_id [String]
        #   @param result [Object, nil]
        #   @param status [Symbol, Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse::Status]
        #   @param user_prompt [String]

        # @see Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse#status
        module Status
          extend Scrapegraphai::Internal::Type::Enum

          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(Scrapegraphai::Models::CompletedSearchScraper, Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse)]
    end
  end
end
