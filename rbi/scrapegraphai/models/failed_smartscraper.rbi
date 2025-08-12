# typed: strong

module Scrapegraphai
  module Models
    class FailedSmartscraper < Scrapegraphai::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::FailedSmartscraper,
            Scrapegraphai::Internal::AnyHash
          )
        end

      # Error description
      sig { returns(T.nilable(String)) }
      attr_reader :error

      sig { params(error: String).void }
      attr_writer :error

      sig { returns(T.nilable(String)) }
      attr_reader :request_id

      sig { params(request_id: String).void }
      attr_writer :request_id

      sig { returns(T.nilable(T.anything)) }
      attr_accessor :result

      sig do
        returns(
          T.nilable(Scrapegraphai::FailedSmartscraper::Status::TaggedSymbol)
        )
      end
      attr_reader :status

      sig do
        params(status: Scrapegraphai::FailedSmartscraper::Status::OrSymbol).void
      end
      attr_writer :status

      sig { returns(T.nilable(String)) }
      attr_reader :user_prompt

      sig { params(user_prompt: String).void }
      attr_writer :user_prompt

      sig { returns(T.nilable(String)) }
      attr_accessor :website_url

      sig do
        params(
          error: String,
          request_id: String,
          result: T.nilable(T.anything),
          status: Scrapegraphai::FailedSmartscraper::Status::OrSymbol,
          user_prompt: String,
          website_url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Error description
        error: nil,
        request_id: nil,
        result: nil,
        status: nil,
        user_prompt: nil,
        website_url: nil
      )
      end

      sig do
        override.returns(
          {
            error: String,
            request_id: String,
            result: T.nilable(T.anything),
            status: Scrapegraphai::FailedSmartscraper::Status::TaggedSymbol,
            user_prompt: String,
            website_url: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      module Status
        extend Scrapegraphai::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Scrapegraphai::FailedSmartscraper::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FAILED =
          T.let(
            :failed,
            Scrapegraphai::FailedSmartscraper::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Scrapegraphai::FailedSmartscraper::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
