# typed: strong

module Scrapegraphai
  module Resources
    class Credits
      # Retrieve the current credit balance and usage for the authenticated user
      sig do
        params(request_options: Scrapegraphai::RequestOptions::OrHash).returns(
          Scrapegraphai::Models::CreditRetrieveResponse
        )
      end
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: Scrapegraphai::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
