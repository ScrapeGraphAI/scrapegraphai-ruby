# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::Crawl#start
    class CrawlStartResponse < Scrapegraphai::Internal::Type::BaseModel
      # @!attribute task_id
      #   Celery task identifier
      #
      #   @return [String, nil]
      optional :task_id, String

      # @!method initialize(task_id: nil)
      #   @param task_id [String] Celery task identifier
    end
  end
end
