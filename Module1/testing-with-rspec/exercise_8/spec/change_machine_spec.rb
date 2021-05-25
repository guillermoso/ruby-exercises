require './spec_helper'
require '../lib/change_machine'

describe ChangeMachine do
  before(:each) do
    @machine = ChangeMachine.new
  end

  describe "#cost" do
    it "sets the cost amount correctly" do
      @machine.cost 495

      expect(@machine.cost_amount).to eql 495
    end
  end

  describe "#paid" do
    it "sets the paid amount correctly" do
      @machine.paid 600

      expect(@machine.paid_amount).to eql 600
    end
  end

  describe "#dispense_change" do
    it "doesn't dispense change when nothing is owed" do
      @machine.cost 800
      @machine.paid 600

      $stdout = StringIO.new

      @machine.dispense_change

      $stdout.rewind

      expect($stdout.gets).to eq(nil)
    end

    it "doesn't dispense change when an exact dollar is owed" do
      $stdout = StringIO.new
      @machine.cost 800
      @machine.paid 900

      $stdout.rewind

      expect($stdout.gets).to eq(nil)
    end

    it "dispenses a penny when 1 cent is owed" do
      $stdout = StringIO.new
      @machine.cost 899
      @machine.paid 900

      @machine.dispense_change

      $stdout.rewind

      expect($stdout.gets.strip).to eq("Dispensed penny")
    end

    it "dispenses a nickel and 4 pennies for 9 cents owed" do
      $stdout = StringIO.new
      @machine.cost 891
      @machine.paid 900
      expected_coins = {
        quarter: 0,
        dime: 0,
        nickel: 1,
        penny: 4
      } # 9 cents

      @machine.dispense_change

      $stdout.rewind

      expected_coins.each do |coin, number_coins|
        number_coins.times { expect($stdout.gets.strip).to eq("Dispensed #{coin}") }
      end
    end
  end

  describe "#calculate_coins_from_cents" do
    it "returns 0 coins for 0 cents" do
      calculated_coins = @machine.calculate_coins_from_cents(0)

      calculated_coins.each do |_coin, number_coins|
        expect(number_coins).to eql 0
      end
    end

    it "returns 1 quarter for 25 cents owed" do
      calculated_coins = @machine.calculate_coins_from_cents(25)

      calculated_coins.each do |coin, number_coins|
        expected_number_coins = coin == :quarter ? 1 : 0

        expect(number_coins).to eql expected_number_coins
      end
    end

    it "returns 1 dime for 10 cents owed" do
      calculated_coins = @machine.calculate_coins_from_cents(10)

      calculated_coins.each do |coin, number_coins|
        expected_number_coins = coin == :dime ? 1 : 0

        expect(number_coins).to eql expected_number_coins
      end
    end

    it "returns 1 nickel for 5 cents owed" do
      calculated_coins = @machine.calculate_coins_from_cents(5)

      calculated_coins.each do |coin, number_coins|
        expected_number_coins = coin == :nickel ? 1 : 0

        expect(number_coins).to eql expected_number_coins
      end
    end

    it "returns 1 penny for 1 cent owed" do
      calculated_coins = @machine.calculate_coins_from_cents(1)

      calculated_coins.each do |coin, number_coins|
        expected_number_coins = coin == :penny ? 1 : 0

        expect(number_coins).to eql expected_number_coins
      end
    end

    it "returns 4 pennies for 4 cents owed" do
      calculated_coins = @machine.calculate_coins_from_cents(4)

      calculated_coins.each do |coin, number_coins|
        expected_number_coins = coin == :penny ? 4 : 0

        expect(number_coins).to eql expected_number_coins
      end
    end

    it "returns 1 nickel and 4 pennies for 9 cents owed" do
      expected_coins = {
        quarter: 0,
        dime: 0,
        nickel: 1,
        penny: 4
      } # 9 cents

      calculated_coins = @machine.calculate_coins_from_cents(9)

      calculated_coins.each do |coin, value|
        expect(value).to eql expected_coins[coin]
      end
    end

    it "returns 1 quarters, 2 dimes and 4 pennies for 49 cents owed" do
      expected_coins = {
        quarter: 1,
        dime: 2,
        nickel: 0,
        penny: 4
      }

      calculated_coins = @machine.calculate_coins_from_cents(49)

      calculated_coins.each do |coin, value|
        expect(value).to eql expected_coins[coin]
      end
    end

    it "returns 3 quarters, 2 dimes and 4 pennies for 99 cents owed" do
      expected_coins = {
        quarter: 3,
        dime: 2,
        nickel: 0,
        penny: 4
      }

      calculated_coins = @machine.calculate_coins_from_cents(99)

      calculated_coins.each do |coin, value|
        expect(value).to eql expected_coins[coin]
      end
    end
  end

  describe "#cents_owed" do
    it "calculates number of cents owed for less than a dollar" do
      @machine.cost 851
      @machine.paid 900

      expect(@machine.cents_owed).to eql 49
    end

    it "calculates number of cents owed for an exact dollar" do
      @machine.cost 900
      @machine.paid 1000

      expect(@machine.cents_owed).to eql 0
    end

    it "calculates number of cents owed for more than a dollar" do
      @machine.cost 851
      @machine.paid 1000

      expect(@machine.cents_owed).to eql 49
    end
  end

  describe "#print_change" do
    it "prints the appropiate number of dispenses for each coin" do
      $stdout = StringIO.new
      change = {
        quarter: 3,
        dime: 2,
        nickel: 0,
        penny: 4
      } # 99 cents

      @machine.print_change(change)

      $stdout.rewind

      change.each do |coin, number_coins|
        number_coins.times { expect($stdout.gets.strip).to eq("Dispensed #{coin}") }
      end
    end
  end

  describe "#quarter" do
    it "prints 'Dispensed quarter'" do
      $stdout = StringIO.new

      @machine.quarter

      $stdout.rewind

      expect($stdout.gets.strip).to eq("Dispensed quarter")
    end
  end

  describe "#dime" do
    it "prints 'Dispensed dime'" do
      $stdout = StringIO.new

      @machine.dime

      $stdout.rewind

      expect($stdout.gets.strip).to eq("Dispensed dime")
    end
  end

  describe "#nickel" do
    it "prints 'Dispensed nickel'" do
      $stdout = StringIO.new

      @machine.nickel

      $stdout.rewind

      expect($stdout.gets.strip).to eq("Dispensed nickel")
    end
  end

  describe "#penny" do
    it "prints 'Dispensed penny'" do
      $stdout = StringIO.new

      @machine.penny

      $stdout.rewind

      expect($stdout.gets.strip).to eq("Dispensed penny")
    end
  end
end
