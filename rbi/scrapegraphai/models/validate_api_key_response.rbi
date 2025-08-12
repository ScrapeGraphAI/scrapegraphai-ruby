# typed: strong

module Scrapegraphai
  module Models
    class ValidateAPIKeyResponse < Scrapegraphai::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::Models::ValidateAPIKeyResponse,
            Scrapegraphai::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      sig { params(email: String).returns(T.attached_class) }
      def self.new(email: nil)
      end

      sig { override.returns({ email: String }) }
      def to_hash
      end
    end
  end
end
