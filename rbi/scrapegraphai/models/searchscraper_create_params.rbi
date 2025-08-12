# typed: strong

module Scrapegraphai
  module Models
    class SearchscraperCreateParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::SearchscraperCreateParams,
            Scrapegraphai::Internal::AnyHash
          )
        end

      # Search query and extraction instruction
      sig { returns(String) }
      attr_accessor :user_prompt

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # Number of websites to scrape from search results
      sig { returns(T.nilable(Integer)) }
      attr_reader :num_results

      sig { params(num_results: Integer).void }
      attr_writer :num_results

      # JSON schema for structured output
      sig { returns(T.nilable(T.anything)) }
      attr_reader :output_schema

      sig { params(output_schema: T.anything).void }
      attr_writer :output_schema

      sig do
        params(
          user_prompt: String,
          headers: T::Hash[Symbol, String],
          num_results: Integer,
          output_schema: T.anything,
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Search query and extraction instruction
        user_prompt:,
        headers: nil,
        # Number of websites to scrape from search results
        num_results: nil,
        # JSON schema for structured output
        output_schema: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            user_prompt: String,
            headers: T::Hash[Symbol, String],
            num_results: Integer,
            output_schema: T.anything,
            request_options: Scrapegraphai::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
