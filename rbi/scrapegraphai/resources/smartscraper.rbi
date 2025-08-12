# typed: strong

module Scrapegraphai
  module Resources
    class Smartscraper
      # Main scraping endpoint with LLM-powered content analysis. Supports various
      # fetching providers, infinite scrolling, pagination, and custom output schemas.
      sig do
        params(
          user_prompt: String,
          cookies: T::Hash[Symbol, String],
          headers: T::Hash[Symbol, String],
          number_of_scrolls: Integer,
          output_schema: T.anything,
          render_heavy_js: T::Boolean,
          steps: T::Array[String],
          total_pages: Integer,
          website_html: String,
          website_url: String,
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(Scrapegraphai::CompletedSmartscraper)
      end
      def create(
        # Extraction instruction for the LLM
        user_prompt:,
        # Cookies to include in the request
        cookies: nil,
        # HTTP headers to include in the request
        headers: nil,
        # Number of infinite scroll operations to perform
        number_of_scrolls: nil,
        # JSON schema defining the expected output structure
        output_schema: nil,
        # Enable heavy JavaScript rendering
        render_heavy_js: nil,
        # Website interaction steps (e.g., clicking buttons)
        steps: nil,
        # Number of pages to process for pagination
        total_pages: nil,
        # HTML content to process (max 2MB, mutually exclusive with website_url)
        website_html: nil,
        # URL to scrape (mutually exclusive with website_html)
        website_url: nil,
        request_options: {}
      )
      end

      # Retrieve the status and results of a scraping operation
      sig do
        params(
          request_id: String,
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(Scrapegraphai::Models::SmartscraperRetrieveResponse::Variants)
      end
      def retrieve(
        # Unique request identifier
        request_id,
        request_options: {}
      )
      end

      # Retrieve the status and results of a scraping operation
      sig do
        params(request_options: Scrapegraphai::RequestOptions::OrHash).returns(
          Scrapegraphai::Models::SmartscraperListResponse::Variants
        )
      end
      def list(request_options: {})
      end

      # @api private
      sig { params(client: Scrapegraphai::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
