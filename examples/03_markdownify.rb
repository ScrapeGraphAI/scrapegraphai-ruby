#!/usr/bin/env ruby
# frozen_string_literal: true

# Markdownify Example
# 
# This example demonstrates how to use the Markdownify feature to convert
# web pages into clean, structured Markdown format. This is useful for:
# - Converting articles to markdown for documentation
# - Creating clean text versions of web content
# - Extracting readable content from complex web pages

require "bundler/setup"
require "scrapegraphai"

# Initialize the client
client = Scrapegraphai::Client.new(
  api_key: ENV["SCRAPEGRAPHAI_API_KEY"]
)

puts "🚀 Markdownify Example"
puts "=" * 50

begin
  # Example 1: Convert a simple article to markdown
  puts "\n📝 Converting article to markdown..."
  
  result = client.markdownify.convert(
    website_url: "https://quotes.toscrape.com/"
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  
  if result.result && result.result["markdown"]
    puts "\nMarkdown Content (first 500 characters):"
    puts "=" * 50
    markdown_content = result.result["markdown"]
    puts markdown_content[0..500] + (markdown_content.length > 500 ? "..." : "")
    
    # Save to file for inspection
    File.write("quotes_markdown.md", markdown_content)
    puts "\n💾 Full markdown saved to 'quotes_markdown.md'"
  end
  
  # Example 2: Convert with custom headers
  puts "\n🔧 Converting with custom headers..."
  
  custom_headers = {
    "User-Agent": "Mozilla/5.0 (compatible; MarkdownBot/1.0)",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
  }
  
  result = client.markdownify.convert(
    website_url: "https://books.toscrape.com/",
    headers: custom_headers
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  
  if result.result && result.result["markdown"]
    puts "\nMarkdown with Custom Headers (first 300 characters):"
    puts "=" * 50
    markdown_content = result.result["markdown"]
    puts markdown_content[0..300] + (markdown_content.length > 300 ? "..." : "")
  end
  
  # Example 3: Convert with interaction steps
  puts "\n🖱️ Converting with interaction steps..."
  
  interaction_steps = [
    "wait for 2 seconds",
    "scroll down by 500 pixels",
    "wait for 1 second"
  ]
  
  result = client.markdownify.convert(
    website_url: "https://quotes.toscrape.com/scroll",
    steps: interaction_steps
  )
  
  puts "Request ID: #{result.request_id}"
  puts "Status: #{result.status}"
  
  if result.result && result.result["markdown"]
    puts "\nMarkdown after Interactions (first 300 characters):"
    puts "=" * 50
    markdown_content = result.result["markdown"]
    puts markdown_content[0..300] + (markdown_content.length > 300 ? "..." : "")
  end
  
  # Example 4: Retrieve status of a previous conversion (async pattern)
  puts "\n⏳ Demonstrating async status retrieval..."
  
  # Start a conversion
  conversion_result = client.markdownify.convert(
    website_url: "https://scrapethissite.com/pages/simple/"
  )
  
  if conversion_result.request_id
    puts "Started conversion with Request ID: #{conversion_result.request_id}"
    
    # Wait a moment and then check status
    sleep(2)
    
    status_result = client.markdownify.retrieve_status(conversion_result.request_id)
    puts "Status check result:"
    puts "Status: #{status_result.status}"
    
    if status_result.result && status_result.result["markdown"]
      puts "\nMarkdown Content Available:"
      markdown_content = status_result.result["markdown"]
      puts markdown_content[0..200] + (markdown_content.length > 200 ? "..." : "")
    end
  end
  
  # Example 5: Converting different types of content
  puts "\n🌐 Converting different content types..."
  
  test_urls = [
    {
      url: "https://httpbin.org/html",
      description: "Simple HTML page"
    },
    {
      url: "https://quotes.toscrape.com/tag/humor/",
      description: "Content with specific tags"
    }
  ]
  
  test_urls.each_with_index do |test_case, index|
    puts "\n#{index + 1}. Converting #{test_case[:description]}..."
    
    result = client.markdownify.convert(
      website_url: test_case[:url]
    )
    
    puts "   Request ID: #{result.request_id}"
    puts "   Status: #{result.status}"
    
    if result.result && result.result["markdown"]
      markdown_content = result.result["markdown"]
      puts "   Markdown length: #{markdown_content.length} characters"
      puts "   Preview: #{markdown_content[0..100].gsub(/\n/, ' ')}..."
    end
  end

rescue Scrapegraphai::Errors::NotFoundError => e
  puts "❌ Resource not found. The URL might be invalid or the request ID doesn't exist."
  puts "Error: #{e.message}"
rescue Scrapegraphai::Errors::APIError => e
  puts "❌ API Error occurred:"
  puts "Status: #{e.status}" if e.respond_to?(:status)
  puts "Error: #{e.message}"
rescue => e
  puts "❌ Unexpected error occurred:"
  puts "Error: #{e.message}"
end

puts "\n✅ Markdownify example completed!"
