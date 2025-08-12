# typed: strong

module Scrapegraphai
  module Models
    module MarkdownifyRetrieveStatusResponse
      extend Scrapegraphai::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Scrapegraphai::CompletedMarkdownify,
            Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse
          )
        end

      class FailedMarkdownifyResponse < Scrapegraphai::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse,
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

        sig { returns(T.nilable(String)) }
        attr_accessor :result

        sig do
          returns(
            T.nilable(
              Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse::Status::OrSymbol
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
            status:
              Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse::Status::OrSymbol,
            website_url: String
          ).returns(T.attached_class)
        end
        def self.new(
          error: nil,
          request_id: nil,
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
              status:
                Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse::Status::TaggedSymbol,
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
              T.all(
                Symbol,
                Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAILED =
            T.let(
              :failed,
              Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::FailedMarkdownifyResponse::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig do
        override.returns(
          T::Array[
            Scrapegraphai::Models::MarkdownifyRetrieveStatusResponse::Variants
          ]
        )
      end
      def self.variants
      end
    end
  end
end
