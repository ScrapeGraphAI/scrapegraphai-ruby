# typed: strong

module Scrapegraphai
  module Models
    class SearchscraperRetrieveStatusParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::SearchscraperRetrieveStatusParams,
            Scrapegraphai::Internal::AnyHash
          )
        end

      sig do
        params(request_options: Scrapegraphai::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig do
        override.returns({ request_options: Scrapegraphai::RequestOptions })
      end
      def to_hash
      end
    end
  end
end
