# ScrapeGraphAI Ruby Examples

This directory contains comprehensive examples demonstrating how to use the ScrapeGraphAI Ruby gem effectively. Each example focuses on different aspects and use cases of the API.

## Prerequisites

Before running these examples, make sure you have:

1. **Ruby 3.2.0 or higher** installed
2. **ScrapeGraphAI API key** - Get one from [scrapegraphai.com](https://scrapegraphai.com)
3. **Environment variable set**: `export SCRAPEGRAPHAI_API_KEY="your-api-key"`

## Installation

```bash
# Install the gem
gem install scrapegraphai

# Or add to your Gemfile
echo 'gem "scrapegraphai"' >> Gemfile
bundle install
```

## Examples Overview

### 🚀 [01_basic_smartscraper.rb](01_basic_smartscraper.rb)
**Basic SmartScraper Usage**

Learn the fundamentals of data extraction using natural language prompts.

- Simple data extraction from web pages
- Product information extraction
- Contact information extraction
- News article processing
- Basic error handling

```bash
ruby examples/01_basic_smartscraper.rb
```

**Key Features Demonstrated:**
- Basic client initialization
- Simple prompts for data extraction
- Working with different website types
- Understanding response structure

---

### ⚡ [02_advanced_smartscraper.rb](02_advanced_smartscraper.rb)
**Advanced SmartScraper Features**

Explore advanced features for complex scraping scenarios.

- Custom JSON schemas for structured output
- Pagination handling
- Infinite scrolling
- Custom headers and cookies
- Heavy JavaScript rendering
- Website interaction steps
- Processing HTML content directly

```bash
ruby examples/02_advanced_smartscraper.rb
```

**Key Features Demonstrated:**
- Custom output schemas
- Multi-page processing
- Dynamic content handling
- Browser automation features
- Direct HTML processing

---

### 📝 [03_markdownify.rb](03_markdownify.rb)
**Web Page to Markdown Conversion**

Convert web pages into clean, structured Markdown format.

- Article conversion to markdown
- Custom headers usage
- Website interaction before conversion
- Async status retrieval
- Different content types handling

```bash
ruby examples/03_markdownify.rb
```

**Key Features Demonstrated:**
- Clean text extraction
- Markdown formatting
- Content preprocessing
- Async operation handling

---

### 🔍 [04_searchscraper.rb](04_searchscraper.rb)
**Multi-Source Search and Extraction**

Perform web searches and extract structured data from multiple sources.

- Basic search and extraction
- Product comparison searches
- News and current events
- Academic research
- Custom output schemas
- Local business searches
- Technical documentation searches

```bash
ruby examples/04_searchscraper.rb
```

**Key Features Demonstrated:**
- Multi-source data aggregation
- Search query optimization
- Result ranking and filtering
- Comparative analysis

---

### 🕷️ [05_crawl.rb](05_crawl.rb)
**Comprehensive Website Crawling**

Large-scale website crawling with various configurations.

- AI extraction vs markdown conversion modes
- Sitemap-based crawling
- Custom extraction schemas
- Heavy JavaScript rendering
- Custom crawling rules
- Multiple concurrent crawls
- Deep crawling with extensive configuration

```bash
ruby examples/05_crawl.rb
```

**Key Features Demonstrated:**
- Large-scale data collection
- Structured crawling strategies
- Async task management
- Resource optimization

---

### 🛡️ [06_error_handling.rb](06_error_handling.rb)
**Comprehensive Error Handling**

Production-ready error handling strategies.

- Different error types and responses
- Retry strategies with exponential backoff
- Timeout configuration
- Input validation
- Production-ready service wrapper

```bash
ruby examples/06_error_handling.rb
```

**Key Features Demonstrated:**
- Robust error handling
- Retry mechanisms
- Service reliability
- Production best practices

---

### 🔄 [07_async_polling.rb](07_async_polling.rb)
**Asynchronous Operations and Polling**

Handle long-running operations with smart polling strategies.

- Smart polling with exponential backoff
- Multiple concurrent operations
- Progress tracking
- Timeout handling
- Status monitoring

```bash
ruby examples/07_async_polling.rb
```

**Key Features Demonstrated:**
- Async operation management
- Efficient polling strategies
- Concurrent processing
- Progress monitoring

---

## Quick Start

1. **Set your API key:**
   ```bash
   export SCRAPEGRAPHAI_API_KEY="your-api-key-here"
   ```

2. **Run a basic example:**
   ```bash
   ruby examples/01_basic_smartscraper.rb
   ```

3. **Try different examples based on your use case:**
   - **Simple extraction**: Start with `01_basic_smartscraper.rb`
   - **Complex scraping**: Try `02_advanced_smartscraper.rb`
   - **Content conversion**: Use `03_markdownify.rb`
   - **Multi-source research**: Use `04_searchscraper.rb`
   - **Large-scale crawling**: Use `05_crawl.rb`

## Common Use Cases

### E-commerce Data Extraction
```ruby
# Extract product information
client.smartscraper.create(
  user_prompt: "Extract product name, price, description, and availability",
  website_url: "https://example-store.com/product/123"
)
```

### News and Content Aggregation
```ruby
# Search for recent news
client.searchscraper.create(
  user_prompt: "Find recent news about AI developments",
  num_results: 10
)
```

### Documentation Processing
```ruby
# Convert documentation to markdown
client.markdownify.convert(
  website_url: "https://docs.example.com/guide"
)
```

### Competitive Analysis
```ruby
# Crawl competitor websites
client.crawl.start(
  url: "https://competitor.com",
  extraction_mode: true,
  prompt: "Extract pricing and feature information",
  max_pages: 50
)
```

## Configuration Options

### Client Configuration
```ruby
client = Scrapegraphai::Client.new(
  api_key: ENV["SCRAPEGRAPHAI_API_KEY"],
  timeout: 60,           # Request timeout in seconds
  max_retries: 3,        # Number of retries for failed requests
  environment: :production # or :environment_1 for testing
)
```

### Request Options
```ruby
# Per-request configuration
client.smartscraper.create(
  user_prompt: "Extract data",
  website_url: "https://example.com",
  request_options: {
    timeout: 30,         # Override default timeout
    max_retries: 5,      # Override default retries
    extra_headers: {     # Additional headers
      "Custom-Header": "value"
    }
  }
)
```

## Best Practices

### 1. **Error Handling**
Always wrap API calls in proper error handling:
```ruby
begin
  result = client.smartscraper.create(params)
rescue Scrapegraphai::Errors::RateLimitError => e
  # Handle rate limiting
  sleep(60)
  retry
rescue Scrapegraphai::Errors::APIError => e
  # Handle other API errors
  puts "API Error: #{e.message}"
end
```

### 2. **Async Operations**
For long-running operations, use polling:
```ruby
result = client.crawl.start(params)
task_id = result.task_id

# Poll for completion
loop do
  status = client.crawl.retrieve_results(task_id)
  break if status.status == "completed"
  sleep(5)
end
```

### 3. **Rate Limiting**
Respect rate limits and implement backoff strategies:
```ruby
def with_rate_limit_handling
  yield
rescue Scrapegraphai::Errors::RateLimitError
  sleep(60)  # Wait before retrying
  retry
end
```

### 4. **Input Validation**
Validate inputs before making API calls:
```ruby
def validate_url(url)
  uri = URI.parse(url)
  uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
rescue URI::InvalidURIError
  false
end
```

## Troubleshooting

### Common Issues

1. **Authentication Error**
   - Check if `SCRAPEGRAPHAI_API_KEY` is set correctly
   - Verify your API key is valid and active

2. **Rate Limit Errors**
   - Implement exponential backoff
   - Consider upgrading your plan for higher limits

3. **Timeout Errors**
   - Increase timeout for complex operations
   - Break large operations into smaller chunks

4. **Invalid URL Errors**
   - Validate URLs before sending requests
   - Ensure URLs are accessible and properly formatted

### Debug Mode

Enable verbose logging for debugging:
```ruby
require 'logger'

# Add logging to see request details
client = Scrapegraphai::Client.new(
  api_key: ENV["SCRAPEGRAPHAI_API_KEY"]
)

# Check response details
result = client.smartscraper.create(params)
puts "Request ID: #{result.request_id}"
puts "Status: #{result.status}"
puts "Result: #{result.result}"
```

## Contributing

Found an issue with the examples or have suggestions for improvements?

1. **Report Issues**: Open an issue on the [GitHub repository](https://github.com/stainless-sdks/scrapegraphai-ruby)
2. **Suggest Examples**: Request new examples for specific use cases
3. **Improve Documentation**: Help improve these examples and documentation

## Resources

- **📚 [Official Documentation](https://gemdocs.org/gems/scrapegraphai)**
- **🌐 [API Reference](https://scrapegraphai.com)**
- **💬 [Community Support](https://github.com/stainless-sdks/scrapegraphai-ruby/discussions)**
- **🐛 [Report Issues](https://github.com/stainless-sdks/scrapegraphai-ruby/issues)**

## License

These examples are provided under the same license as the ScrapeGraphAI Ruby gem.

---

**Happy Scraping! 🚀**
