#!/usr/bin/env ruby
# frozen_string_literal: true

# Async Polling Example
# 
# This example demonstrates how to handle asynchronous operations with polling:
# - Starting operations and getting request/task IDs
# - Polling for completion status
# - Implementing smart polling with exponential backoff
# - Handling multiple concurrent operations
# - Timeout handling for long-running operations

require "bundler/setup"
require "scrapegraphai"

# Initialize the client
client = Scrapegraphai::Client.new(
  api_key: ENV["SCRAPEGRAPHAI_API_KEY"]
)

puts "🚀 Async Polling Example"
puts "=" * 50

# Helper class for smart polling
class SmartPoller
  def initialize(client, initial_delay: 1.0, max_delay: 30.0, timeout: 300)
    @client = client
    @initial_delay = initial_delay
    @max_delay = max_delay
    @timeout = timeout
  end
  
  def poll_smartscraper(request_id)
    poll_operation(
      "SmartScraper",
      request_id,
      -> { @client.smartscraper.retrieve(request_id) }
    )
  end
  
  def poll_markdownify(request_id)
    poll_operation(
      "Markdownify", 
      request_id,
      -> { @client.markdownify.retrieve_status(request_id) }
    )
  end
  
  def poll_searchscraper(request_id)
    poll_operation(
      "SearchScraper",
      request_id,
      -> { @client.searchscraper.retrieve_status(request_id) }
    )
  end
  
  def poll_crawl(task_id)
    poll_operation(
      "Crawl",
      task_id,
      -> { @client.crawl.retrieve_results(task_id) }
    )
  end
  
  private
  
  def poll_operation(operation_name, id, retriever_proc)
    start_time = Time.now
    delay = @initial_delay
    attempt = 0
    
    puts "🔄 Starting to poll #{operation_name} (ID: #{id})"
    
    loop do
      attempt += 1
      elapsed_time = Time.now - start_time
      
      if elapsed_time > @timeout
        puts "⏰ Timeout reached for #{operation_name} after #{elapsed_time.round(1)}s"
        return {
          success: false,
          error: "Timeout after #{@timeout}s",
          elapsed_time: elapsed_time
        }
      end
      
      begin
        puts "  Attempt #{attempt} (after #{elapsed_time.round(1)}s, delay: #{delay.round(1)}s)"
        
        result = retriever_proc.call
        
        case result.status&.to_s
        when "completed"
          puts "✅ #{operation_name} completed successfully!"
          return {
            success: true,
            result: result,
            attempts: attempt,
            elapsed_time: elapsed_time
          }
          
        when "failed", "error"
          puts "❌ #{operation_name} failed!"
          return {
            success: false,
            error: result.error || "Operation failed",
            result: result,
            attempts: attempt,
            elapsed_time: elapsed_time
          }
          
        when "processing", "queued", "pending"
          puts "  Status: #{result.status} - continuing to poll..."
          
        else
          puts "  Unknown status: #{result.status} - continuing to poll..."
        end
        
      rescue Scrapegraphai::Errors::NotFoundError => e
        puts "❌ #{operation_name} not found: #{e.message}"
        return {
          success: false,
          error: "Operation not found",
          elapsed_time: elapsed_time
        }
        
      rescue => e
        puts "⚠️ Error polling #{operation_name}: #{e.message}"
        # Continue polling for transient errors
      end
      
      # Wait before next poll with exponential backoff
      sleep(delay)
      delay = [delay * 1.5, @max_delay].min  # Exponential backoff with cap
    end
  end
end

