# typed: strong

module Scrapegraphai
  module Resources
    class Markdownify
      # Convert web page content to clean Markdown format
      sig do
        params(
          website_url: String,
          headers: T::Hash[Symbol, String],
          steps: T::Array[String],
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(Scrapegraphai::CompletedMarkdownify)
      end
      def convert(
        # URL to convert to markdown
        website_url:,
        headers: nil,
        # Interaction steps before conversion
        steps: nil,
        request_options: {}
      )
      end

      # Retrieve the status and results of a markdown conversion
      sig do
        params(
          request_id: String,
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(
          Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::Variants
        )
      end
      def retrieve_status(request_id, request_options: {})
      end

      # @api private
      sig { params(client: Scrapegraphai::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
