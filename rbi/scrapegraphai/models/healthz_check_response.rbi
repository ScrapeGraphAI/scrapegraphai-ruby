# typed: strong

module Scrapegraphai
  module Models
    class HealthzCheckResponse < Scrapegraphai::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::Models::HealthzCheckResponse,
            Scrapegraphai::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :services

      sig { params(services: T::Hash[Symbol, String]).void }
      attr_writer :services

      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      sig do
        params(services: T::Hash[Symbol, String], status: String).returns(
          T.attached_class
        )
      end
      def self.new(services: nil, status: nil)
      end

      sig do
        override.returns({ services: T::Hash[Symbol, String], status: String })
      end
      def to_hash
      end
    end
  end
end
