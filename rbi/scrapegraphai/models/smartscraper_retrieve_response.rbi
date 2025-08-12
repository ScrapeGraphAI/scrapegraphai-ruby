# typed: strong

module Scrapegraphai
  module Models
    module SmartscraperRetrieveResponse
      extend Scrapegraphai::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Scrapegraphai::CompletedSmartscraper,
            Scrapegraphai::FailedSmartscraper
          )
        end

      sig do
        override.returns(
          T::Array[
            Scrapegraphai::Models::SmartscraperRetrieveResponse::Variants
          ]
        )
      end
      def self.variants
      end
    end
  end
end
