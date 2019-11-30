require "melifinder/version"
require "product"

module Melifinder
  
  class Finder

    @product_key
    
    def initialize(product_key='')
      raise 'Product Key must not be empty' if product_key.empty?
      @product_key = product_key
      @product = Melifinder::Product.new(product_key)
    end
    
    def product
      @product.data
    end

    def reload
      @product = Melifinder::Product.new(@product_key)
    end

    def check_price(checks=1, interval=30)
      reload
      return product["price"] if checks == 1
      raise "Please set bigger interval (>30 secs)" if interval < 30
      puts ':::::::: Start Checking :::::::: '
      checks.times do |i|
        puts "Price: #{check_price}"
        sleep interval
      end
      puts ':::::::: End Checking ::::::::'
    end
  
  end
  
  class Error < StandardError; end
  
end
