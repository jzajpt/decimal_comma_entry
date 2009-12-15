require 'test_helper'

class Product
  include DecimalCommaFix
  attr_accessor :price
  
  decimal_comma_entry :price
end

class DecimalCommaEntryTest < ActiveSupport::TestCase
  context "entering new price with decimal comma" do
    setup do
      @product = Product.new
      @product.price = "15,50"
    end
    
    should "set the price" do
      assert_equal "15.50", @product.price
    end
  end

  context "entering new price with decimal point" do
    setup do
      @product = Product.new
      @product.price = "15.50"
    end
    
    should "set the price" do
      assert_equal "15.50", @product.price
    end
  end
  
  context "entering new price as a float" do
    setup do
      @product = Product.new
      @product.price = 15.50
    end
    
    should "set the price" do
      assert_equal 15.50, @product.price
    end
  end
end
