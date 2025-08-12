# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::GenerateSchema#retrieve
    module GenerateSchemaRetrieveResponse
      extend Scrapegraphai::Internal::Type::Union

      variant -> { Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse }

      variant -> { Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse }

      class CompletedSchemaGenerationResponse < Scrapegraphai::Internal::Type::BaseModel
        # @!attribute error
        #
        #   @return [String, nil]
        optional :error, String, nil?: true

        # @!attribute generated_schema
        #
        #   @return [Object, nil]
        optional :generated_schema, Scrapegraphai::Internal::Type::Unknown

        # @!attribute refined_prompt
        #
        #   @return [String, nil]
        optional :refined_prompt, String

        # @!attribute request_id
        #
        #   @return [String, nil]
        optional :request_id, String

        # @!attribute status
        #
        #   @return [Symbol, Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse::Status, nil]
        optional :status,
                 enum: -> { Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse::Status }

        # @!attribute user_prompt
        #
        #   @return [String, nil]
        optional :user_prompt, String

        # @!method initialize(error: nil, generated_schema: nil, refined_prompt: nil, request_id: nil, status: nil, user_prompt: nil)
        #   @param error [String, nil]
        #   @param generated_schema [Object]
        #   @param refined_prompt [String]
        #   @param request_id [String]
        #   @param status [Symbol, Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse::Status]
        #   @param user_prompt [String]

        # @see Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse#status
        module Status
          extend Scrapegraphai::Internal::Type::Enum

          COMPLETED = :completed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class FailedSchemaGenerationResponse < Scrapegraphai::Internal::Type::BaseModel
        # @!attribute error
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute generated_schema
        #
        #   @return [Object, nil]
        optional :generated_schema, Scrapegraphai::Internal::Type::Unknown, nil?: true

        # @!attribute refined_prompt
        #
        #   @return [String, nil]
        optional :refined_prompt, String, nil?: true

        # @!attribute request_id
        #
        #   @return [String, nil]
        optional :request_id, String

        # @!attribute status
        #
        #   @return [Symbol, Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse::Status, nil]
        optional :status,
                 enum: -> { Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse::Status }

        # @!attribute user_prompt
        #
        #   @return [String, nil]
        optional :user_prompt, String

        # @!method initialize(error: nil, generated_schema: nil, refined_prompt: nil, request_id: nil, status: nil, user_prompt: nil)
        #   @param error [String]
        #   @param generated_schema [Object, nil]
        #   @param refined_prompt [String, nil]
        #   @param request_id [String]
        #   @param status [Symbol, Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse::Status]
        #   @param user_prompt [String]

        # @see Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse#status
        module Status
          extend Scrapegraphai::Internal::Type::Enum

          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse, Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse)]
    end
  end
end
