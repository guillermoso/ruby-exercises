require './spec_helper'
require '../lib/product'

describe Product do
  context "On initialization" do
    it "sets the :title and :cost" do
      product = Product.new("Title", 200)

      expect(product.title).to eql "Title"
      expect(product.cost).to eql 200
    end

    it "starts :reviews as empty" do
      product = Product.new("Test", 1)

      expect(product.reviews.size).to eql 0
    end
  end

  describe "#read_product_info" do
    it "returns the product info as a string" do
      product = Product.new("Test", 1)

      info = product.read_product_info

      expect(info).to be_a String
    end

    it "returns the product info correctly" do
      product = Product.new("Test", 1)

      info = product.read_product_info

      expect(info).to eql "Test currently costs 1"
    end
  end

  describe "#add_review" do
    it "adds an item to :reviews" do
      product = Product.new("Test", 1)

      product.add_review("a review")

      expect(product.reviews.size).to eql 1
    end

    it "adds the expected item to the end of :reviews" do
      product = Product.new("Test", 1)

      product.add_review("a review")

      expect(product.reviews.pop).to eql "a review"
    end
  end

  describe "#read_reviews" do
    it ":reliability is nil if the method is not called" do
      product = Product.new("Test", 1)

      15.times { product.add_review("a review") }

      expect(product.reliability).to eql nil
    end

    it "sets :reliability to 'strong' if theres more than 10 reviews" do
      product = Product.new("Test", 1)

      11.times { product.add_review("a review") }

      product.read_reviews

      expect(product.reliability).to eql "strong"
    end

    it "sets :reliability to 'okay' if theres 6-10 reviews" do
      product = Product.new("Test", 1)

      6.times { product.add_review("a review") }

      product.read_reviews

      expect(product.reliability).to eql "okay"
    end

    it "sets :reliability to 'weak' if theres less than 6 reviews" do
      product = Product.new("Test", 1)

      5.times { product.add_review("a review") }

      product.read_reviews

      expect(product.reliability).to eql "weak"
    end
  end
end
