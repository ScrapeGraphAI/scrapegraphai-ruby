# typed: strong

module Scrapegraphai
  module Models
    class FeedbackSubmitParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::FeedbackSubmitParams,
            Scrapegraphai::Internal::AnyHash
          )
        end

      # Rating score
      sig { returns(Integer) }
      attr_accessor :rating

      # Request to provide feedback for
      sig { returns(String) }
      attr_accessor :request_id

      # Optional feedback comments
      sig { returns(T.nilable(String)) }
      attr_accessor :feedback_text

      sig do
        params(
          rating: Integer,
          request_id: String,
          feedback_text: T.nilable(String),
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Rating score
        rating:,
        # Request to provide feedback for
        request_id:,
        # Optional feedback comments
        feedback_text: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            rating: Integer,
            request_id: String,
            feedback_text: T.nilable(String),
            request_options: Scrapegraphai::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
