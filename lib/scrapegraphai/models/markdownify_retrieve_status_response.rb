# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Markdownify#retrieve_status
    module MarkdownifyRetrieveStatusResponse
      extend Scrapegraphai::Internal::Type::Union

      variant -> { Scrapegraphai::CompletedMarkdownify }

      variant -> { Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse }

      class FailedMarkdownifyResponse < Scrapegraphai::Internal::Type::BaseModel
        # @!attribute error
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute request_id
        #
        #   @return [String, nil]
        optional :request_id, String

        # @!attribute result
        #
        #   @return [String, nil]
        optional :result, String, nil?: true

        # @!attribute status
        #
        #   @return [Symbol, Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse::Status, nil]
        optional :status,
                 enum: -> { Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse::Status }

        # @!attribute website_url
        #
        #   @return [String, nil]
        optional :website_url, String

        # @!method initialize(error: nil, request_id: nil, result: nil, status: nil, website_url: nil)
        #   @param error [String]
        #   @param request_id [String]
        #   @param result [String, nil]
        #   @param status [Symbol, Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse::Status]
        #   @param website_url [String]

        # @see Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse#status
        module Status
          extend Scrapegraphai::Internal::Type::Enum

          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(Scrapegraphai::Models::CompletedMarkdownify, Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse)]
    end
  end
end
