
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "validates when a product is valid" do
      @category = Category.new(name: "Kitchen")
      @product = Product.new(name: "Knife", price: 1000, quantity: 20, category: @category)
      expect(@product).to be_valid
    end

    it "is not valid when a product is empty" do
      @category = Category.new(name: "Kitchen")
      @product = Product.new(name: nil, price: 1000, quantity: 20, category: @category)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    # showing failure, need to be fixed (price_cents related ?)
    it "is not valid when a price is empty" do
      @category = Category.new(name: "Kitchen")
      @product = Product.new(name: "Knife", price: nil, quantity: 20, category: @category)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "is not valid when a quantity is empty" do
      @category = Category.new(name: "Kitchen")
      @product = Product.new(name: "Knife", price: 1000, quantity: nil, category: @category)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid when a category is empty" do
      @category = Category.new(name: "Kitchen")
      @product = Product.new(name: "Knife", price: 1000, quantity: 20, category: nil)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end




  end
end