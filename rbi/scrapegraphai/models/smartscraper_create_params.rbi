# typed: strong

module Scrapegraphai
  module Models
    class SmartscraperCreateParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::SmartscraperCreateParams,
            Scrapegraphai::Internal::AnyHash
          )
        end

      # Extraction instruction for the LLM
      sig { returns(String) }
      attr_accessor :user_prompt

      # Cookies to include in the request
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :cookies

      sig { params(cookies: T::Hash[Symbol, String]).void }
      attr_writer :cookies

      # HTTP headers to include in the request
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # Number of infinite scroll operations to perform
      sig { returns(T.nilable(Integer)) }
      attr_reader :number_of_scrolls

      sig { params(number_of_scrolls: Integer).void }
      attr_writer :number_of_scrolls

      # JSON schema defining the expected output structure
      sig { returns(T.nilable(T.anything)) }
      attr_reader :output_schema

      sig { params(output_schema: T.anything).void }
      attr_writer :output_schema

      # Enable heavy JavaScript rendering
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :render_heavy_js

      sig { params(render_heavy_js: T::Boolean).void }
      attr_writer :render_heavy_js

      # Website interaction steps (e.g., clicking buttons)
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :steps

      sig { params(steps: T::Array[String]).void }
      attr_writer :steps

      # Number of pages to process for pagination
      sig { returns(T.nilable(Integer)) }
      attr_reader :total_pages

      sig { params(total_pages: Integer).void }
      attr_writer :total_pages

      # HTML content to process (max 2MB, mutually exclusive with website_url)
      sig { returns(T.nilable(String)) }
      attr_reader :website_html

      sig { params(website_html: String).void }
      attr_writer :website_html

      # URL to scrape (mutually exclusive with website_html)
      sig { returns(T.nilable(String)) }
      attr_reader :website_url

      sig { params(website_url: String).void }
      attr_writer :website_url

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
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
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
            request_options: Scrapegraphai::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
