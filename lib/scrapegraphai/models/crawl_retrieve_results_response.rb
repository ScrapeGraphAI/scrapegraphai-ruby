# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Crawl#retrieve_results
    class CrawlRetrieveResultsResponse < Scrapegraphai::Internal::Type::BaseModel
      # @!attribute result
      #   Successful crawl results
      #
      #   @return [Object, String, nil]
      optional :result, union: -> { Scrapegraphai::Models::CrawlRetrieveResultsResponse::Result }

      # @!attribute status
      #
      #   @return [Symbol, Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status, nil]
      optional :status, enum: -> { Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status }

      # @!attribute task_id
      #
      #   @return [String, nil]
      optional :task_id, String

      # @!attribute traceback
      #   Error traceback for failed tasks
      #
      #   @return [String, nil]
      optional :traceback, String, nil?: true

      # @!method initialize(result: nil, status: nil, task_id: nil, traceback: nil)
      #   @param result [Object, String] Successful crawl results
      #
      #   @param status [Symbol, Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status]
      #
      #   @param task_id [String]
      #
      #   @param traceback [String, nil] Error traceback for failed tasks

      # Successful crawl results
      #
      # @see Scrapegraphai::Models::CrawlRetrieveResultsResponse#result
      module Result
        extend Scrapegraphai::Internal::Type::Union

        # Successful crawl results
        variant Scrapegraphai::Internal::Type::Unknown

        # Error message
        variant String

        # @!method self.variants
        #   @return [Array(Object, String)]
      end

      # @see Scrapegraphai::Models::CrawlRetrieveResultsResponse#status
      module Status
        extend Scrapegraphai::Internal::Type::Enum

        PENDING = :PENDING
        STARTED = :STARTED
        SUCCESS = :SUCCESS
        FAILURE = :FAILURE
        RETRY = :RETRY
        REVOKED = :REVOKED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
