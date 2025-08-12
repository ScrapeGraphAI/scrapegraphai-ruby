# typed: strong

module Scrapegraphai
  module Models
    class GenerateSchemaCreateResponse < Scrapegraphai::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::Models::GenerateSchemaCreateResponse,
            Scrapegraphai::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :error

      # Generated JSON schema
      sig { returns(T.nilable(T.anything)) }
      attr_reader :generated_schema

      sig { params(generated_schema: T.anything).void }
      attr_writer :generated_schema

      # Enhanced search prompt generated from user input
      sig { returns(T.nilable(String)) }
      attr_reader :refined_prompt

      sig { params(refined_prompt: String).void }
      attr_writer :refined_prompt

      sig { returns(T.nilable(String)) }
      attr_reader :request_id

      sig { params(request_id: String).void }
      attr_writer :request_id

      sig do
        returns(
          T.nilable(
            Scrapegraphai::Models::GenerateSchemaCreateResponse::Status::TaggedSymbol
          )
        )
      end
      attr_reader :status

      sig do
        params(
          status:
            Scrapegraphai::Models::GenerateSchemaCreateResponse::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig { returns(T.nilable(String)) }
      attr_reader :user_prompt

      sig { params(user_prompt: String).void }
      attr_writer :user_prompt

      sig do
        params(
          error: T.nilable(String),
          generated_schema: T.anything,
          refined_prompt: String,
          request_id: String,
          status:
            Scrapegraphai::Models::GenerateSchemaCreateResponse::Status::OrSymbol,
          user_prompt: String
        ).returns(T.attached_class)
      end
      def self.new(
        error: nil,
        # Generated JSON schema
        generated_schema: nil,
        # Enhanced search prompt generated from user input
        refined_prompt: nil,
        request_id: nil,
        status: nil,
        user_prompt: nil
      )
      end

      sig do
        override.returns(
          {
            error: T.nilable(String),
            generated_schema: T.anything,
            refined_prompt: String,
            request_id: String,
            status:
              Scrapegraphai::Models::GenerateSchemaCreateResponse::Status::TaggedSymbol,
            user_prompt: String
          }
        )
      end
      def to_hash
      end

      module Status
        extend Scrapegraphai::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Scrapegraphai::Models::GenerateSchemaCreateResponse::Status
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COMPLETED =
          T.let(
            :completed,
            Scrapegraphai::Models::GenerateSchemaCreateResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Scrapegraphai::Models::GenerateSchemaCreateResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
