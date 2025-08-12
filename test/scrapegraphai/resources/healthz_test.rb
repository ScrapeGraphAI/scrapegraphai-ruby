# frozen_string_literal: true

require_relative "../test_helper"

class Scrapegraphai::Test::Resources::HealthzTest < Scrapegraphai::Test::ResourceTest
  def test_check
    skip("Prism tests are disabled")

    response = @scrapegraphai.healthz.check

    assert_pattern do
      response => Scrapegraphai::Models::HealthzCheckResponse
    end

    assert_pattern do
      response => {
        services: ^(Scrapegraphai::Internal::Type::HashOf[String]) | nil,
        status: String | nil
      }
    end
  end
end
