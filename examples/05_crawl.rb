#!/usr/bin/env ruby
# frozen_string_literal: true

# Crawl Example
# 
# This example demonstrates comprehensive website crawling capabilities:
# - Starting crawl operations with various configurations
# - AI extraction mode vs markdown conversion mode
# - Using sitemaps for efficient crawling
# - Setting crawl depth and page limits
# - Retrieving crawl results asynchronously

require "bundler/setup"
require "scrapegraphai"

# Initialize the client
client = Scrapegraphai::Client.new(
  api_key: ENV["SCRAPEGRAPHAI_API_KEY"]
)

puts "🚀 Crawl Example"
puts "=" * 50

begin
  # Example 1: Basic crawl with AI extraction
  puts "\n🤖 Basic crawl with AI extraction..."
  
  crawl_result = client.crawl.start(
    url: "https://quotes.toscrape.com/",
    extraction_mode: true,  # Use AI extraction
    prompt: "Extract all quotes with their authors and tags",
    max_pages: 5,
    depth: 2
  )
  
  puts "Crawl Task ID: #{crawl_result.task_id}"
  puts "Status: #{crawl_result.status}"
  puts "Message: #{crawl_result.message}" if crawl_result.message
  
  # Wait and retrieve results
  if crawl_result.task_id
    puts "Waiting for crawl to complete..."
    sleep(5)  # Wait for processing
    
    results = client.crawl.retrieve_results(crawl_result.task_id)
    puts "Crawl Results:"
    puts "Status: #{results.status}"
    puts "Data:"
    puts JSON.pretty_generate(results.result) if results.result
  end
  
  # Example 2: Crawl with markdown conversion
  puts "\n📝 Crawl with markdown conversion..."
  
  crawl_result = client.crawl.start(
    url: "https://books.toscrape.com/",
    extraction_mode: false,  # Use markdown conversion
    max_pages: 3,
    depth: 1
  )
  
  puts "Markdown Crawl Task ID: #{crawl_result.task_id}"
  puts "Status: #{crawl_result.status}"
  
  if crawl_result.task_id
    puts "Waiting for markdown crawl to complete..."
    sleep(5)
    
    results = client.crawl.retrieve_results(crawl_result.task_id)
    puts "Markdown Crawl Results:"
    puts "Status: #{results.status}"
    
    if results.result && results.result.is_a?(Array)
      results.result.each_with_index do |page_result, index|
        puts "\nPage #{index + 1}:"
        puts "URL: #{page_result['url']}" if page_result['url']
        if page_result['markdown']
          markdown_preview = page_result['markdown'][0..200]
          puts "Markdown Preview: #{markdown_preview}..."
        end
      end
    end
  end
  
  # Example 3: Crawl with sitemap
  puts "\n🗺️ Crawl using sitemap..."
  
  crawl_result = client.crawl.start(
    url: "https://quotes.toscrape.com/",
    sitemap: true,  # Use sitemap for crawling
    extraction_mode: true,
    prompt: "Extract quotes, authors, and any biographical information",
    max_pages: 10
  )
  
  puts "Sitemap Crawl Task ID: #{crawl_result.task_id}"
  puts "Status: #{crawl_result.status}"
  
  # Example 4: Crawl with custom schema
  puts "\n📋 Crawl with custom extraction schema..."
  
  custom_schema = {
    type: "object",
    properties: {
      page_info: {
        type: "object",
        properties: {
          url: { type: "string" },
          title: { type: "string" },
          crawl_timestamp: { type: "string" }
        }
      },
      extracted_data: {
        type: "array",
        items: {
          type: "object",
          properties: {
            content_type: { type: "string" },
            title: { type: "string" },
            description: { type: "string" },
            metadata: { type: "object" }
          }
        }
      },
      page_stats: {
        type: "object",
        properties: {
          total_links: { type: "integer" },
          internal_links: { type: "integer" },
          external_links: { type: "integer" }
        }
      }
    }
  }
  
  crawl_result = client.crawl.start(
    url: "https://scrapethissite.com/pages/simple/",
    extraction_mode: true,
    prompt: "Extract all content with page statistics and metadata",
    schema: custom_schema,
    max_pages: 3,
    depth: 1
  )
  
  puts "Schema Crawl Task ID: #{crawl_result.task_id}"
  puts "Status: #{crawl_result.status}"
  
  # Example 5: Crawl with heavy JavaScript rendering
  puts "\n⚡ Crawl with heavy JavaScript rendering..."
  
  crawl_result = client.crawl.start(
    url: "https://quotes.toscrape.com/js/",
    extraction_mode: true,
    prompt: "Extract all dynamically loaded quotes and authors",
    render_heavy_js: true,  # Enable heavy JS rendering
    max_pages: 3,
    depth: 1
  )
  
  puts "JS Crawl Task ID: #{crawl_result.task_id}"
  puts "Status: #{crawl_result.status}"
  
  # Example 6: Crawl with custom rules
  puts "\n📏 Crawl with custom crawling rules..."
  
  # Note: The rules structure depends on the API specification
  # This is a conceptual example - adjust based on actual API
  crawl_rules = {
    allowed_domains: ["quotes.toscrape.com"],
    excluded_paths: ["/admin", "/private"],
    follow_redirects: true,
    respect_robots_txt: true
  }
  
  crawl_result = client.crawl.start(
    url: "https://quotes.toscrape.com/",
    extraction_mode: true,
    prompt: "Extract quotes while following custom crawling rules",
    rules: crawl_rules,
    max_pages: 5,
    depth: 2
  )
  
  puts "Rules-based Crawl Task ID: #{crawl_result.task_id}"
  puts "Status: #{crawl_result.status}"
  
  # Example 7: Monitor multiple crawl operations
  puts "\n📊 Monitoring multiple crawl operations..."
  
  # Start multiple crawls
  crawl_tasks = []
  
  urls_to_crawl = [
    {
      url: "https://quotes.toscrape.com/tag/humor/",
      prompt: "Extract humorous quotes and their context"
    },
    {
      url: "https://quotes.toscrape.com/tag/books/",
      prompt: "Extract book-related quotes and references"
    },
    {
      url: "https://quotes.toscrape.com/tag/reading/",
      prompt: "Extract reading-related quotes and insights"
    }
  ]
  
  urls_to_crawl.each_with_index do |crawl_config, index|
    puts "\nStarting crawl #{index + 1}..."
    result = client.crawl.start(
      url: crawl_config[:url],
      extraction_mode: true,
      prompt: crawl_config[:prompt],
      max_pages: 2,
      depth: 1
    )
    
    crawl_tasks << {
      task_id: result.task_id,
      url: crawl_config[:url],
      status: result.status
    }
    
    puts "Task ID: #{result.task_id}"
  end
  
  # Wait and check all results
  puts "\nWaiting for all crawls to complete..."
  sleep(10)
  
  crawl_tasks.each_with_index do |task, index|
    if task[:task_id]
      puts "\nChecking results for crawl #{index + 1} (#{task[:url]}):"
      begin
        results = client.crawl.retrieve_results(task[:task_id])
        puts "Status: #{results.status}"
        
        if results.result
          puts "Results available: #{results.result.is_a?(Array) ? results.result.length : 1} pages"
        end
      rescue => e
        puts "Error retrieving results: #{e.message}"
      end
    end
  end
  
  # Example 8: Deep crawl with extensive configuration
  puts "\n🔍 Deep crawl with extensive configuration..."
  
  deep_crawl_result = client.crawl.start(
    url: "https://books.toscrape.com/",
    extraction_mode: true,
    prompt: "Extract book information including title, price, rating, availability, and description",
    max_pages: 20,
    depth: 3,
    sitemap: false,
    render_heavy_js: false
  )
  
  puts "Deep Crawl Task ID: #{deep_crawl_result.task_id}"
  puts "Status: #{deep_crawl_result.status}"
  
  puts "\nNote: Deep crawl started. Use retrieve_results with the task ID to check progress."

rescue Scrapegraphai::Errors::BadRequestError => e
  puts "❌ Bad request. Please check your crawl parameters."
  puts "Error: #{e.message}"
rescue Scrapegraphai::Errors::NotFoundError => e
  puts "❌ Task not found. The task ID might be invalid or expired."
  puts "Error: #{e.message}"
rescue Scrapegraphai::Errors::APIError => e
  puts "❌ API Error occurred:"
  puts "Status: #{e.status}" if e.respond_to?(:status)
  puts "Error: #{e.message}"
rescue => e
  puts "❌ Unexpected error occurred:"
  puts "Error: #{e.message}"
end

puts "\n✅ Crawl example completed!"
puts "💡 Tip: Use the task IDs to retrieve results later with client.crawl.retrieve_results(task_id)"
