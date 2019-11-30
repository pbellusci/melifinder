require 'spec_helper'
require 'pry'

RSpec.describe Melifinder::Finder do
  it "has a version number" do
    expect(Melifinder::VERSION).not_to be nil
  end

  describe 'Finder class' do
  
    before(:each) do
      @product_key = 'MLA790679565'
    end

    it "should not be nil" do
      finder = Melifinder::Finder.new(@product_key)
      expect(finder).not_to be(nil)
    end

    it "should raise error by empty key" do
      expect { Melifinder::Finder.new }.to raise_error RuntimeError
    end
    
    it "should return product" do
      finder = Melifinder::Finder.new(@product_key)
      expect(finder.product).is_a? Object
    end

    it "should return product price once" do
      finder = Melifinder::Finder.new(@product_key)
      expect(finder.check_price).not_to be_nil
      expect(finder.check_price).is_a? Numeric
    end

    it "should raise error if interval is less than 1minute" do
      finder = Melifinder::Finder.new(@product_key)
      expect { finder.check_price(20, 4) }.to raise_error RuntimeError
    end

  end
end
