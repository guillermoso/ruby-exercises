require "./spec_helper"
require "./lib/playing_card"
require "../lib/playing_card_deck"

describe PlayingCardDeck do
  before(:all) do
    @playing_deck = PlayingCardDeck.new
  end

  describe "#generate_deck" do
    it "The deck has 52 cards" do
      expect(@playing_deck.cards.size).to eql 52
    end

    it "each card is an instance of PlayingCard" do
      @playing_deck.cards.each do |card|
        expect(card).to be_a PlayingCard
      end
    end

    it "every card has valid suite" do
      @playing_deck.cards.each do |card|
        expect(@playing_deck.available_suits).to include(card.suit)
      end
    end

    it "every card has a valid value" do
      @playing_deck.cards.each do |card|
        expect(@playing_deck.available_values).to include(card.value)
      end
    end

    it "with 4 cards for every value" do
      @playing_deck.available_values.each do |available_value|
        cards_per_value = @playing_deck.cards.filter { |card| card.value == available_value }

        expect(cards_per_value.size).to eql 4
      end
    end

    it "with 13 cards for every suit" do
      @playing_deck.available_suits.each do |available_suit|
        cards_per_suit = @playing_deck.cards.filter { |card| card.suit == available_suit }

        expect(cards_per_suit.size).to eql 13
      end
    end
  end

  describe "#available_suits" do
    it "returns array of available suits" do
      available_suits = %w[clubs spades hearts diamonds]

      expect(@playing_deck.available_suits).to eql available_suits
    end
  end

  describe "#available_values" do
    it "returns array of available values" do
      available_values = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]

      expect(@playing_deck.available_values).to eql available_values
    end
  end

  describe "#deal_poker_hands" do
    it "returns specified number of hands" do
      deck = PlayingCardDeck.new

      hands = deck.deal_poker_hands(2)

      expect(hands.size).to eql 2
    end

    it "each hand has 5 cards" do
      deck = PlayingCardDeck.new

      hands = deck.deal_poker_hands(3)

      hands.each do |hand|
        expect(hand.size).to eql 5
      end
    end

    context "throws error" do
      it "when dealing more than 10 hands" do
        deck = PlayingCardDeck.new

        expect { deck.deal_poker_hands(11) }.to raise_error(OutOfCardsError)
      end
    end
  end
end
