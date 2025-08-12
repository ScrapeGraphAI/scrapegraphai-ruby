# typed: strong

module Scrapegraphai
  module Resources
    class GenerateSchema
      # Generate or modify JSON schemas based on natural language descriptions. Can
      # create new schemas or extend existing ones.
      sig do
        params(
          user_prompt: String,
          existing_schema: T.nilable(T.anything),
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(Scrapegraphai::Models::GenerateSchemaCreateResponse)
      end
      def create(
        # Natural language description of desired schema
        user_prompt:,
        # Existing schema to modify or extend
        existing_schema: nil,
        request_options: {}
      )
      end

      # Retrieve the status and results of a schema generation request
      sig do
        params(
          request_id: String,
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(
          Scrapegraphai::Models::GenerateSchemaRetrieveResponse::Variants
        )
      end
      def retrieve(request_id, request_options: {})
      end

      # @api private
      sig { params(client: Scrapegraphai::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
