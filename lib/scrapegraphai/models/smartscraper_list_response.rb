# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Smartscraper#list
    module SmartscraperListResponse
      extend Scrapegraphai::Internal::Type::Union

      variant -> { Scrapegraphai::CompletedSmartscraper }

      variant -> { Scrapegraphai::FailedSmartscraper }

      # @!method self.variants
      #   @return [Array(Scrapegraphai::Models::CompletedSmartscraper, Scrapegraphai::Models::FailedSmartscraper)]
    end
  end
end
