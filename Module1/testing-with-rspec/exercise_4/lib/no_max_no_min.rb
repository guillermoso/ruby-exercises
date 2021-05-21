class NoMaxNoMin
  def initialize(numbers)
    @numbers = numbers
    validate
  end

  def validate
    raise ArgumentError if !@numbers.is_a? Array

    @numbers.each do |number|
      raise ArgumentError if !number.is_a? Numeric
    end
  end

  def calculate
    return 0 if @numbers.length < 3

    @numbers.reduce(:+) - (min + max)
  end

  def min
    @numbers.min
  end

  def max
    @numbers.max
  end
end
