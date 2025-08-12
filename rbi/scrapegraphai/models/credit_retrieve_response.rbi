# typed: strong

module Scrapegraphai
  module Models
    class CreditRetrieveResponse < Scrapegraphai::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::Models::CreditRetrieveResponse,
            Scrapegraphai::Internal::AnyHash
          )
        end

      # Number of credits remaining
      sig { returns(T.nilable(Integer)) }
      attr_reader :remaining_credits

      sig { params(remaining_credits: Integer).void }
      attr_writer :remaining_credits

      # Total credits consumed
      sig { returns(T.nilable(Integer)) }
      attr_reader :total_credits_used

      sig { params(total_credits_used: Integer).void }
      attr_writer :total_credits_used

      sig do
        params(remaining_credits: Integer, total_credits_used: Integer).returns(
          T.attached_class
        )
      end
      def self.new(
        # Number of credits remaining
        remaining_credits: nil,
        # Total credits consumed
        total_credits_used: nil
      )
      end

      sig do
        override.returns(
          { remaining_credits: Integer, total_credits_used: Integer }
        )
      end
      def to_hash
      end
    end
  end
end
