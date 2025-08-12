#!/usr/bin/env ruby
# frozen_string_literal: true

# Error Handling Example
# 
# This example demonstrates comprehensive error handling for the ScrapeGraphAI API:
# - Different types of API errors and how to handle them
# - Retry strategies and exponential backoff
# - Timeout handling
# - Network connection errors
# - Best practices for production applications

require "bundler/setup"
require "scrapegraphai"

puts "🚀 Error Handling Example"
puts "=" * 50

# Example 1: Basic error handling patterns
puts "\n🛡️ Basic error handling patterns..."

def demonstrate_basic_error_handling
  client = Scrapegraphai::Client.new(
    api_key: ENV["SCRAPEGRAPHAI_API_KEY"]
  )
  
  begin
    # This might fail for various reasons
    result = client.smartscraper.create(
      user_prompt: "Extract product information",
      website_url: "https://invalid-url-that-does-not-exist.com"
    )
    
    puts "✅ Success: #{result.request_id}"
    
  rescue Scrapegraphai::Errors::AuthenticationError => e
    puts "🔑 Authentication Error:"
    puts "  - Check your API key"
    puts "  - Ensure it's set in ENV['SCRAPEGRAPHAI_API_KEY']"
    puts "  - Error: #{e.message}"
    
  rescue Scrapegraphai::Errors::RateLimitError => e
    puts "⏳ Rate Limit Error:"
    puts "  - Too many requests in a short time"
    puts "  - Wait before making more requests"
    puts "  - Consider implementing exponential backoff"
    puts "  - Error: #{e.message}"
    
  rescue Scrapegraphai::Errors::BadRequestError => e
    puts "❌ Bad Request Error:"
    puts "  - Check your request parameters"
    puts "  - Ensure required fields are provided"
    puts "  - Validate URL format and accessibility"
    puts "  - Error: #{e.message}"
    
  rescue Scrapegraphai::Errors::NotFoundError => e
    puts "🔍 Not Found Error:"
    puts "  - The requested resource doesn't exist"
    puts "  - Check URL or request ID"
    puts "  - Error: #{e.message}"
    
  rescue Scrapegraphai::Errors::UnprocessableEntityError => e
    puts "📝 Unprocessable Entity Error:"
    puts "  - Request format is valid but content is invalid"
    puts "  - Check data types and value constraints"
    puts "  - Error: #{e.message}"
    
  rescue Scrapegraphai::Errors::InternalServerError => e
    puts "🔧 Internal Server Error:"
    puts "  - Server-side issue"
    puts "  - Retry after some time"
    puts "  - Contact support if persistent"
    puts "  - Error: #{e.message}"
    
  rescue Scrapegraphai::Errors::APIConnectionError => e
    puts "🌐 Connection Error:"
    puts "  - Network connectivity issue"
    puts "  - Check internet connection"
    puts "  - Retry with exponential backoff"
    puts "  - Error: #{e.message}"
    puts "  - Underlying cause: #{e.cause}" if e.cause
    
  rescue Scrapegraphai::Errors::APITimeoutError => e
    puts "⏰ Timeout Error:"
    puts "  - Request took too long"
    puts "  - Consider increasing timeout"
    puts "  - Try with smaller requests"
    puts "  - Error: #{e.message}"
    
  rescue Scrapegraphai::Errors::APIStatusError => e
    puts "🚨 Generic API Status Error:"
    puts "  - HTTP Status: #{e.status}"
    puts "  - Error: #{e.message}"
    
  rescue Scrapegraphai::Errors::APIError => e
    puts "⚠️ Generic API Error:"
    puts "  - Something went wrong with the API"
    puts "  - Error: #{e.message}"
    
  rescue => e
    puts "💥 Unexpected Error:"
    puts "  - #{e.class}: #{e.message}"
    puts "  - Backtrace: #{e.backtrace.first(3).join("\n    ")}"
  end
end

demonstrate_basic_error_handling

# Example 2: Retry strategy with exponential backoff
puts "\n🔄 Implementing retry strategy with exponential backoff..."

