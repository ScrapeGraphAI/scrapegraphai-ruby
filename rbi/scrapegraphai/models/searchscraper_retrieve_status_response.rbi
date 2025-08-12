# typed: strong

module Scrapegraphai
  module Models
    module SearchscraperRetrieveStatusResponse
      extend Scrapegraphai::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Scrapegraphai::CompletedSearchScraper,
            Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse
          )
        end

      class FailedSearchScraperResponse < Scrapegraphai::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse,
              Scrapegraphai::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :error

        sig { params(error: String).void }
        attr_writer :error

        sig { returns(T.nilable(Integer)) }
        attr_reader :num_results

        sig { params(num_results: Integer).void }
        attr_writer :num_results

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :reference_urls

        sig { params(reference_urls: T::Array[String]).void }
        attr_writer :reference_urls

        sig { returns(T.nilable(String)) }
        attr_reader :request_id

        sig { params(request_id: String).void }
        attr_writer :request_id

        sig { returns(T.nilable(T.anything)) }
        attr_accessor :result

        sig do
          returns(
            T.nilable(
              Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse::Status::OrSymbol
          ).void
        end
        attr_writer :status

        sig { returns(T.nilable(String)) }
        attr_reader :user_prompt

        sig { params(user_prompt: String).void }
        attr_writer :user_prompt

        sig do
          params(
            error: String,
            num_results: Integer,
            reference_urls: T::Array[String],
            request_id: String,
            result: T.nilable(T.anything),
            status:
              Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse::Status::OrSymbol,
            user_prompt: String
          ).returns(T.attached_class)
        end
        def self.new(
          error: nil,
          num_results: nil,
          reference_urls: nil,
          request_id: nil,
          result: nil,
          status: nil,
          user_prompt: nil
        )
        end

        sig do
          override.returns(
            {
              error: String,
              num_results: Integer,
              reference_urls: T::Array[String],
              request_id: String,
              result: T.nilable(T.anything),
              status:
                Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse::Status::TaggedSymbol,
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
              T.all(
                Symbol,
                Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAILED =
            T.let(
              :failed,
              Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::FailedSearchScraperResponse::Status::TaggedSymbol
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
            Scrapegraphai::Models::SearchscraperRetrieveStatusResponse::Variants
          ]
        )
      end
      def self.variants
      end
    end
  end
end
