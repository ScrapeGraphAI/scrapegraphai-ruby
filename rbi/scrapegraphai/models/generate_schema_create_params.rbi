# typed: strong

module Scrapegraphai
  module Models
    class GenerateSchemaCreateParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::GenerateSchemaCreateParams,
            Scrapegraphai::Internal::AnyHash
          )
        end

      # Natural language description of desired schema
      sig { returns(String) }
      attr_accessor :user_prompt

      # Existing schema to modify or extend
      sig { returns(T.nilable(T.anything)) }
      attr_accessor :existing_schema

      sig do
        params(
          user_prompt: String,
          existing_schema: T.nilable(T.anything),
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Natural language description of desired schema
        user_prompt:,
        # Existing schema to modify or extend
        existing_schema: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            user_prompt: String,
            existing_schema: T.nilable(T.anything),
            request_options: Scrapegraphai::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