begin
  # Example 1: Basic polling for SmartScraper
  puts "\n📊 Basic polling for SmartScraper..."
  
  scraper_result = client.smartscraper.create(
    user_prompt: "Extract all book titles, prices, and ratings",
    website_url: "https://books.toscrape.com/",
    total_pages: 3
  )
  
  if scraper_result.request_id
    poller = SmartPoller.new(client, initial_delay: 2.0, max_delay: 10.0, timeout: 120)
    poll_result = poller.poll_smartscraper(scraper_result.request_id)
    
    if poll_result[:success]
      puts "📈 SmartScraper Results:"
      puts "  Attempts: #{poll_result[:attempts]}"
      puts "  Time: #{poll_result[:elapsed_time].round(1)}s"
      puts "  Data available: #{poll_result[:result].result ? 'Yes' : 'No'}"
    else
      puts "❌ SmartScraper failed: #{poll_result[:error]}"
    end
  end
  
  # Example 2: Polling for Markdownify operation
  puts "\n📝 Polling for Markdownify operation..."
  
  markdown_result = client.markdownify.convert(
    website_url: "https://quotes.toscrape.com/"
  )
  
  if markdown_result.request_id
    poller = SmartPoller.new(client, initial_delay: 1.0, max_delay: 8.0, timeout: 90)
    poll_result = poller.poll_markdownify(markdown_result.request_id)
    
    if poll_result[:success]
      puts "📄 Markdownify Results:"
      puts "  Attempts: #{poll_result[:attempts]}"
      puts "  Time: #{poll_result[:elapsed_time].round(1)}s"
      
      if poll_result[:result].result&.dig("markdown")
        markdown_length = poll_result[:result].result["markdown"].length
        puts "  Markdown length: #{markdown_length} characters"
      end
    else
      puts "❌ Markdownify failed: #{poll_result[:error]}"
    end
  end
  
  # Example 3: Polling for SearchScraper operation
  puts "\n🔍 Polling for SearchScraper operation..."
  
  search_result = client.searchscraper.create(
    user_prompt: "Find recent articles about Ruby programming best practices",
    num_results: 5
  )
  
  if search_result.request_id
    poller = SmartPoller.new(client, initial_delay: 3.0, max_delay: 15.0, timeout: 180)
    poll_result = poller.poll_searchscraper(search_result.request_id)
    
    if poll_result[:success]
      puts "🔎 SearchScraper Results:"
      puts "  Attempts: #{poll_result[:attempts]}"
      puts "  Time: #{poll_result[:elapsed_time].round(1)}s"
      puts "  Search results available: #{poll_result[:result].result ? 'Yes' : 'No'}"
    else
      puts "❌ SearchScraper failed: #{poll_result[:error]}"
    end
  end
  
  # Example 4: Polling for Crawl operation
  puts "\n🕷️ Polling for Crawl operation..."
  
  crawl_result = client.crawl.start(
    url: "https://quotes.toscrape.com/",
    extraction_mode: true,
    prompt: "Extract quotes and authors",
    max_pages: 5,
    depth: 2
  )
  
  if crawl_result.task_id
    poller = SmartPoller.new(client, initial_delay: 5.0, max_delay: 20.0, timeout: 300)
    poll_result = poller.poll_crawl(crawl_result.task_id)
    
    if poll_result[:success]
      puts "🕸️ Crawl Results:"
      puts "  Attempts: #{poll_result[:attempts]}"
      puts "  Time: #{poll_result[:elapsed_time].round(1)}s"
      
      if poll_result[:result].result.is_a?(Array)
        puts "  Pages crawled: #{poll_result[:result].result.length}"
      end
    else
      puts "❌ Crawl failed: #{poll_result[:error]}"
    end
  end
  
  # Example 5: Managing multiple concurrent operations
  puts "\n🔄 Managing multiple concurrent operations..."
  
  operations = []
  
  # Start multiple operations
  puts "Starting multiple operations..."
  
  # SmartScraper operation
  smart_result = client.smartscraper.create(
    user_prompt: "Extract product names and prices",
    website_url: "https://books.toscrape.com/catalogue/page-1.html"
  )
  if smart_result.request_id
    operations << {
      type: :smartscraper,
      id: smart_result.request_id,
      name: "Product Extraction"
    }
  end
  
  # Markdownify operation
  markdown_result = client.markdownify.convert(
    website_url: "https://scrapethissite.com/pages/simple/"
  )
  if markdown_result.request_id
    operations << {
      type: :markdownify,
      id: markdown_result.request_id,
      name: "Markdown Conversion"
    }
  end
  
  # SearchScraper operation
  search_result = client.searchscraper.create(
    user_prompt: "Find tutorials about web scraping with Ruby",
    num_results: 3
  )
  if search_result.request_id
    operations << {
      type: :searchscraper,
      id: search_result.request_id,
      name: "Tutorial Search"
    }
  end
  
  puts "Started #{operations.length} operations"
  
  # Poll all operations concurrently using threads
  threads = []
  results = {}
  
  operations.each do |op|
    threads << Thread.new do
      poller = SmartPoller.new(client, initial_delay: 2.0, max_delay: 12.0, timeout: 150)
      
      case op[:type]
      when :smartscraper
        result = poller.poll_smartscraper(op[:id])
      when :markdownify
        result = poller.poll_markdownify(op[:id])
      when :searchscraper
        result = poller.poll_searchscraper(op[:id])
      end
      
      results[op[:id]] = {
        name: op[:name],
        type: op[:type],
        result: result
      }
    end
  end
  
  # Wait for all operations to complete
  threads.each(&:join)
  
  puts "\n📊 Concurrent Operations Summary:"
  puts "=" * 40
  
  results.each do |id, data|
    puts "\n#{data[:name]} (#{data[:type]}):"
    puts "  ID: #{id}"
    
    if data[:result][:success]
      puts "  ✅ Status: Completed"
      puts "  ⏱️  Time: #{data[:result][:elapsed_time].round(1)}s"
      puts "  🔄 Attempts: #{data[:result][:attempts]}"
    else
      puts "  ❌ Status: Failed"
      puts "  ⚠️  Error: #{data[:result][:error]}"
      puts "  ⏱️  Time: #{data[:result][:elapsed_time].round(1)}s"
    end
  end
  
  # Example 6: Advanced polling with progress tracking
  puts "\n📈 Advanced polling with progress tracking..."
  
  class ProgressTracker
    def initialize(operation_name)
      @operation_name = operation_name
      @start_time = Time.now
      @last_status = nil
      @status_changes = []
    end
    
    def update_status(status, attempt, additional_info = {})
      current_time = Time.now
      elapsed = current_time - @start_time
      
      if status != @last_status
        @status_changes << {
          status: status,
          timestamp: current_time,
          elapsed: elapsed,
          attempt: attempt
        }
        @last_status = status
        
        puts "  📊 #{@operation_name}: #{status} (#{elapsed.round(1)}s, attempt #{attempt})"
        
        additional_info.each do |key, value|
          puts "      #{key}: #{value}"
        end
      end
    end
    
    def summary
      puts "\n📋 #{@operation_name} Progress Summary:"
      @status_changes.each_with_index do |change, index|
        puts "  #{index + 1}. #{change[:status]} at #{change[:elapsed].round(1)}s (attempt #{change[:attempt]})"
      end
    end
  end
  
  # Start an operation with progress tracking
  tracker_result = client.smartscraper.create(
    user_prompt: "Extract comprehensive book information including reviews",
    website_url: "https://books.toscrape.com/",
    total_pages: 2
  )
  
  if tracker_result.request_id
    tracker = ProgressTracker.new("Comprehensive Book Scraping")
    start_time = Time.now
    delay = 2.0
    attempt = 0
    
    loop do
      attempt += 1
      elapsed = Time.now - start_time
      
      break if elapsed > 120  # 2 minute timeout
      
      begin
        result = client.smartscraper.retrieve(tracker_result.request_id)
        
        additional_info = {}
        if result.result
          additional_info["Data available"] = "Yes"
        end
        
        tracker.update_status(result.status, attempt, additional_info)
        
        if result.status&.to_s == "completed"
          puts "✅ Operation completed successfully!"
          break
        elsif result.status&.to_s == "failed"
          puts "❌ Operation failed!"
          break
        end
        
      rescue => e
        tracker.update_status("error", attempt, { "Error" => e.message })
      end
      
      sleep(delay)
      delay = [delay * 1.2, 10.0].min  # Gradual backoff
    end
    
    tracker.summary
  end

rescue Scrapegraphai::Errors::AuthenticationError => e
  puts "❌ Authentication failed. Please check your API key."
  puts "Error: #{e.message}"
rescue => e
  puts "❌ Unexpected error occurred:"
  puts "Error: #{e.message}"
end

puts "\n✅ Async polling examples completed!"
puts "\n💡 Key takeaways for async polling:"
puts "  - Use exponential backoff to avoid overwhelming the server"
puts "  - Implement reasonable timeouts to prevent infinite polling"
puts "  - Handle different status types appropriately"
puts "  - Use threads for concurrent polling of multiple operations"
puts "  - Track progress and provide user feedback"
puts "  - Handle errors gracefully and provide retry mechanisms"
