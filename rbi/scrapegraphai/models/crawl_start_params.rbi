# typed: strong

module Scrapegraphai
  module Models
    class CrawlStartParams < Scrapegraphai::Internal::Type::BaseModel
      extend Scrapegraphai::Internal::Type::RequestParameters::Converter
      include Scrapegraphai::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Scrapegraphai::CrawlStartParams,
            Scrapegraphai::Internal::AnyHash
          )
        end

      # Starting URL for crawling
      sig { returns(String) }
      attr_accessor :url

      # Maximum crawl depth from starting URL
      sig { returns(T.nilable(Integer)) }
      attr_reader :depth

      sig { params(depth: Integer).void }
      attr_writer :depth

      # Use AI extraction (true) or markdown conversion (false)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :extraction_mode

      sig { params(extraction_mode: T::Boolean).void }
      attr_writer :extraction_mode

      # Maximum number of pages to crawl
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_pages

      sig { params(max_pages: Integer).void }
      attr_writer :max_pages

      # Extraction prompt (required if extraction_mode is true)
      sig { returns(T.nilable(String)) }
      attr_accessor :prompt

      # Enable heavy JavaScript rendering
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :render_heavy_js

      sig { params(render_heavy_js: T::Boolean).void }
      attr_writer :render_heavy_js

      sig { returns(T.nilable(Scrapegraphai::CrawlStartParams::Rules)) }
      attr_reader :rules

      sig { params(rules: Scrapegraphai::CrawlStartParams::Rules::OrHash).void }
      attr_writer :rules

      # Output schema for extraction
      sig { returns(T.nilable(T.anything)) }
      attr_accessor :schema

      # Use sitemap for crawling
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sitemap

      sig { params(sitemap: T::Boolean).void }
      attr_writer :sitemap

      sig do
        params(
          url: String,
          depth: Integer,
          extraction_mode: T::Boolean,
          max_pages: Integer,
          prompt: T.nilable(String),
          render_heavy_js: T::Boolean,
          rules: Scrapegraphai::CrawlStartParams::Rules::OrHash,
          schema: T.nilable(T.anything),
          sitemap: T::Boolean,
          request_options: Scrapegraphai::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Starting URL for crawling
        url:,
        # Maximum crawl depth from starting URL
        depth: nil,
        # Use AI extraction (true) or markdown conversion (false)
        extraction_mode: nil,
        # Maximum number of pages to crawl
        max_pages: nil,
        # Extraction prompt (required if extraction_mode is true)
        prompt: nil,
        # Enable heavy JavaScript rendering
        render_heavy_js: nil,
        rules: nil,
        # Output schema for extraction
        schema: nil,
        # Use sitemap for crawling
        sitemap: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            url: String,
            depth: Integer,
            extraction_mode: T::Boolean,
            max_pages: Integer,
            prompt: T.nilable(String),
            render_heavy_js: T::Boolean,
            rules: Scrapegraphai::CrawlStartParams::Rules,
            schema: T.nilable(T.anything),
            sitemap: T::Boolean,
            request_options: Scrapegraphai::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Rules < Scrapegraphai::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Scrapegraphai::CrawlStartParams::Rules,
              Scrapegraphai::Internal::AnyHash
            )
          end

        # URL patterns to exclude from crawling
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :exclude

        sig { params(exclude: T::Array[String]).void }
        attr_writer :exclude

        # Restrict crawling to same domain
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :same_domain

        sig { params(same_domain: T::Boolean).void }
        attr_writer :same_domain

        sig do
          params(exclude: T::Array[String], same_domain: T::Boolean).returns(
            T.attached_class
          )
        end
        def self.new(
          # URL patterns to exclude from crawling
          exclude: nil,
          # Restrict crawling to same domain
          same_domain: nil
        )
        end

        sig do
          override.returns(
            { exclude: T::Array[String], same_domain: T::Boolean }
          )
        end
        def to_hash
        end
      end
    end
  end
end
