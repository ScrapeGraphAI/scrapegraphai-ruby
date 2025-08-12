# typed: strong

module Scrapegraphai
  module Models
    module SmartscraperListResponse
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
          T::Array[Scrapegraphai::Models::SmartscraperListResponse::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
