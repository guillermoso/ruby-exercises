class FizzBuzz
  GAME_RULES = {
    "3" => "Fizz",
    "5" => "Buzz"
  }.freeze

  def self.play(number)
    return GAME_RULES.values.join if divisible_by_every_number(number)

    rule_response = ""
    GAME_RULES.each do |rule_number, rule_msg|
      rule_response << rule_msg if (number % rule_number.to_i).zero? || number.to_s.include?(rule_number)
    end

    rule_response == "" ? number : rule_response
  end

  def self.divisible_by_every_number(number)
    (number % GAME_RULES.keys.map(&:to_i).reduce(:*)).zero?
  end
end
