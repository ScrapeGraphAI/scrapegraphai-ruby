#!/usr/bin/env ruby
# frozen_string_literal: true

# Basic SmartScraper Example
# 
# This example demonstrates the most common use case for ScrapeGraphAI:
# extracting specific data from a webpage using natural language prompts.

require "bundler/setup"
require "scrapegraphai"

# Initialize the client with your API key
# Make sure to set your API key as an environment variable: export SCRAPEGRAPHAI_API_KEY="your-api-key"
client = Scrapegraphai::Client.new(
  api_key: ENV["SCRAPEGRAPHAI_API_KEY"]
)

puts "🚀 Basic SmartScraper Example"
puts "=" * 50

begin
  # Example 1: Extract product information from an e-commerce page
  puts "\n📦 Extracting product information..."
  
  result = client.smartscraper.create(
    user_prompt: "Extract the product name, price, description, and availability status",
    website_url: "https://books.toscrape.com/catalogue/a-light-in-the-attic_1000/index.html"
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Extracted Data:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 2: Extract contact information from a company website
  puts "\n📞 Extracting contact information..."
  
  result = client.smartscraper.create(
    user_prompt: "Find all contact information including email addresses, phone numbers, and physical addresses",
    website_url: "https://scrapethissite.com/pages/simple/"
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Extracted Data:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 3: Extract news article information
  puts "\n📰 Extracting news article information..."
  
  result = client.smartscraper.create(
    user_prompt: "Extract the headline, author, publication date, and main content summary",
    website_url: "https://quotes.toscrape.com/"
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Extracted Data:"
  puts JSON.pretty_generate(result.result) if result.result

rescue Scrapegraphai::Errors::AuthenticationError => e
  puts "❌ Authentication failed. Please check your API key."
  puts "Error: #{e.message}"
rescue Scrapegraphai::Errors::RateLimitError => e
  puts "⏳ Rate limit exceeded. Please wait before making more requests."
  puts "Error: #{e.message}"
rescue Scrapegraphai::Errors::APIError => e
  puts "❌ API Error occurred:"
  puts "Status: #{e.status}" if e.respond_to?(:status)
  puts "Error: #{e.message}"
rescue => e
  puts "❌ Unexpected error occurred:"
  puts "Error: #{e.message}"
end

puts "\n✅ Basic SmartScraper example completed!"
