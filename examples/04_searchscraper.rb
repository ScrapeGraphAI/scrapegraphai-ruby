#!/usr/bin/env ruby
# frozen_string_literal: true

# SearchScraper Example
# 
# This example demonstrates how to use SearchScraper to:
# - Perform web searches based on natural language queries
# - Extract structured data from multiple search result pages
# - Use LLM to refine search queries and merge results
# - Handle different numbers of search results

require "bundler/setup"
require "scrapegraphai"

# Initialize the client
client = Scrapegraphai::Client.new(
  api_key: ENV["SCRAPEGRAPHAI_API_KEY"]
)

puts "🚀 SearchScraper Example"
puts "=" * 50

begin
  # Example 1: Basic search and extraction
  puts "\n🔍 Basic search and data extraction..."
  
  result = client.searchscraper.create(
    user_prompt: "Find information about Ruby programming language features and benefits",
    num_results: 5  # Search and scrape top 5 results
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Search Results:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 2: Product comparison search
  puts "\n🛍️ Product comparison search..."
  
  result = client.searchscraper.create(
    user_prompt: "Compare prices and features of iPhone 15 vs Samsung Galaxy S24",
    num_results: 8
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Product Comparison Results:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 3: News and current events search
  puts "\n📰 News and current events search..."
  
  result = client.searchscraper.create(
    user_prompt: "Find recent news about artificial intelligence developments in 2024",
    num_results: 6
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "News Results:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 4: Academic research search
  puts "\n🎓 Academic research search..."
  
  result = client.searchscraper.create(
    user_prompt: "Find research papers and articles about machine learning in healthcare",
    num_results: 4
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Research Results:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 5: Search with custom output schema
  puts "\n📋 Search with custom output schema..."
  
  search_schema = {
    type: "object",
    properties: {
      search_query: { type: "string" },
      results: {
        type: "array",
        items: {
          type: "object",
          properties: {
            title: { type: "string" },
            url: { type: "string" },
            summary: { type: "string" },
            relevance_score: { type: "number", minimum: 0, maximum: 10 },
            key_points: {
              type: "array",
              items: { type: "string" }
            },
            source_type: { 
              type: "string",
              enum: ["blog", "news", "academic", "commercial", "forum", "other"]
            }
          },
          required: ["title", "url", "summary"]
        }
      },
      total_results: { type: "integer" },
      search_metadata: {
        type: "object",
        properties: {
          search_time: { type: "string" },
          refined_query: { type: "string" }
        }
      }
    }
  }
  
  result = client.searchscraper.create(
    user_prompt: "Search for best practices in Ruby web development",
    num_results: 5,
    output_schema: search_schema
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Structured Search Results:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 6: Search with custom headers
  puts "\n🔧 Search with custom headers..."
  
  custom_headers = {
    "User-Agent": "Mozilla/5.0 (compatible; SearchBot/1.0)",
    "Accept-Language": "en-US,en;q=0.9"
  }
  
  result = client.searchscraper.create(
    user_prompt: "Find tutorials for beginners learning Python programming",
    num_results: 4,
    headers: custom_headers
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Tutorial Search Results:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 7: Local business search
  puts "\n🏪 Local business search..."
  
  result = client.searchscraper.create(
    user_prompt: "Find Italian restaurants in San Francisco with ratings and reviews",
    num_results: 6
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Restaurant Search Results:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 8: Technical documentation search
  puts "\n📚 Technical documentation search..."
  
  result = client.searchscraper.create(
    user_prompt: "Find official documentation and guides for Docker containerization",
    num_results: 5
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  puts "Documentation Results:"
  puts JSON.pretty_generate(result.result) if result.result
  
  # Example 9: Retrieve status of a search operation (async pattern)
  puts "\n⏳ Demonstrating async status retrieval..."
  
  # Start a search operation
  search_result = client.searchscraper.create(
    user_prompt: "Find information about sustainable energy solutions",
    num_results: 3
  )
  
  if search_result.request_id
    puts "Started search with Request ID: #{search_result.request_id}"
    
    # Wait a moment and then check status
    sleep(2)
    
    status_result = client.searchscraper.retrieve_status(search_result.request_id)
    puts "Status check result:"
    puts "Status: #{status_result.status}"
    
    if status_result.result
      puts "Search Results Available:"
      puts JSON.pretty_generate(status_result.result)
    end
  end

rescue Scrapegraphai::Errors::BadRequestError => e
  puts "❌ Bad request. Please check your search parameters."
  puts "Error: #{e.message}"
rescue Scrapegraphai::Errors::APIError => e
  puts "❌ API Error occurred:"
  puts "Status: #{e.status}" if e.respond_to?(:status)
  puts "Error: #{e.message}"
rescue => e
  puts "❌ Unexpected error occurred:"
  puts "Error: #{e.message}"
end

puts "\n✅ SearchScraper example completed!"
