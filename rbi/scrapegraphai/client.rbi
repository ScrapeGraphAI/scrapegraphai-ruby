# typed: strong

module Scrapegraphai
  class Client < Scrapegraphai::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    ENVIRONMENTS =
      T.let(
        {
          production: "https://api.scrapegraphai.com/v1",
          environment_1: "http://localhost:8001/v1"
        },
        T::Hash[Symbol, String]
      )

    # API key for authentication
    sig { returns(String) }
    attr_reader :api_key

    sig { returns(Scrapegraphai::Resources::Smartscraper) }
    attr_reader :smartscraper

    sig { returns(Scrapegraphai::Resources::Markdownify) }
    attr_reader :markdownify

    sig { returns(Scrapegraphai::Resources::Searchscraper) }
    attr_reader :searchscraper

    sig { returns(Scrapegraphai::Resources::GenerateSchema) }
    attr_reader :generate_schema

    sig { returns(Scrapegraphai::Resources::Crawl) }
    attr_reader :crawl

    sig { returns(Scrapegraphai::Resources::Credits) }
    attr_reader :credits

    sig { returns(Scrapegraphai::Resources::Validate) }
    attr_reader :validate

    sig { returns(Scrapegraphai::Resources::Feedback) }
    attr_reader :feedback

    sig { returns(Scrapegraphai::Resources::Healthz) }
    attr_reader :healthz

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        environment: T.nilable(T.any(Symbol, String)),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # API key for authentication Defaults to `ENV["SCRAPEGRAPHAI_API_KEY"]`
      api_key: ENV["SCRAPEGRAPHAI_API_KEY"],
      # Specifies the environment to use for the API.
      #
      # Each environment maps to a different base URL:
      #
      # - `production` corresponds to `https://api.scrapegraphai.com/v1`
      # - `environment_1` corresponds to `http://localhost:8001/v1`
      environment: nil,
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["SCRAPEGRAPHAI_BASE_URL"]`
      base_url: ENV["SCRAPEGRAPHAI_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Scrapegraphai::Client::DEFAULT_MAX_RETRIES,
      timeout: Scrapegraphai::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Scrapegraphai::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Scrapegraphai::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
