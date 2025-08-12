# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Crawl#start
    class CrawlStartParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      # @!attribute url
      #   Starting URL for crawling
      #
      #   @return [String]
      required :url, String

      # @!attribute depth
      #   Maximum crawl depth from starting URL
      #
      #   @return [Integer, nil]
      optional :depth, Integer

      # @!attribute extraction_mode
      #   Use AI extraction (true) or markdown conversion (false)
      #
      #   @return [Boolean, nil]
      optional :extraction_mode, Scrapegraphai::Internal::Type::Boolean

      # @!attribute max_pages
      #   Maximum number of pages to crawl
      #
      #   @return [Integer, nil]
      optional :max_pages, Integer

      # @!attribute prompt
      #   Extraction prompt (required if extraction_mode is true)
      #
      #   @return [String, nil]
      optional :prompt, String, nil?: true

      # @!attribute render_heavy_js
      #   Enable heavy JavaScript rendering
      #
      #   @return [Boolean, nil]
      optional :render_heavy_js, Scrapegraphai::Internal::Type::Boolean

      # @!attribute rules
      #
      #   @return [Scrapegraphai::Models::CrawlStartParams::Rules, nil]
      optional :rules, -> { Scrapegraphai::CrawlStartParams::Rules }

      # @!attribute schema
      #   Output schema for extraction
      #
      #   @return [Object, nil]
      optional :schema, Scrapegraphai::Internal::Type::Unknown, nil?: true

      # @!attribute sitemap
      #   Use sitemap for crawling
      #
      #   @return [Boolean, nil]
      optional :sitemap, Scrapegraphai::Internal::Type::Boolean

      # @!method initialize(url:, depth: nil, extraction_mode: nil, max_pages: nil, prompt: nil, render_heavy_js: nil, rules: nil, schema: nil, sitemap: nil, request_options: {})
      #   @param url [String] Starting URL for crawling
      #
      #   @param depth [Integer] Maximum crawl depth from starting URL
      #
      #   @param extraction_mode [Boolean] Use AI extraction (true) or markdown conversion (false)
      #
      #   @param max_pages [Integer] Maximum number of pages to crawl
      #
      #   @param prompt [String, nil] Extraction prompt (required if extraction_mode is true)
      #
      #   @param render_heavy_js [Boolean] Enable heavy JavaScript rendering
      #
      #   @param rules [Scrapegraphai::Models::CrawlStartParams::Rules]
      #
      #   @param schema [Object, nil] Output schema for extraction
      #
      #   @param sitemap [Boolean] Use sitemap for crawling
      #
      #   @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}]

      class Rules < Scrapegraphai::Internal::Type::BaseModel
        # @!attribute exclude
        #   URL patterns to exclude from crawling
        #
        #   @return [Array<String>, nil]
        optional :exclude, Scrapegraphai::Internal::Type::ArrayOf[String]

        # @!attribute same_domain
        #   Restrict crawling to same domain
        #
        #   @return [Boolean, nil]
        optional :same_domain, Scrapegraphai::Internal::Type::Boolean

        # @!method initialize(exclude: nil, same_domain: nil)
        #   @param exclude [Array<String>] URL patterns to exclude from crawling
        #
        #   @param same_domain [Boolean] Restrict crawling to same domain
      end
    end
  end
end
