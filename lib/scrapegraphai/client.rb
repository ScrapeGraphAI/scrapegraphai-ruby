# frozen_string_literal: true

module Scrapegraphai
  class Client < Scrapegraphai::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # rubocop:disable Style/MutableConstant
    # @type [Hash{Symbol=>String}]
    ENVIRONMENTS =
      {production: "https://api.scrapegraphai.com/v1", environment_1: "http://localhost:8001/v1"}
    # rubocop:enable Style/MutableConstant

    # API key for authentication
    # @return [String]
    attr_reader :api_key

    # @return [Scrapegraphai::Resources::Smartscraper]
    attr_reader :smartscraper

    # @return [Scrapegraphai::Resources::Markdownify]
    attr_reader :markdownify

    # @return [Scrapegraphai::Resources::Searchscraper]
    attr_reader :searchscraper

    # @return [Scrapegraphai::Resources::GenerateSchema]
    attr_reader :generate_schema

    # @return [Scrapegraphai::Resources::Crawl]
    attr_reader :crawl

    # @return [Scrapegraphai::Resources::Credits]
    attr_reader :credits

    # @return [Scrapegraphai::Resources::Validate]
    attr_reader :validate

    # @return [Scrapegraphai::Resources::Feedback]
    attr_reader :feedback

    # @return [Scrapegraphai::Resources::Healthz]
    attr_reader :healthz

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      {"sgai-apikey" => @api_key}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] API key for authentication Defaults to `ENV["SCRAPEGRAPHAI_API_KEY"]`
    #
    # @param environment [:production, :environment_1, nil] Specifies the environment to use for the API.
    #
    # Each environment maps to a different base URL:
    #
    # - `production` corresponds to `https://api.scrapegraphai.com/v1`
    # - `environment_1` corresponds to `http://localhost:8001/v1`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["SCRAPEGRAPHAI_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["SCRAPEGRAPHAI_API_KEY"],
      environment: nil,
      base_url: ENV["SCRAPEGRAPHAI_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= Scrapegraphai::Client::ENVIRONMENTS.fetch(environment&.to_sym || :production) do
        message = "environment must be one of #{Scrapegraphai::Client::ENVIRONMENTS.keys}, got #{environment}"
        raise ArgumentError.new(message)
      end

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"SCRAPEGRAPHAI_API_KEY\"")
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @smartscraper = Scrapegraphai::Resources::Smartscraper.new(client: self)
      @markdownify = Scrapegraphai::Resources::Markdownify.new(client: self)
      @searchscraper = Scrapegraphai::Resources::Searchscraper.new(client: self)
      @generate_schema = Scrapegraphai::Resources::GenerateSchema.new(client: self)
      @crawl = Scrapegraphai::Resources::Crawl.new(client: self)
      @credits = Scrapegraphai::Resources::Credits.new(client: self)
      @validate = Scrapegraphai::Resources::Validate.new(client: self)
      @feedback = Scrapegraphai::Resources::Feedback.new(client: self)
      @healthz = Scrapegraphai::Resources::Healthz.new(client: self)
    end
  end
end
