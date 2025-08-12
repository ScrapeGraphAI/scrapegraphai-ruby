# typed: strong

module Scrapegraphai
  module Resources
    class Crawl
      # Retrieve the status and results of a crawling job
      sig do
        params(
          task_id: String,
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(Scrapegraphai::Models::CrawlRetrieveResultsResponse)
      end
      def retrieve_results(
        # Celery task identifier
        task_id,
        request_options: {}
      )
      end

      # Initiate comprehensive website crawling with sitemap support. Supports both AI
      # extraction mode and markdown conversion mode. Returns a task ID for async
      # processing.
      sig do
        params(
          url: String,
          depth: Integer,
          extraction_mode: T::Boolean,
          max_pages: Integer,
          prompt: T.nilable(String),
          render_heavy_js: T::Boolean,
          rules: Scrapegraphai::CrawlStartParams::Rules::OrHash,
          schema: T.nilable(T.anything),
          sitemap: T::Boolean,
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(Scrapegraphai::Models::CrawlStartResponse)
      end
      def start(
        # Starting URL for crawling
        url:,
        # Maximum crawl depth from starting URL
        depth: nil,
        # Use AI extraction (true) or markdown conversion (false)
        extraction_mode: nil,
        # Maximum number of pages to crawl
        max_pages: nil,
        # Extraction prompt (required if extraction_mode is true)
        prompt: nil,
        # Enable heavy JavaScript rendering
        render_heavy_js: nil,
        rules: nil,
        # Output schema for extraction
        schema: nil,
        # Use sitemap for crawling
        sitemap: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Scrapegraphai::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
