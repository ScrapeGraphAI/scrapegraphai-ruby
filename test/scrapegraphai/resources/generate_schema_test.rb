# frozen_string_literal: true

require_relative "../test_helper"

class Scrapegraphai::Test::Resources::GenerateSchemaTest < Scrapegraphai::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @scrapegraphai.generate_schema.create(
        user_prompt: "Create a schema for product information including name, price, and reviews"
      )

    assert_pattern do
      response => Scrapegraphai::Models::GenerateSchemaCreateResponse
    end

    assert_pattern do
      response => {
        error: String | nil,
        generated_schema: Scrapegraphai::Internal::Type::Unknown | nil,
        refined_prompt: String | nil,
        request_id: String | nil,
        status: Scrapegraphai::Models::GenerateSchemaCreateResponse::Status | nil,
        user_prompt: String | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @scrapegraphai.generate_schema.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Scrapegraphai::Models::GenerateSchemaRetrieveResponse
    end

    assert_pattern do
      case response
      in Scrapegraphai::Models::GenerateSchemaRetrieveResponse::CompletedSchemaGenerationResponse
      in Scrapegraphai::Models::GenerateSchemaRetrieveResponse::FailedSchemaGenerationResponse
      end
    end
  end
end
