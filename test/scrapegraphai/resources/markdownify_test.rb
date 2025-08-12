# frozen_string_literal: true

require_relative "../test_helper"

class Scrapegraphai::Test::Resources::MarkdownifyTest < Scrapegraphai::Test::ResourceTest
  def test_convert_required_params
    skip("Prism tests are disabled")

    response = @scrapegraphai.markdownify.convert(website_url: "https://example.com")

    assert_pattern do
      response => Scrapegraphai::CompletedMarkdownify
    end

    assert_pattern do
      response => {
        error: String | nil,
        request_id: String | nil,
        result: String | nil,
        status: Scrapegraphai::CompletedMarkdownify::Status | nil,
        website_url: String | nil
      }
    end
  end

  def test_retrieve_status
    skip("Prism tests are disabled")

    response = @scrapegraphai.markdownify.retrieve_status("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse
    end

    assert_pattern do
      case response
      in Scrapegraphai::CompletedMarkdownify
      in Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse
      end
    end
  end
end
