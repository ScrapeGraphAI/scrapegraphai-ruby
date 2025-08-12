# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Markdownify#convert
    class CompletedMarkdownify < Scrapegraphai::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [String, nil]
      optional :error, String

      # @!attribute request_id
      #
      #   @return [String, nil]
      optional :request_id, String

      # @!attribute result
      #   Markdown content
      #
      #   @return [String, nil]
      optional :result, String, nil?: true

      # @!attribute status
      #
      #   @return [Symbol, Scrapegraphai::Models::CompletedMarkdownify::Status, nil]
      optional :status, enum: -> { Scrapegraphai::CompletedMarkdownify::Status }

      # @!attribute website_url
      #
      #   @return [String, nil]
      optional :website_url, String

      # @!method initialize(error: nil, request_id: nil, result: nil, status: nil, website_url: nil)
      #   @param error [String]
      #
      #   @param request_id [String]
      #
      #   @param result [String, nil] Markdown content
      #
      #   @param status [Symbol, Scrapegraphai::Models::CompletedMarkdownify::Status]
      #
      #   @param website_url [String]

      # @see Scrapegraphai::Models::CompletedMarkdownify#status
      module Status
        extend Scrapegraphai::Internal::Type::Enum

        QUEUED = :queued
        PROCESSING = :processing
        COMPLETED = :completed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
