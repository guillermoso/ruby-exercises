# You can modify this class however you like to make it pass the test suite.
class ChangeMachine
  attr_reader :cost_amount, :paid_amount

  COIN_VALUES = {
    quarter: 25,
    dime: 10,
    nickel: 5,
    penny: 1
  }.freeze

  def cost(cents)
    @cost_amount = cents
  end

  def paid(cents)
    @paid_amount = cents
  end

  def dispense_change
    coins_owed = calculate_coins_from_cents(cents_owed)

    print_change coins_owed
  end

  def calculate_coins_from_cents(cents)
    calculated_coins = Hash.new(0)

    remaining_cents = cents
    while remaining_cents != 0
      COIN_VALUES.each do |coin, coin_value|
        while remaining_cents >= coin_value
          remaining_cents -= coin_value
          calculated_coins[coin] += 1
        end
      end
    end

    calculated_coins
  end

  def cents_owed
    (@paid_amount - @cost_amount) % 100
  end

  def print_change(owed_coins)
    owed_coins.each do |coin, number_coins|
      number_coins.times { send(coin) }
    end
  end

  # You don't have to modify anything under this line

  def quarter
    puts 'Dispensed quarter'
  end

  def dime
    puts 'Dispensed dime'
  end

  def nickel
    puts 'Dispensed nickel'
  end

  def penny
    puts 'Dispensed penny'
  end
end
