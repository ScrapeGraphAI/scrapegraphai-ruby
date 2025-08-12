# frozen_string_literal: true

require_relative "../test_helper"

class Scrapegraphai::Test::Resources::ValidateTest < Scrapegraphai::Test::ResourceTest
  def test_api_key
    skip("Prism tests are disabled")

    response = @scrapegraphai.validate.api_key

    assert_pattern do
      response => Scrapegraphai::Models::ValidateAPIKeyResponse
    end

    assert_pattern do
      response => {
        email: String | nil
      }
    end
  end
end
