# frozen_string_literal: true

module Scrapegraphai
  module Resources
    class Smartscraper
      # Main scraping endpoint with LLM-powered content analysis. Supports various
      # fetching providers, infinite scrolling, pagination, and custom output schemas.
      #
      # @overload create(user_prompt:, cookies: nil, headers: nil, number_of_scrolls: nil, output_schema: nil, render_heavy_js: nil, steps: nil, total_pages: nil, website_html: nil, website_url: nil, request_options: {})
      #
      # @param user_prompt [String] Extraction instruction for the LLM
      #
      # @param cookies [Hash{Symbol=>String}] Cookies to include in the request
      #
      # @param headers [Hash{Symbol=>String}] HTTP headers to include in the request
      #
      # @param number_of_scrolls [Integer] Number of infinite scroll operations to perform
      #
      # @param output_schema [Object] JSON schema defining the expected output structure
      #
      # @param render_heavy_js [Boolean] Enable heavy JavaScript rendering
      #
      # @param steps [Array<String>] Website interaction steps (e.g., clicking buttons)
      #
      # @param total_pages [Integer] Number of pages to process for pagination
      #
      # @param website_html [String] HTML content to process (max 2MB, mutually exclusive with website_url)
      #
      # @param website_url [String] URL to scrape (mutually exclusive with website_html)
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::CompletedSmartscraper]
      #
      # @see Scrapegraphai::Models::SmartscraperCreateParams
      def create(params)
        parsed, options = Scrapegraphai::SmartscraperCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "smartscraper",
          body: parsed,
          model: Scrapegraphai::CompletedSmartscraper,
          options: options
        )
      end

      # Retrieve the status and results of a scraping operation
      #
      # @overload retrieve(request_id, request_options: {})
      #
      # @param request_id [String] Unique request identifier
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::CompletedSmartscraper, Scrapegraphai::Models::FailedSmartscraper]
      #
      # @see Scrapegraphai::Models::SmartscraperRetrieveParams
      def retrieve(request_id, params = {})
        @client.request(
          method: :get,
          path: ["smartscraper/%1$s", request_id],
          model: Scrapegraphai::Models::SmartscraperRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Retrieve the status and results of a scraping operation
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::CompletedSmartscraper, Scrapegraphai::Models::FailedSmartscraper]
      #
      # @see Scrapegraphai::Models::SmartscraperListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "smartscraper",
          model: Scrapegraphai::Models::SmartscraperListResponse,
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
