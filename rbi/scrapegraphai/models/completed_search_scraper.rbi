# typed: strong

module Scrapegraphai
  module Models
    class CompletedSearchScraper < Scrapegraphai::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::CompletedSearchScraper,
            Scrapegraphai::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :error

      sig { returns(T.nilable(Integer)) }
      attr_reader :num_results

      sig { params(num_results: Integer).void }
      attr_writer :num_results

      # URLs of sources used
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :reference_urls

      sig { params(reference_urls: T::Array[String]).void }
      attr_writer :reference_urls

      sig { returns(T.nilable(String)) }
      attr_reader :request_id

      sig { params(request_id: String).void }
      attr_writer :request_id

      # Merged results from all scraped websites
      sig { returns(T.nilable(T.anything)) }
      attr_reader :result

      sig { params(result: T.anything).void }
      attr_writer :result

      sig do
        returns(
          T.nilable(Scrapegraphai::CompletedSearchScraper::Status::TaggedSymbol)
        )
      end
      attr_reader :status

      sig do
        params(
          status: Scrapegraphai::CompletedSearchScraper::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig { returns(T.nilable(String)) }
      attr_reader :user_prompt

      sig { params(user_prompt: String).void }
      attr_writer :user_prompt

      sig do
        params(
          error: T.nilable(String),
          num_results: Integer,
          reference_urls: T::Array[String],
          request_id: String,
          result: T.anything,
          status: Scrapegraphai::CompletedSearchScraper::Status::OrSymbol,
          user_prompt: String
        ).returns(T.attached_class)
      end
      def self.new(
        error: nil,
        num_results: nil,
        # URLs of sources used
        reference_urls: nil,
        request_id: nil,
        # Merged results from all scraped websites
        result: nil,
        status: nil,
        user_prompt: nil
      )
      end

      sig do
        override.returns(
          {
            error: T.nilable(String),
            num_results: Integer,
            reference_urls: T::Array[String],
            request_id: String,
            result: T.anything,
            status: Scrapegraphai::CompletedSearchScraper::Status::TaggedSymbol,
            user_prompt: String
          }
        )
      end
      def to_hash
      end

      module Status
        extend Scrapegraphai::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Scrapegraphai::CompletedSearchScraper::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUED =
          T.let(
            :queued,
            Scrapegraphai::CompletedSearchScraper::Status::TaggedSymbol
          )
        PROCESSING =
          T.let(
            :processing,
            Scrapegraphai::CompletedSearchScraper::Status::TaggedSymbol
          )
        COMPLETED =
          T.let(
            :completed,
            Scrapegraphai::CompletedSearchScraper::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Scrapegraphai::CompletedSearchScraper::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
