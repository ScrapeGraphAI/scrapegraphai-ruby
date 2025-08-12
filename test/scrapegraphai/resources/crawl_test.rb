# frozen_string_literal: true

require_relative "../test_helper"

class Scrapegraphai::Test::Resources::CrawlTest < Scrapegraphai::Test::ResourceTest
  def test_retrieve_results
    skip("Prism tests are disabled")

    response = @scrapegraphai.crawl.retrieve_results("task_id")

    assert_pattern do
      response => Scrapegraphai::Models::CrawlRetrieveResultsResponse
    end

    assert_pattern do
      response => {
        result: Scrapegraphai::Models::CrawlRetrieveResultsResponse::Result | nil,
        status: Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status | nil,
        task_id: String | nil,
        traceback: String | nil
      }
    end
  end

  def test_start_required_params
    skip("Prism tests are disabled")

    response = @scrapegraphai.crawl.start(url: "https://example.com")

    assert_pattern do
      response => Scrapegraphai::Models::CrawlStartResponse
    end

    assert_pattern do
      response => {
        task_id: String | nil
      }
    end
  end
end
