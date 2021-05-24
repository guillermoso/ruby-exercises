require "./spec_helper"
require "../lib/playing_card"

describe PlayingCard do
  before(:all) do
    @playing_card = PlayingCard.new
  end

  it "sets value correctly" do
    @playing_card.value = 10

    expect(@playing_card.value).to eql 10
  end

  it "sets suit correctly" do
    @playing_card.suit = "hearts"

    expect(@playing_card.suit).to eql "hearts"
  end

  it "diplays the playing card value in plain english" do
    @playing_card.value = 6
    @playing_card.suit = "spades"

    expect(@playing_card.inspect).to eql "6 of spades"
  end
end
