# typed: strong

module Scrapegraphai
  module Models
    class CrawlStartResponse < Scrapegraphai::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::Models::CrawlStartResponse,
            Scrapegraphai::Internal::AnyHash
          )
        end

      # Celery task identifier
      sig { returns(T.nilable(String)) }
      attr_reader :task_id

      sig { params(task_id: String).void }
      attr_writer :task_id

      sig { params(task_id: String).returns(T.attached_class) }
      def self.new(
        # Celery task identifier
        task_id: nil
      )
      end

      sig { override.returns({ task_id: String }) }
      def to_hash
      end
    end
  end
end
