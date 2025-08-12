# typed: strong

module Scrapegraphai
  module Models
    class CompletedSmartscraper < Scrapegraphai::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::CompletedSmartscraper,
            Scrapegraphai::Internal::AnyHash
          )
        end

      # Error message (empty on success)
      sig { returns(T.nilable(String)) }
      attr_reader :error

      sig { params(error: String).void }
      attr_writer :error

      # Unique request identifier
      sig { returns(T.nilable(String)) }
      attr_reader :request_id

      sig { params(request_id: String).void }
      attr_writer :request_id

      # Extracted data based on prompt/schema
      sig { returns(T.nilable(T.anything)) }
      attr_accessor :result

      # Processing status
      sig do
        returns(
          T.nilable(Scrapegraphai::CompletedSmartscraper::Status::TaggedSymbol)
        )
      end
      attr_reader :status

      sig do
        params(
          status: Scrapegraphai::CompletedSmartscraper::Status::OrSymbol
        ).void
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
          status: Scrapegraphai::CompletedSmartscraper::Status::OrSymbol,
          user_prompt: String,
          website_url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Error message (empty on success)
        error: nil,
        # Unique request identifier
        request_id: nil,
        # Extracted data based on prompt/schema
        result: nil,
        # Processing status
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
            status: Scrapegraphai::CompletedSmartscraper::Status::TaggedSymbol,
            user_prompt: String,
            website_url: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Processing status
      module Status
        extend Scrapegraphai::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Scrapegraphai::CompletedSmartscraper::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUED =
          T.let(
            :queued,
            Scrapegraphai::CompletedSmartscraper::Status::TaggedSymbol
          )
        PROCESSING =
          T.let(
            :processing,
            Scrapegraphai::CompletedSmartscraper::Status::TaggedSymbol
          )
        COMPLETED =
          T.let(
            :completed,
            Scrapegraphai::CompletedSmartscraper::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Scrapegraphai::CompletedSmartscraper::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
