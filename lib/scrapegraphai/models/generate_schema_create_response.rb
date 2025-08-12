# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::GenerateSchema#create
    class GenerateSchemaCreateResponse < Scrapegraphai::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [String, nil]
      optional :error, String, nil?: true

      # @!attribute generated_schema
      #   Generated JSON schema
      #
      #   @return [Object, nil]
      optional :generated_schema, Scrapegraphai::Internal::Type::Unknown

      # @!attribute refined_prompt
      #   Enhanced search prompt generated from user input
      #
      #   @return [String, nil]
      optional :refined_prompt, String

      # @!attribute request_id
      #
      #   @return [String, nil]
      optional :request_id, String

      # @!attribute status
      #
      #   @return [Symbol, Scrapegraphai::Models::GenerateSchemaCreateResponse::Status, nil]
      optional :status, enum: -> { Scrapegraphai::Models::GenerateSchemaCreateResponse::Status }

      # @!attribute user_prompt
      #
      #   @return [String, nil]
      optional :user_prompt, String

      # @!method initialize(error: nil, generated_schema: nil, refined_prompt: nil, request_id: nil, status: nil, user_prompt: nil)
      #   @param error [String, nil]
      #
      #   @param generated_schema [Object] Generated JSON schema
      #
      #   @param refined_prompt [String] Enhanced search prompt generated from user input
      #
      #   @param request_id [String]
      #
      #   @param status [Symbol, Scrapegraphai::Models::GenerateSchemaCreateResponse::Status]
      #
      #   @param user_prompt [String]

      # @see Scrapegraphai::Models::GenerateSchemaCreateResponse#status
      module Status
        extend Scrapegraphai::Internal::Type::Enum

        COMPLETED = :completed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
