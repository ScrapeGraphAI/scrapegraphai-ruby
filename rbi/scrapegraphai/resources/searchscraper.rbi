# typed: strong

module Scrapegraphai
  module Resources
    class Searchscraper
      # Performs web search, selects relevant URLs, and extracts structured data from
      # multiple websites. Uses LLM to refine search queries and merge results from
      # different sources.
      sig do
        params(
          user_prompt: String,
          headers: T::Hash[Symbol, String],
          num_results: Integer,
          output_schema: T.anything,
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(Scrapegraphai::CompletedSearchScraper)
      end
      def create(
        # Search query and extraction instruction
        user_prompt:,
        headers: nil,
        # Number of websites to scrape from search results
        num_results: nil,
        # JSON schema for structured output
        output_schema: nil,
        request_options: {}
      )
      end

      # Retrieve the status and results of a search scraping operation
      sig do
        params(
          request_id: String,
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(
          Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::Variants
        )
      end
      def retrieve_status(request_id, request_options: {})
      end

      # @api private
      sig { params(client: Scrapegraphai::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
