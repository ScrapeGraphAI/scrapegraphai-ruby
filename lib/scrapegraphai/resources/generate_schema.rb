# frozen_string_literal: true

module Scrapegraphai
  module Resources
    class GenerateSchema
      # Generate or modify JSON schemas based on natural language descriptions. Can
      # create new schemas or extend existing ones.
      #
      # @overload create(user_prompt:, existing_schema: nil, request_options: {})
      #
      # @param user_prompt [String] Natural language description of desired schema
      #
      # @param existing_schema [Object, nil] Existing schema to modify or extend
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::GenerateSchemaCreateResponse]
      #
      # @see Scrapegraphai::Models::GenerateSchemaCreateParams
      def create(params)
        parsed, options = Scrapegraphai::GenerateSchemaCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "generate_schema",
          body: parsed,
          model: Scrapegraphai::Models::GenerateSchemaCreateResponse,
          options: options
        )
      end

      # Retrieve the status and results of a schema generation request
      #
      # @overload retrieve(request_id, request_options: {})
      #
      # @param request_id [String] Unique request identifier
      #
      # @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse, Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse]
      #
      # @see Scrapegraphai::Models::GenerateSchemaRetrieveParams
      def retrieve(request_id, params = {})
        @client.request(
          method: :get,
          path: ["generate_schema/%1$s", request_id],
          model: Scrapegraphai::Models::GenerateSchemaRetrieveResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Scrapegraphai::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
