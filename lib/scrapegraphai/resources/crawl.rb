# frozen_string_literal: true

module Scrapegraphai
  module Resources
    class Crawl
      # Retrieve the status and results of a crawling job
      #
      # @overload retrieve_results(task_id, request_options: {})
      #
      # @param task_id [String] Celery task identifier
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::CrawlRetrieveResultsResponse]
      #
      # @see Scrapegraphai::Models::CrawlRetrieveResultsParams
      def retrieve_results(task_id, params = {})
        @client.request(
          method: :get,
          path: ["crawl/%1$s", task_id],
          model: Scrapegraphai::Models::CrawlRetrieveResultsResponse,
          options: params[:request_options]
        )
      end

      # Initiate comprehensive website crawling with sitemap support. Supports both AI
      # extraction mode and markdown conversion mode. Returns a task ID for async
      # processing.
      #
      # @overload start(url:, depth: nil, extraction_mode: nil, max_pages: nil, prompt: nil, render_heavy_js: nil, rules: nil, schema: nil, sitemap: nil, request_options: {})
      #
      # @param url [String] Starting URL for crawling
      #
      # @param depth [Integer] Maximum crawl depth from starting URL
      #
      # @param extraction_mode [Boolean] Use AI extraction (true) or markdown conversion (false)
      #
      # @param max_pages [Integer] Maximum number of pages to crawl
      #
      # @param prompt [String, nil] Extraction prompt (required if extraction_mode is true)
      #
      # @param render_heavy_js [Boolean] Enable heavy JavaScript rendering
      #
      # @param rules [Scrapegraphai::Models::CrawlStartParams::Rules]
      #
      # @param schema [Object, nil] Output schema for extraction
      #
      # @param sitemap [Boolean] Use sitemap for crawling
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::CrawlStartResponse]
      #
      # @see Scrapegraphai::Models::CrawlStartParams
      def start(params)
        parsed, options = Scrapegraphai::CrawlStartParams.dump_request(params)
        @client.request(
          method: :post,
          path: "crawl",
          body: parsed,
          model: Scrapegraphai::Models::CrawlStartResponse,
          options: options
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
