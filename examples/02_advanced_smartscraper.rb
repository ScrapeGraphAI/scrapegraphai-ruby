#!/usr/bin/env ruby
# frozen_string_literal: true

# Advanced SmartScraper Example
# 
# This example demonstrates advanced features of SmartScraper including:
# - Custom JSON schema for structured output
# - Pagination handling
# - Infinite scrolling
# - Custom headers and cookies
# - Heavy JavaScript rendering
# - Website interaction steps

require "bundler/setup"
require "scrapegraphai"

# Initialize the client
client = Scrapegraphai::Client.new(
  api_key: ENV["SCRAPEGRAPHAI_API_KEY"]
)

puts "🚀 Advanced SmartScraper Example"
puts "=" * 50

begin
  # Example 1: Using custom JSON schema for structured output
  puts "\n📋 Using custom JSON schema..."
  
  custom_schema = {
    type: "object",
    properties: {
      products: {
        type: "array",
        items: {
          type: "object",
          properties: {
            name: { type: "string" },
            price: { type: "string" },
            availability: { type: "string" },
            rating: { type: "number" },
            description: { type: "string" }
          },
          required: ["name", "price"]
        }
      },
      total_products: { type: "integer" },
      page_info: {
        type: "object",
        properties: {
          current_page: { type: "integer" },
          has_next_page: { type: "boolean" }
        }
      }
    }
  }
  
  result = client.smartscraper.create(
    user_prompt: "Extract all products with their details",
    website_url: "https://books.toscrape.com/",
    output_schema: custom_schema
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Structured Data:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 2: Handling pagination
  puts "\n📄 Handling pagination..."
  
  result = client.smartscraper.create(
    user_prompt: "Extract all book titles and prices from multiple pages",
    website_url: "https://books.toscrape.com/",
    total_pages: 3  # Process first 3 pages
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Paginated Data:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 3: Using custom headers and cookies
  puts "\n🍪 Using custom headers and cookies..."
  
  custom_headers = {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36",
    "Accept-Language": "en-US,en;q=0.9"
  }
  
  custom_cookies = {
    "session_id": "abc123",
    "preferences": "theme=dark"
  }
  
  result = client.smartscraper.create(
    user_prompt: "Extract main content and any personalization elements",
    website_url: "https://httpbin.org/headers",
    headers: custom_headers,
    cookies: custom_cookies
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Data with Custom Headers/Cookies:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 4: Infinite scrolling
  puts "\n🔄 Handling infinite scroll..."
  
  result = client.smartscraper.create(
    user_prompt: "Extract all visible items after scrolling",
    website_url: "https://quotes.toscrape.com/scroll",
    number_of_scrolls: 3  # Perform 3 scroll operations
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Scrolled Data:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 5: Heavy JavaScript rendering
  puts "\n⚡ Heavy JavaScript rendering..."
  
  result = client.smartscraper.create(
    user_prompt: "Extract dynamically loaded content",
    website_url: "https://quotes.toscrape.com/js/",
    render_heavy_js: true  # Enable heavy JS rendering
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "JS-Rendered Data:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 6: Website interaction steps
  puts "\n🖱️ Website interactions..."
  
  interaction_steps = [
    "click on button with text 'Load More'",
    "wait for 2 seconds",
    "click on tab 'Popular Quotes'"
  ]
  
  result = client.smartscraper.create(
    user_prompt: "Extract content after performing interactions",
    website_url: "https://quotes.toscrape.com/",
    steps: interaction_steps
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Interactive Data:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 7: Processing HTML content directly
  puts "\n📄 Processing HTML content directly..."
  
  html_content = <<~HTML
    <!DOCTYPE html>
    <html>
    <head><title>Sample Page</title></head>
    <body>
      <div class="product">
        <h1>Sample Product</h1>
        <p class="price">$29.99</p>
        <p class="description">This is a sample product description.</p>
        <span class="stock">In Stock</span>
      </div>
      <div class="product">
        <h1>Another Product</h1>
        <p class="price">$19.99</p>
        <p class="description">Another sample product.</p>
        <span class="stock">Out of Stock</span>
      </div>
    </body>
    </html>
  HTML
  
  result = client.smartscraper.create(
    user_prompt: "Extract all products with their name, price, description, and stock status",
    website_html: html_content  # Process HTML directly instead of URL
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "HTML-Processed Data:"
  puts JSON.pretty_generate(result.result) if result.result

rescue Scrapegraphai::Errors::UnprocessableEntityError => e
  puts "❌ Invalid request parameters. Please check your input."
  puts "Error: #{e.message}"
rescue Scrapegraphai::Errors::APIError => e
  puts "❌ API Error occurred:"
  puts "Status: #{e.status}" if e.respond_to?(:status)
  puts "Error: #{e.message}"
rescue => e
  puts "❌ Unexpected error occurred:"
  puts "Error: #{e.message}"
end

puts "\n✅ Advanced SmartScraper example completed!"
