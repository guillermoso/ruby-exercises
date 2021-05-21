require "spec_helper"
require "./lib/fizz_buzz"

#### Step 1

# Create a FizzBuzz playing game. The play method will receive a number and play FizzBuzz with it.

# 1. Numbers divisible by 3, the game says "Fizz"
# 2. Numbers divisible by 5, the game says "Buzz"
# 3. Numbers divisible by 3 **and** 5, the game says "FizzBuzz"
# 4. Another number the game says that number

#### Step 2

# 1. The game says "Fizz" if the number is divisible by 3 **or** if it has a 3 in it
# 2. The game says "Buzz" if the number is divisible by 5 **or** if it has a 5 in it

describe FizzBuzz do
  describe ".play" do
    it 'returns the same number if doesnt matches a rule' do
      result = FizzBuzz.play(4)

      expect(result).to eql 4
    end

    it "returns 'Fizz' when sending a 3" do
      result = FizzBuzz.play(3)

      expect(result).to eql "Fizz"
    end

    it "returns 'Fizz' when sending a multiple of 3" do
      result = FizzBuzz.play(99)

      expect(result).to eql "Fizz"
    end

    it "returns 'Fizz' if the number has a 3 in it" do
      result = FizzBuzz.play(13)

      expect(result).to eql "Fizz"
    end

    it "returns 'Buzz' when sending a 5" do
      result = FizzBuzz.play(5)

      expect(result).to eql "Buzz"
    end

    it "returns 'Buzz' when sending a multiple of 5" do
      result = FizzBuzz.play(55)

      expect(result).to eql "Buzz"
    end

    it "returns 'Buzz' if the number has a 5 in it" do
      result = FizzBuzz.play(52)

      expect(result).to eql "Buzz"
    end

    it "returns 'FizzBuzz' when sending a multiple of 3 and 5" do
      result = FizzBuzz.play(30)

      expect(result).to eql "FizzBuzz"
    end

    it "returns 'FizzBuzz' when number is divisible by 3 and contains a 5" do
      result = FizzBuzz.play(51)

      expect(result).to eql "FizzBuzz"
    end

  end

  describe ".divisible_by_every_number" do
    it "returns true when sending a multiple of 3 and 5" do
      result = FizzBuzz.divisible_by_every_number(30)

      expect(result).to eql true
    end
  end
end
