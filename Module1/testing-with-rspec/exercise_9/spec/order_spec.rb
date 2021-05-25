require './spec_helper'
require '../lib/order'

describe Order do
  context "On initialization" do
    it ":total_products is zero" do
      order = Order.new

      expect(order.total_products).to eql 0
    end

    it ":status is 'incomplete'" do
      order = Order.new

      expect(order.status).to eql "incomplete"
    end
  end

  describe "#add_to_cart" do
    it "increments :total_products by 1" do
      order = Order.new

      order.add_to_cart
      order.add_to_cart

      expect(order.total_products).to eql 2
    end
  end

  describe "#check_out" do
    it "updates :status to 'complete'" do
      order = Order.new

      order.check_out

      expect(order.status).to eql "complete"
    end
  end

  describe "#update_discount" do
    it "awards a discount when :total_products is more than 5" do
      order = Order.new

      6.times { order.add_to_cart }

      expect(order.update_discount).not_to eql 0
    end

    it "awards a 0.20 discount when :total_products is more than 5" do
      order = Order.new

      6.times { order.add_to_cart }

      expect(order.update_discount).to eql 0.20
    end

    it "doesn't award a discount when :total_products is less or equal to 5" do
      order = Order.new

      2.times { order.add_to_cart }

      expect(order.update_discount).to eql 0

      2.times { order.add_to_cart }

      expect(order.update_discount).to eql 0
    end
  end
end
