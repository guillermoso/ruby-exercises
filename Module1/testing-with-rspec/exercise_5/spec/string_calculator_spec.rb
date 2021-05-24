require './spec_helper'
require '../lib/string_calculator'

describe StringCalculator do
  describe ".add" do
    context "raises exception" do
      it "when using a negative number" do
        string_calc = StringCalculator.new("-1")

        expect { string_calc.add }.to raise_error("negatives not allowed: [-1]")
      end

      it "when using negative numbers" do
        string_calc = StringCalculator.new("-1\n1,2\n3,4,-5")

        expect { string_calc.add }.to raise_error("negatives not allowed: [-1,-5]")
      end
    end

    it "returns 0 for empty string" do
      string_calc = StringCalculator.new("")

      result = string_calc.add

      expect(result).to eql 0
    end

    it "returns the received number when sent a single number" do
      string_calc = StringCalculator.new("1")

      result = string_calc.add

      expect(result).to eql 1
    end

    it "returns the sum of 2 comma separated numbers" do
      string_calc = StringCalculator.new("1,2")

      result = string_calc.add

      expect(result).to eql 3
    end

    it "returns the sum of *n* comma separated numbers" do
      string_calc = StringCalculator.new("1,2,3,4,5")

      result = string_calc.add

      expect(result).to eql 15
    end

    it "returns the sum of *n* comma or newline separated numbers" do
      string_calc = StringCalculator.new("1\n2,3\n4,5")

      result = string_calc.add

      expect(result).to eql 15
    end

    it "accepts a custom delimiter" do
      string_calc = StringCalculator.new("//;\n1\n2;3\n4;5")

      result = string_calc.add

      expect(result).to eql 15
    end

    it "accepts a long ass custom delimiter" do
      string_calc = StringCalculator.new("//;;;;!!@@>><<\n1\n2;;;;!!@@>><<3\n4;;;;!!@@>><<5")

      result = string_calc.add

      expect(result).to eql 15
    end
  end

  describe ".define_delimiter" do
    it "uses default delimiter if no custom delimiter defined" do
      string_calc = StringCalculator.new("1\n2,3\n4,5")

      result = string_calc.define_delimiter

      expect(result).to eql ","
    end

    it "uses custom delimiter if single character custom delimiter defined" do
      string_calc = StringCalculator.new("//;\n1\n2;3\n4;5")

      result = string_calc.define_delimiter

      expect(result).to eql ";"
    end

    it "uses custom delimiter if multiple character custom delimiter defined" do
      string_calc = StringCalculator.new("//;;;;!!@@>><<\n1\n2;;;;!!@@>><<3\n4;;;;!!@@>><<5")

      result = string_calc.define_delimiter

      expect(result).to eql ";;;;!!@@>><<"
    end

    describe ".clean_numbers" do
      it "returns array of integers when separated by commas" do
        string_calc = StringCalculator.new("1,2,3,4,5")

        result = string_calc.clean_numbers

        expect(result).to eql [1, 2, 3, 4, 5]
      end

      it "returns array of integers when separated by commas and newlines" do
        string_calc = StringCalculator.new("1\n2,3\n4,5")

        result = string_calc.clean_numbers

        expect(result).to eql [1, 2, 3, 4, 5]
      end

      it "turns array of integers when separated by a custom delimiter and newlines" do
        string_calc = StringCalculator.new("//;\n1\n2;3\n4;5")

        result = string_calc.clean_numbers

        expect(result).to eql [1, 2, 3, 4, 5]
      end

      it "turns array of integers when separated by a long custom delimiter and newlines" do
        string_calc = StringCalculator.new("//;;;;!!@@>><<\n1\n2;;;;!!@@>><<3\n4;;;;!!@@>><<5")

        result = string_calc.clean_numbers

        expect(result).to eql [1, 2, 3, 4, 5]
      end
    end
  end
end
