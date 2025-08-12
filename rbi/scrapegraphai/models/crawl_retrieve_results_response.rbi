# typed: strong

module Scrapegraphai
  module Models
    class CrawlRetrieveResultsResponse < Scrapegraphai::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::Models::CrawlRetrieveResultsResponse,
            Scrapegraphai::Internal::AnyHash
          )
        end

      # Successful crawl results
      sig do
        returns(
          T.nilable(
            Scrapegraphai::Models::CrawlRetrieveResultsResponse::Result::Variants
          )
        )
      end
      attr_reader :result

      sig do
        params(
          result:
            Scrapegraphai::Models::CrawlRetrieveResultsResponse::Result::Variants
        ).void
      end
      attr_writer :result

      sig do
        returns(
          T.nilable(
            Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status::TaggedSymbol
          )
        )
      end
      attr_reader :status

      sig do
        params(
          status:
            Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig { returns(T.nilable(String)) }
      attr_reader :task_id

      sig { params(task_id: String).void }
      attr_writer :task_id

      # Error traceback for failed tasks
      sig { returns(T.nilable(String)) }
      attr_accessor :traceback

      sig do
        params(
          result:
            Scrapegraphai::Models::CrawlRetrieveResultsResponse::Result::Variants,
          status:
            Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status::OrSymbol,
          task_id: String,
          traceback: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Successful crawl results
        result: nil,
        status: nil,
        task_id: nil,
        # Error traceback for failed tasks
        traceback: nil
      )
      end

      sig do
        override.returns(
          {
            result:
              Scrapegraphai::Models::CrawlRetrieveResultsResponse::Result::Variants,
            status:
              Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status::TaggedSymbol,
            task_id: String,
            traceback: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Successful crawl results
      module Result
        extend Scrapegraphai::Internal::Type::Union

        Variants = T.type_alias { T.any(T.anything, String) }

        sig do
          override.returns(
            T::Array[
              Scrapegraphai::Models::CrawlRetrieveResultsResponse::Result::Variants
            ]
          )
        end
        def self.variants
        end
      end

      module Status
        extend Scrapegraphai::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(
            :PENDING,
            Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status::TaggedSymbol
          )
        STARTED =
          T.let(
            :STARTED,
            Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status::TaggedSymbol
          )
        SUCCESS =
          T.let(
            :SUCCESS,
            Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status::TaggedSymbol
          )
        FAILURE =
          T.let(
            :FAILURE,
            Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status::TaggedSymbol
          )
        RETRY =
          T.let(
            :RETRY,
            Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status::TaggedSymbol
          )
        REVOKED =
          T.let(
            :REVOKED,
            Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Scrapegraphai::Models::CrawlRetrieveResultsResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
