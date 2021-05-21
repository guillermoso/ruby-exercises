require "spec_helper"
require "./lib/jaden_case"

describe JadenCase do
  describe ".convert" do

    context "raises exception" do
      it "when initialiazing with an array" do
        expect { JadenCase.new([]) }.to raise_error(ArgumentError)
      end

    end

    # it "raises error when receiving a number" do
    #   expect { JadenCase.convert(123) }.to raise_error(ArgumentError)
    # end

    # it "raises error when receiving a hash" do
    #   expect { JadenCase.convert({}) }.to raise_error(ArgumentError)
    # end

    it "returns empty string if it receives an empty string" do
      jc = JadenCase.new("")

      result = jc.convert

      expect(result).to eql ""
    end

    it "capitalizes a single letter" do
      jc = JadenCase.new("l")

      result = jc.convert

      expect(result).to eql "L"
    end

    it "capitalizes a word" do
      jc = JadenCase.new("wassup")

      result = jc.convert

      expect(result).to eql "Wassup"
    end

    it "capitalizes two words" do
      jc = JadenCase.new("wassup dawg")

      result = jc.convert

      expect(result).to eql "Wassup Dawg"
    end

    it "capitalizes more than two words" do
      jc = JadenCase.new("hey wassup man")

      result = jc.convert

      expect(result).to eql "Hey Wassup Man"
    end

    # it ""
  end
end
