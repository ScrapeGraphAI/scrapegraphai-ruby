# typed: strong

module Scrapegraphai
  module Models
    class CompletedMarkdownify < Scrapegraphai::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::CompletedMarkdownify,
            Scrapegraphai::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :error

      sig { params(error: String).void }
      attr_writer :error

      sig { returns(T.nilable(String)) }
      attr_reader :request_id

      sig { params(request_id: String).void }
      attr_writer :request_id

      # Markdown content
      sig { returns(T.nilable(String)) }
      attr_accessor :result

      sig do
        returns(
          T.nilable(Scrapegraphai::CompletedMarkdownify::Status::TaggedSymbol)
        )
      end
      attr_reader :status

      sig do
        params(
          status: Scrapegraphai::CompletedMarkdownify::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig { returns(T.nilable(String)) }
      attr_reader :website_url

      sig { params(website_url: String).void }
      attr_writer :website_url

      sig do
        params(
          error: String,
          request_id: String,
          result: T.nilable(String),
          status: Scrapegraphai::CompletedMarkdownify::Status::OrSymbol,
          website_url: String
        ).returns(T.attached_class)
      end
      def self.new(
        error: nil,
        request_id: nil,
        # Markdown content
        result: nil,
        status: nil,
        website_url: nil
      )
      end

      sig do
        override.returns(
          {
            error: String,
            request_id: String,
            result: T.nilable(String),
            status: Scrapegraphai::CompletedMarkdownify::Status::TaggedSymbol,
            website_url: String
          }
        )
      end
      def to_hash
      end

      module Status
        extend Scrapegraphai::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Scrapegraphai::CompletedMarkdownify::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUED =
          T.let(
            :queued,
            Scrapegraphai::CompletedMarkdownify::Status::TaggedSymbol
          )
        PROCESSING =
          T.let(
            :processing,
            Scrapegraphai::CompletedMarkdownify::Status::TaggedSymbol
          )
        COMPLETED =
          T.let(
            :completed,
            Scrapegraphai::CompletedMarkdownify::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Scrapegraphai::CompletedMarkdownify::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