def smart_retry(max_retries: 3, base_delay: 1.0)
  retries = 0
  
  begin
    yield
    
  rescue Scrapegraphai::Errors::RateLimitError,
         Scrapegraphai::Errors::InternalServerError,
         Scrapegraphai::Errors::APIConnectionError,
         Scrapegraphai::Errors::APITimeoutError => e
    
    retries += 1
    
    if retries <= max_retries
      delay = base_delay * (2 ** (retries - 1)) # Exponential backoff
      jitter = rand(0.1..0.3) # Add some jitter
      total_delay = delay + jitter
      
      puts "  Retry #{retries}/#{max_retries} after #{total_delay.round(2)}s (#{e.class.name})"
      sleep(total_delay)
      retry
    else
      puts "  Max retries (#{max_retries}) exceeded"
      raise
    end
    
  rescue => e
    # Don't retry for other types of errors
    raise
  end
end

def demonstrate_retry_strategy
  client = Scrapegraphai::Client.new(
    api_key: ENV["SCRAPEGRAPHAI_API_KEY"],
    timeout: 5  # Short timeout to demonstrate timeout handling
  )
  
  smart_retry(max_retries: 3, base_delay: 1.0) do
    result = client.smartscraper.create(
      user_prompt: "Extract main content",
      website_url: "https://httpbin.org/delay/3"  # This will likely timeout
    )
    puts "✅ Success with retry: #{result.request_id}"
  end
  
rescue => e
  puts "❌ Failed after retries: #{e.message}"
end

demonstrate_retry_strategy

# Example 3: Timeout configuration and handling
puts "\n⏰ Timeout configuration and handling..."

def demonstrate_timeout_handling
  # Client with very short timeout
  short_timeout_client = Scrapegraphai::Client.new(
    api_key: ENV["SCRAPEGRAPHAI_API_KEY"],
    timeout: 2  # 2 seconds timeout
  )
  
  # Client with longer timeout
  long_timeout_client = Scrapegraphai::Client.new(
    api_key: ENV["SCRAPEGRAPHAI_API_KEY"],
    timeout: 30  # 30 seconds timeout
  )
  
  puts "Testing with short timeout (2s)..."
  begin
    result = short_timeout_client.smartscraper.create(
      user_prompt: "Extract content",
      website_url: "https://httpbin.org/delay/5"
    )
    puts "✅ Unexpected success: #{result.request_id}"
  rescue Scrapegraphai::Errors::APITimeoutError => e
    puts "⏰ Expected timeout with short client: #{e.message}"
  end
  
  puts "\nTesting with longer timeout (30s)..."
  begin
    result = long_timeout_client.smartscraper.create(
      user_prompt: "Extract basic content",
      website_url: "https://httpbin.org/delay/1"
    )
    puts "✅ Success with longer timeout: #{result.request_id}"
  rescue Scrapegraphai::Errors::APITimeoutError => e
    puts "⏰ Still timed out: #{e.message}"
  rescue => e
    puts "❌ Other error: #{e.message}"
  end
  
  # Per-request timeout override
  puts "\nTesting per-request timeout override..."
  begin
    result = short_timeout_client.smartscraper.create(
      user_prompt: "Extract content",
      website_url: "https://quotes.toscrape.com/",
      request_options: { timeout: 15 }  # Override client timeout
    )
    puts "✅ Success with per-request timeout: #{result.request_id}"
  rescue => e
    puts "❌ Error: #{e.message}"
  end
end

demonstrate_timeout_handling

# Example 4: Validation and input sanitization
puts "\n🧹 Input validation and sanitization..."

def demonstrate_input_validation
  client = Scrapegraphai::Client.new(
    api_key: ENV["SCRAPEGRAPHAI_API_KEY"]
  )
  
  # Test cases with invalid inputs
  test_cases = [
    {
      name: "Empty prompt",
      params: { user_prompt: "", website_url: "https://example.com" }
    },
    {
      name: "Invalid URL",
      params: { user_prompt: "Extract content", website_url: "not-a-valid-url" }
    },
    {
      name: "Missing required parameter",
      params: { website_url: "https://example.com" }  # Missing user_prompt
    },
    {
      name: "Negative scroll count",
      params: { 
        user_prompt: "Extract content", 
        website_url: "https://example.com",
        number_of_scrolls: -5 
      }
    }
  ]
  
  test_cases.each do |test_case|
    puts "\nTesting: #{test_case[:name]}"
    begin
      result = client.smartscraper.create(**test_case[:params])
      puts "  ✅ Unexpected success: #{result.request_id}"
    rescue Scrapegraphai::Errors::BadRequestError => e
      puts "  ❌ Expected validation error: #{e.message}"
    rescue Scrapegraphai::Errors::UnprocessableEntityError => e
      puts "  ❌ Expected validation error: #{e.message}"
    rescue => e
      puts "  ⚠️ Unexpected error type: #{e.class} - #{e.message}"
    end
  end
