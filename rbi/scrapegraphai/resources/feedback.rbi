# typed: strong

module Scrapegraphai
  module Resources
    class Feedback
      # Submit feedback for a specific request
      sig do
        params(
          rating: Integer,
          request_id: String,
          feedback_text: T.nilable(String),
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(Scrapegraphai::Models::FeedbackSubmitResponse)
      end
      def submit(
        # Rating score
        rating:,
        # Request to provide feedback for
        request_id:,
        # Optional feedback comments
        feedback_text: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Scrapegraphai::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
