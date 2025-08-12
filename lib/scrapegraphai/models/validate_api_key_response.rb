# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Validate#api_key
    class ValidateAPIKeyResponse < Scrapegraphai::Internal::Type::BaseModel
      # @!attribute email
      #
      #   @return [String, nil]
      optional :email, String

      # @!method initialize(email: nil)
      #   @param email [String]
    end
  end
end
