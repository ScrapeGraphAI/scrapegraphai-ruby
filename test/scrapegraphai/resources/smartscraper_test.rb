# frozen_string_literal: true

require_relative "../test_helper"

class Scrapegraphai::Test::Resources::SmartscraperTest < Scrapegraphai::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @scrapegraphai.smartscraper.create(user_prompt: "Extract the product name, price, and description")

    assert_pattern do
      response => Scrapegraphai::CompletedSmartscraper
    end

    assert_pattern do
      response => {
        error: String | nil,
        request_id: String | nil,
        result: Scrapegraphai::Internal::Type::Unknown | nil,
        status: Scrapegraphai::CompletedSmartscraper::Status | nil,
        user_prompt: String | nil,
        website_url: String | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @scrapegraphai.smartscraper.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Scrapegraphai::Models::SmartscraperRetrieveResponse
    end

    assert_pattern do
      case response
      in Scrapegraphai::CompletedSmartscraper
      in Scrapegraphai::FailedSmartscraper
      end
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @scrapegraphai.smartscraper.list

    assert_pattern do
      response => Scrapegraphai::Models::SmartscraperListResponse
    end

    assert_pattern do
      case response
      in Scrapegraphai::CompletedSmartscraper
      in Scrapegraphai::FailedSmartscraper
      end
    end
  end
end
