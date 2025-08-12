# frozen_string_literal: true

require_relative "../test_helper"

class Scrapegraphai::Test::Resources::SearchscraperTest < Scrapegraphai::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @scrapegraphai.searchscraper.create(
        user_prompt: "Find the latest AI news and extract headlines and summaries"
      )

    assert_pattern do
      response => Scrapegraphai::CompletedSearchScraper
    end

    assert_pattern do
      response => {
        error: String | nil,
        num_results: Integer | nil,
        reference_urls: ^(Scrapegraphai::Internal::Type::ArrayOf[String]) | nil,
        request_id: String | nil,
        result: Scrapegraphai::Internal::Type::Unknown | nil,
        status: Scrapegraphai::CompletedSearchScraper::Status | nil,
        user_prompt: String | nil
      }
    end
  end

  def test_retrieve_status
    skip("Prism tests are disabled")

    response = @scrapegraphai.searchscraper.retrieve_status("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Scrapegraphai::Models::SearchscraperRetrieveStatusResponse
    end

    assert_pattern do
      case response
      in Scrapegraphai::CompletedSearchScraper
      in Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse
      end
    end
  end
end
