# typed: strong

module Scrapegraphai
  module Models
    module GenerateSchemaRetrieveResponse
      extend Scrapegraphai::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse,
            Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse
          )
        end

      class CompletedSchemaGenerationResponse < Scrapegraphai::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse,
              Scrapegraphai::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :error

        sig { returns(T.nilable(T.anything)) }
        attr_reader :generated_schema

        sig { params(generated_schema: T.anything).void }
        attr_writer :generated_schema

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
              Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse::Status::OrSymbol
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
              Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse::Status::OrSymbol,
            user_prompt: String
          ).returns(T.attached_class)
        end
        def self.new(
          error: nil,
          generated_schema: nil,
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
                Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse::Status::TaggedSymbol,
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
                Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COMPLETED =
            T.let(
              :completed,
              Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class FailedSchemaGenerationResponse < Scrapegraphai::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse,
              Scrapegraphai::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :error

        sig { params(error: String).void }
        attr_writer :error

        sig { returns(T.nilable(T.anything)) }
        attr_accessor :generated_schema

        sig { returns(T.nilable(String)) }
        attr_accessor :refined_prompt

        sig { returns(T.nilable(String)) }
        attr_reader :request_id

        sig { params(request_id: String).void }
        attr_writer :request_id

        sig do
          returns(
            T.nilable(
              Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse::Status::OrSymbol
          ).void
        end
        attr_writer :status

        sig { returns(T.nilable(String)) }
        attr_reader :user_prompt

        sig { params(user_prompt: String).void }
        attr_writer :user_prompt

        sig do
          params(
            error: String,
            generated_schema: T.nilable(T.anything),
            refined_prompt: T.nilable(String),
            request_id: String,
            status:
              Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse::Status::OrSymbol,
            user_prompt: String
          ).returns(T.attached_class)
        end
        def self.new(
          error: nil,
          generated_schema: nil,
          refined_prompt: nil,
          request_id: nil,
          status: nil,
          user_prompt: nil
        )
        end

        sig do
          override.returns(
            {
              error: String,
              generated_schema: T.nilable(T.anything),
              refined_prompt: T.nilable(String),
              request_id: String,
              status:
                Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse::Status::TaggedSymbol,
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
                Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAILED =
            T.let(
              :failed,
              Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig do
        override.returns(
          T::Array[
            Scrapegraphai::Models::GenerateSchemaRetrieveResponse::Variants
          ]
        )
      end
      def self.variants
      end
    end
  end
end
