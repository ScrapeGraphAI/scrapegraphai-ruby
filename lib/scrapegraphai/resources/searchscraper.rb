# frozen_string_literal: true

module Scrapegraphai
  module Resources
    class Searchscraper
      # Performs web search, selects relevant URLs, and extracts structured data from
      # multiple websites. Uses LLM to refine search queries and merge results from
      # different sources.
      #
      # @overload create(user_prompt:, headers: nil, num_results: nil, output_schema: nil, request_options: {})
      #
      # @param user_prompt [String] Search query and extraction instruction
      #
      # @param headers [Hash{Symbol=>String}]
      #
      # @param num_results [Integer] Number of websites to scrape from search results
      #
      # @param output_schema [Object] JSON schema for structured output
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::CompletedSearchScraper]
      #
      # @see Scrapegraphai::Models::SearchscraperCreateParams
      def create(params)
        parsed, options = Scrapegraphai::SearchscraperCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "searchscraper",
          body: parsed,
          model: Scrapegraphai::CompletedSearchScraper,
          options: options
        )
      end

      # Retrieve the status and results of a search scraping operation
      #
      # @overload retrieve_status(request_id, request_options: {})
      #
      # @param request_id [String]
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::CompletedSearchScraper, Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse]
      #
      # @see Scrapegraphai::Models::SearchscraperRetrieveStatusParams
      def retrieve_status(request_id, params = {})
        @client.request(
          method: :get,
          path: ["searchscraper/%1$s", request_id],
          model: Scrapegraphai::Models::SearchscraperRetrieveStatusResponse,
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
