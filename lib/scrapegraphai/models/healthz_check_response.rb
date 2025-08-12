# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Healthz#check
    class HealthzCheckResponse < Scrapegraphai::Internal::Type::BaseModel
      # @!attribute services
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :services, Scrapegraphai::Internal::Type::HashOf[String]

      # @!attribute status
      #
      #   @return [String, nil]
      optional :status, String

      # @!method initialize(services: nil, status: nil)
      #   @param services [Hash{Symbol=>String}]
      #   @param status [String]
    end
  end
end
