# frozen_string_literal: true

module Scrapegraphai
  module Resources
    class Markdownify
      # Convert web page content to clean Markdown format
      #
      # @overload convert(website_url:, headers: nil, steps: nil, request_options: {})
      #
      # @param website_url [String] URL to convert to markdown
      #
      # @param headers [Hash{Symbol=>String}]
      #
      # @param steps [Array<String>] Interaction steps before conversion
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::CompletedMarkdownify]
      #
      # @see Scrapegraphai::Models::MarkdownifyConvertParams
      def convert(params)
        parsed, options = Scrapegraphai::MarkdownifyConvertParams.dump_request(params)
        @client.request(
          method: :post,
          path: "markdownify",
          body: parsed,
          model: Scrapegraphai::CompletedMarkdownify,
          options: options
        )
      end

      # Retrieve the status and results of a markdown conversion
      #
      # @overload retrieve_status(request_id, request_options: {})
      #
      # @param request_id [String]
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::CompletedMarkdownify, Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse]
      #
      # @see Scrapegraphai::Models::MarkdownifyRetrieveStatusParams
      def retrieve_status(request_id, params = {})
        @client.request(
          method: :get,
          path: ["markdownify/%1$s", request_id],
          model: Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse,
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
