# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Smartscraper#create
    class SmartscraperCreateParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      # @!attribute user_prompt
      #   Extraction instruction for the LLM
      #
      #   @return [String]
      required :user_prompt, String

      # @!attribute cookies
      #   Cookies to include in the request
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :cookies, Scrapegraphai::Internal::Type::HashOf[String]

      # @!attribute headers
      #   HTTP headers to include in the request
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, Scrapegraphai::Internal::Type::HashOf[String]

      # @!attribute number_of_scrolls
      #   Number of infinite scroll operations to perform
      #
      #   @return [Integer, nil]
      optional :number_of_scrolls, Integer

      # @!attribute output_schema
      #   JSON schema defining the expected output structure
      #
      #   @return [Object, nil]
      optional :output_schema, Scrapegraphai::Internal::Type::Unknown

      # @!attribute render_heavy_js
      #   Enable heavy JavaScript rendering
      #
      #   @return [Boolean, nil]
      optional :render_heavy_js, Scrapegraphai::Internal::Type::Boolean

      # @!attribute steps
      #   Website interaction steps (e.g., clicking buttons)
      #
      #   @return [Array<String>, nil]
      optional :steps, Scrapegraphai::Internal::Type::ArrayOf[String]

      # @!attribute total_pages
      #   Number of pages to process for pagination
      #
      #   @return [Integer, nil]
      optional :total_pages, Integer

      # @!attribute website_html
      #   HTML content to process (max 2MB, mutually exclusive with website_url)
      #
      #   @return [String, nil]
      optional :website_html, String

      # @!attribute website_url
      #   URL to scrape (mutually exclusive with website_html)
      #
      #   @return [String, nil]
      optional :website_url, String

      # @!method initialize(user_prompt:, cookies: nil, headers: nil, number_of_scrolls: nil, output_schema: nil, render_heavy_js: nil, steps: nil, total_pages: nil, website_html: nil, website_url: nil, request_options: {})
      #   @param user_prompt [String] Extraction instruction for the LLM
      #
      #   @param cookies [Hash{Symbol=>String}] Cookies to include in the request
      #
      #   @param headers [Hash{Symbol=>String}] HTTP headers to include in the request
      #
      #   @param number_of_scrolls [Integer] Number of infinite scroll operations to perform
      #
      #   @param output_schema [Object] JSON schema defining the expected output structure
      #
      #   @param render_heavy_js [Boolean] Enable heavy JavaScript rendering
      #
      #   @param steps [Array<String>] Website interaction steps (e.g., clicking buttons)
      #
      #   @param total_pages [Integer] Number of pages to process for pagination
      #
      #   @param website_html [String] HTML content to process (max 2MB, mutually exclusive with website_url)
      #
      #   @param website_url [String] URL to scrape (mutually exclusive with website_html)
      #
      #   @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
