require "spec_helper"
require "./lib/no_max_no_min"

describe NoMaxNoMin do
  context "raises exception" do
    it "when initializing with a number" do
      expect { NoMaxNoMin.new(123) }.to raise_error(ArgumentError)
    end

    it "when initializing with a string" do
      expect { NoMaxNoMin.new("string") }.to raise_error(ArgumentError)
    end

    it "when initializing with nil" do
      expect { NoMaxNoMin.new(nil) }.to raise_error(ArgumentError)
    end

    it "when sending a non numeric value in the array" do
      expect { NoMaxNoMin.new([nil]) }.to raise_error(ArgumentError)
    end
  end

  describe "#calculate" do
    context "returns 0" do
      it "when receiving an empty array" do
        no_max_no_min = NoMaxNoMin.new([])

        result = no_max_no_min.calculate

        expect(result).to eql 0
      end

      it "when receiving an array with less than 3 elements" do
        no_max_no_min = NoMaxNoMin.new([1, 2])

        result = no_max_no_min.calculate

        expect(result).to eql 0
      end
    end

    context "returns the sum of the numbers in the array without the max and min value" do
      it "when receiving an array of numbers" do
        no_max_no_min = NoMaxNoMin.new([1, 2, 3])

        result = no_max_no_min.calculate

        expect(result).to eql 2
      end
    end
  end

  describe "#min" do
    it "identifies the minimum number in the array" do
      no_max_no_min = NoMaxNoMin.new([1, 2, 3])

      result = no_max_no_min.min

      expect(result).to eql 1
    end
  end

  describe "#max" do
    it "identifies the maximum number in the array" do
      no_max_no_min = NoMaxNoMin.new([1, 2, 3])

      result = no_max_no_min.max

      expect(result).to eql 3
    end
  end
end
