# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Markdownify#convert
    class MarkdownifyConvertParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      # @!attribute website_url
      #   URL to convert to markdown
      #
      #   @return [String]
      required :website_url, String

      # @!attribute headers
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, Scrapegraphai::Internal::Type::HashOf[String]

      # @!attribute steps
      #   Interaction steps before conversion
      #
      #   @return [Array<String>, nil]
      optional :steps, Scrapegraphai::Internal::Type::ArrayOf[String]

      # @!method initialize(website_url:, headers: nil, steps: nil, request_options: {})
      #   @param website_url [String] URL to convert to markdown
      #
      #   @param headers [Hash{Symbol=>String}]
      #
      #   @param steps [Array<String>] Interaction steps before conversion
      #
      #   @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
