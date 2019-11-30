require "melifinder/version"
require "net/http"
require 'json'

module Melifinder

  class Product
    @key
    def initialize(key)
      @key = key
    end

    def data
      JSON.parse(Net::HTTP.get(url)).to_h
    end

    private
    def url
      uristring = "https://api.mercadolibre.com/items/#{ @key }.json"
      escaped_address = URI.escape(uristring) 
      URI.parse(escaped_address)
    end



  end


  class Error < StandardError; end
  # Your code goes here...
end