end

demonstrate_input_validation

# Example 5: Production-ready error handling wrapper
puts "\n🏭 Production-ready error handling wrapper..."

class ScrapingService
  def initialize(api_key:, max_retries: 3, timeout: 30)
    @client = Scrapegraphai::Client.new(
      api_key: api_key,
      timeout: timeout,
      max_retries: max_retries
    )
    @logger = Logger.new($stdout)
  end
  
  def scrape_with_error_handling(params)
    validate_params(params)
    
    result = perform_scraping(params)
    
    {
      success: true,
      data: result,
      error: nil
    }
    
  rescue Scrapegraphai::Errors::AuthenticationError => e
    handle_auth_error(e)
    
  rescue Scrapegraphai::Errors::RateLimitError => e
    handle_rate_limit_error(e)
    
  rescue Scrapegraphai::Errors::BadRequestError,
         Scrapegraphai::Errors::UnprocessableEntityError => e
    handle_client_error(e)
    
  rescue Scrapegraphai::Errors::APIError => e
    handle_api_error(e)
    
  rescue => e
    handle_unexpected_error(e)
  end
  
  private
  
  def validate_params(params)
    raise ArgumentError, "user_prompt is required" if params[:user_prompt].nil? || params[:user_prompt].empty?
    raise ArgumentError, "website_url or website_html is required" unless params[:website_url] || params[:website_html]
    
    if params[:website_url] && !valid_url?(params[:website_url])
      raise ArgumentError, "Invalid URL format"
    end
  end
  
  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
  rescue URI::InvalidURIError
    false
  end
  
  def perform_scraping(params)
    @client.smartscraper.create(**params)
  end
  
  def handle_auth_error(error)
    @logger.error("Authentication failed: #{error.message}")
    {
      success: false,
      data: nil,
      error: {
        type: "authentication_error",
        message: "Invalid API key or authentication failed",
        retry: false
      }
    }
  end
  
  def handle_rate_limit_error(error)
    @logger.warn("Rate limit exceeded: #{error.message}")
    {
      success: false,
      data: nil,
      error: {
        type: "rate_limit_error",
        message: "Too many requests, please try again later",
        retry: true,
        retry_after: 60  # seconds
      }
    }
  end
  
  def handle_client_error(error)
    @logger.error("Client error: #{error.message}")
    {
      success: false,
      data: nil,
      error: {
        type: "client_error",
        message: "Invalid request parameters: #{error.message}",
        retry: false
      }
    }
  end
  
  def handle_api_error(error)
    @logger.error("API error: #{error.class} - #{error.message}")
    {
      success: false,
      data: nil,
      error: {
        type: "api_error",
        message: "Service temporarily unavailable",
        retry: true,
        retry_after: 30
      }
    }
  end
  
  def handle_unexpected_error(error)
    @logger.error("Unexpected error: #{error.class} - #{error.message}")
    @logger.error(error.backtrace.join("\n"))
    {
      success: false,
      data: nil,
      error: {
        type: "unexpected_error",
        message: "An unexpected error occurred",
        retry: false
      }
    }
  end
end

# Demonstrate the production-ready service
if ENV["SCRAPEGRAPHAI_API_KEY"]
  puts "\nTesting production-ready service..."
  
  service = ScrapingService.new(
    api_key: ENV["SCRAPEGRAPHAI_API_KEY"],
    max_retries: 2,
    timeout: 15
  )
  
  # Test successful case
  result = service.scrape_with_error_handling(
    user_prompt: "Extract main heading and description",
    website_url: "https://quotes.toscrape.com/"
  )
  
  puts "Service Result:"
  puts JSON.pretty_generate(result)
  
  # Test error case
  error_result = service.scrape_with_error_handling(
    user_prompt: "",  # Invalid empty prompt
    website_url: "https://example.com"
  )
  
  puts "\nService Error Result:"
  puts JSON.pretty_generate(error_result)
else
  puts "Skipping production service test (no API key)"
end

puts "\n✅ Error handling examples completed!"
puts "\n💡 Key takeaways:"
puts "  - Always handle specific error types appropriately"
puts "  - Implement retry logic for transient errors"
puts "  - Use timeouts to prevent hanging requests"
puts "  - Validate inputs before making API calls"
puts "  - Log errors for debugging and monitoring"
puts "  - Provide meaningful error messages to users"
