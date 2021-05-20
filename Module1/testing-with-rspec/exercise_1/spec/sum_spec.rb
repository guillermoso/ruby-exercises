require "spec_helper"
require "./lib/arithmetic"

describe Arithmetic do
  describe ".sum" do
    it "returns 8, for 3 and 5 as paratemers" do
      result = Arithmetic.sum(3, 5)

      expect(result).to eql 8
    end

    it 'return 15 when sending 8, 2 and 5' do
      result = Arithmetic.sum(8, 2, 5)

      expect(result).to eql 15
    end

    it 'returns -10 when sending -5, -15 and 10' do
      result = Arithmetic.sum(-5, -15, 10)

      expect(result).to eql(-10)
    end

    it 'returns -9 when sending -4 and -5' do
      result = Arithmetic.sum(-4, -5)

      expect(result).to eql(-9)
    end

    it 'returns 5.6 when sending 3.2 and 2.4' do
      result = Arithmetic.sum(3.2, 2.4)

      expect(result).to eql 5.6
    end

    it 'returns -2.5 when sending 3.2 and -5.7' do
      result = Arithmetic.sum(3.2, -5.7)

      expect(result).to eql(-2.5)
    end
  end

  describe ".substract" do
    it "returns -2, for 3 and 5 as paratemers" do
      result = Arithmetic.substract(3, 5)

      expect(result).to eql(-2)
    end

    it 'return 1 when sending 8, 2 and 5' do
      result = Arithmetic.substract(8, 2, 5)

      expect(result).to eql 1
    end

    it 'returns 0 when sending -5, -15 and 10' do
      result = Arithmetic.substract(-5, -15, 10)

      expect(result).to eql 0
    end

    it 'returns 1 when sending -4 and -5' do
      result = Arithmetic.substract(-4, -5)

      expect(result).to eql(1)
    end

    it 'returns 0.8 when sending 3.2 and 2.4' do
      result = Arithmetic.substract(3.2, 2.4)

      expect(result).to eql 0.8
    end

    it 'returns 8.9 when sending 3.2 and -5.7' do
      result = Arithmetic.substract(3.2, -5.7)

      expect(result).to eql(8.9)
    end
  end

  describe ".multiply" do
    it "returns 15, for 3 and 5 as paratemers" do
      result = Arithmetic.multiply(3, 5)

      expect(result).to eql 15
    end

    it 'returns 80 when sending 8, 2 and 5' do
      result = Arithmetic.multiply(8, 2, 5)

      expect(result).to eql 80
    end

    it 'returns 750 when sending -5, -15 and 10' do
      result = Arithmetic.multiply(-5, -15, 10)

      expect(result).to eql 750
    end

    it 'returns 20 when sending -4 and -5' do
      result = Arithmetic.multiply(-4, -5)

      expect(result).to eql 20
    end

    it 'returns 7.68 when sending 3.2 and 2.4' do
      result = Arithmetic.multiply(3.2, 2.4)

      expect(result).to eql 7.68
    end

    it 'returns -18.24 when sending 3.2 and -5.7' do
      result = Arithmetic.multiply(3.2, -5.7)

      expect(result).to eql(-18.24)
    end
  end

  describe ".divide" do
    it 'throws an error when dividing by 0' do
      expect { Arithmetic.divide(5, 10, 0) }.to raise_error(ZeroDivisionError)
    end

    it "returns 2.0, for 10 and 5 as paratemers" do
      result = Arithmetic.divide(10, 5)

      expect(result).to eql 2.0
    end

    it 'returns 0.5 when sending 5 and 10 as parameters' do
      result = Arithmetic.divide(5, 10)

      expect(result).to eql(0.5)
    end

    it 'returns 2.0 when sending 16, 4 and 2 as parameters' do
      result = Arithmetic.divide(16, 4, 2)

      expect(result).to eql(2.0)
    end

    it 'returns -25.0 when sending -50, 2' do
      result = Arithmetic.divide(-50, 2)

      expect(result).to eql(-25.0)
    end

    it 'returns 25.0 when sending -50, -2' do
      result = Arithmetic.divide(-50, -2)

      expect(result).to eql(25.0)
    end

    it 'returns 2.22 when sending 7.8 and 3.5' do
      result = Arithmetic.divide(7.8, 3.5)

      expect(result).to eql(2.22)
    end

    it 'returns -2.22 when sending 7.8 and -3.5' do
      result = Arithmetic.divide(7.8, -3.5)

      expect(result).to eql(-2.22)
    end
  end
end
