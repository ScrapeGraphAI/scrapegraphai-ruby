# frozen_string_literal: true

require_relative "../test_helper"

class Scrapegraphai::Test::Resources::FeedbackTest < Scrapegraphai::Test::ResourceTest
  def test_submit_required_params
    skip("Prism tests are disabled")

    response = @scrapegraphai.feedback.submit(rating: 0, request_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Scrapegraphai::Models::FeedbackSubmitResponse
    end

    assert_pattern do
      response => {
        feedback_id: String | nil,
        feedback_timestamp: Time | nil,
        message: String | nil,
        request_id: String | nil
      }
    end
  end
end
