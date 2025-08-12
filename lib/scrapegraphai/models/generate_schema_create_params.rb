# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::GenerateSchema#create
    class GenerateSchemaCreateParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      # @!attribute user_prompt
      #   Natural language description of desired schema
      #
      #   @return [String]
      required :user_prompt, String

      # @!attribute existing_schema
      #   Existing schema to modify or extend
      #
      #   @return [Object, nil]
      optional :existing_schema, Scrapegraphai::Internal::Type::Unknown, nil?: true

      # @!method initialize(user_prompt:, existing_schema: nil, request_options: {})
      #   @param user_prompt [String] Natural language description of desired schema
      #
      #   @param existing_schema [Object, nil] Existing schema to modify or extend
      #
      #   @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
