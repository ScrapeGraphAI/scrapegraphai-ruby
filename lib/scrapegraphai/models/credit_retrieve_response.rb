# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Credits#retrieve
    class CreditRetrieveResponse < Scrapegraphai::Internal::Type::BaseModel
      # @!attribute remaining_credits
      #   Number of credits remaining
      #
      #   @return [Integer, nil]
      optional :remaining_credits, Integer

      # @!attribute total_credits_used
      #   Total credits consumed
      #
      #   @return [Integer, nil]
      optional :total_credits_used, Integer

      # @!method initialize(remaining_credits: nil, total_credits_used: nil)
      #   @param remaining_credits [Integer] Number of credits remaining
      #
      #   @param total_credits_used [Integer] Total credits consumed
    end
  end
end
