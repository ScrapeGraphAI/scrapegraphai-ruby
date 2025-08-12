# typed: strong

module Scrapegraphai
  module Models
    class MarkdownifyConvertParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::MarkdownifyConvertParams,
            Scrapegraphai::Internal::AnyHash
          )
        end

      # URL to convert to markdown
      sig { returns(String) }
      attr_accessor :website_url

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # Interaction steps before conversion
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :steps

      sig { params(steps: T::Array[String]).void }
      attr_writer :steps

      sig do
        params(
          website_url: String,
          headers: T::Hash[Symbol, String],
          steps: T::Array[String],
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # URL to convert to markdown
        website_url:,
        headers: nil,
        # Interaction steps before conversion
        steps: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            website_url: String,
            headers: T::Hash[Symbol, String],
            steps: T::Array[String],
            request_options: Scrapegraphai::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
