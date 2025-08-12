# frozen_string_literal: true

require_relative "../test_helper"

class Scrapegraphai::Test::Resources::CreditsTest < Scrapegraphai::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @scrapegraphai.credits.retrieve

    assert_pattern do
      response => Scrapegraphai::Models::CreditRetrieveResponse
    end

    assert_pattern do
      response => {
        remaining_credits: Integer | nil,
        total_credits_used: Integer | nil
      }
    end
  end
end
