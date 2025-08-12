# typed: strong

module Scrapegraphai
  module Models
    class FeedbackSubmitResponse < Scrapegraphai::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::Models::FeedbackSubmitResponse,
            Scrapegraphai::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :feedback_id

      sig { params(feedback_id: String).void }
      attr_writer :feedback_id

      sig { returns(T.nilable(Time)) }
      attr_reader :feedback_timestamp

      sig { params(feedback_timestamp: Time).void }
      attr_writer :feedback_timestamp

      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      sig { returns(T.nilable(String)) }
      attr_reader :request_id

      sig { params(request_id: String).void }
      attr_writer :request_id

      sig do
        params(
          feedback_id: String,
          feedback_timestamp: Time,
          message: String,
          request_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        feedback_id: nil,
        feedback_timestamp: nil,
        message: nil,
        request_id: nil
      )
      end

      sig do
        override.returns(
          {
            feedback_id: String,
            feedback_timestamp: Time,
            message: String,
            request_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
