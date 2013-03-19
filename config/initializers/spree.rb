require 'search'

Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  # config.site_name = "Spree Demo Site"
  
  config.allow_ssl_in_production = false
  
  config.searcher_class = ProductSearch
  
end
