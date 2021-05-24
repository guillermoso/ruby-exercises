class StringCalculator
  def initialize(numbers = "")
    @numbers = numbers

    define_delimiter
    clean_numbers
  end

  def add
    return 0 if @numbers == ""

    find_negatives

    total = 0

    total += @cleansed_numbers.reduce(:+)

    total
  end

  def define_delimiter
    @delimiter = ","

    @custom_delimiter = @numbers[0, 2] == "//"

    @delimiter = @numbers.split("\n")[0][2..] if @custom_delimiter

    @delimiter
  end

  def clean_numbers
    cleansed_numbers = []
    @numbers.split("\n").each_with_index do |numbers, index|
      next if @custom_delimiter && index.zero?

      cleansed_numbers << numbers.split(@delimiter).map(&:to_i)
    end
    cleansed_numbers = cleansed_numbers.flatten

    @cleansed_numbers = cleansed_numbers
  end

  def find_negatives
    negatives = @cleansed_numbers.select(&:negative?)

    raise "negatives not allowed: [#{negatives.join(',')}]" if !negatives.empty?
  end
end
