# frozen_string_literal: true

module Scrapegraphai
  module Models
    # @see Scrapegraphai::Resources::GenerateSchema#retrieve
    class GenerateSchemaRetrieveParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Scrapegraphai::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
