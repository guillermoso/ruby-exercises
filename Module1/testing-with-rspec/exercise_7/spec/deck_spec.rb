require "./spec_helper"
require "../lib/deck"

describe Deck do
  before(:each) do
    @deck = Deck.new

    100.times do |i|
      @deck.add_card i + 1
    end
  end

  describe "#shuffle" do
    it "reorders cards randomly" do
      original_cards = @deck.cards.clone.map(&:clone)

      @deck.shuffle

      expect(@deck.cards).not_to eql original_cards
    end
  end

  describe "#deal" do
    it "removes a card from the deck" do
      expect { @deck.deal }
        .to change { @deck.cards.size }
        .by(-1)
    end

    it "returns a card from the deck" do
      expected_card_to_be_dealt = @deck.cards[-1]

      dealt_card = @deck.deal

      expect(dealt_card).to eql expected_card_to_be_dealt
    end

    context "throws error" do
      it "when deal is called and no cards remain" do
        100.times { @deck.deal }

        expect { @deck.deal }.to raise_error(OutOfCardsError)
      end
    end
  end

  describe "#add_card" do
    it "adds a card to the deck" do
      expect { @deck.add_card(101) }
        .to change { @deck.cards.size }
        .by(+1)
    end
  end
end
