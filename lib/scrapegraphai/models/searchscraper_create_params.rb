# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Searchscraper#create
    class SearchscraperCreateParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      # @!attribute user_prompt
      #   Search query and extraction instruction
      #
      #   @return [String]
      required :user_prompt, String

      # @!attribute headers
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, Scrapegraphai::Internal::Type::HashOf[String]

      # @!attribute num_results
      #   Number of websites to scrape from search results
      #
      #   @return [Integer, nil]
      optional :num_results, Integer

      # @!attribute output_schema
      #   JSON schema for structured output
      #
      #   @return [Object, nil]
      optional :output_schema, Scrapegraphai::Internal::Type::Unknown

      # @!method initialize(user_prompt:, headers: nil, num_results: nil, output_schema: nil, request_options: {})
      #   @param user_prompt [String] Search query and extraction instruction
      #
      #   @param headers [Hash{Symbol=>String}]
      #
      #   @param num_results [Integer] Number of websites to scrape from search results
      #
      #   @param output_schema [Object] JSON schema for structured output
      #
      #   @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
