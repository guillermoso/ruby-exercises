class Deck
  attr_reader :cards

  def initialize
    @cards = []
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    dealt_card = @cards.pop

    raise OutOfCardsError if dealt_card.nil?

    dealt_card
  end

  def add_card(card)
    @cards << card
  end
end

class OutOfCardsError < StandardError; end
