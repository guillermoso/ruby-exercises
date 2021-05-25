require_relative './deck'
require_relative './playing_card'

class PlayingCardDeck < Deck
  AVAILABLE_SUITS = %w[clubs spades hearts diamonds].freeze
  AVAILABLE_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"].freeze

  def initialize
    super
    generate_deck
  end

  def available_suits
    AVAILABLE_SUITS
  end

  def available_values
    AVAILABLE_VALUES
  end

  def generate_deck
    AVAILABLE_SUITS.each do |suit|
      AVAILABLE_VALUES.each do |value|
        card = PlayingCard.new
        card.suit = suit
        card.value = value
        add_card(card)
      end
    end
  end

  def deal_poker_hands(count)
    hands = []
    count.times do
      hand = []
      5.times { hand << deal }
      hands << hand
    end
    hands
  end
end
