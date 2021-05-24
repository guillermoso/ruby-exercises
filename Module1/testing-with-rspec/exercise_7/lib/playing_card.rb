class PlayingCard
  attr_accessor :suit, :value

  def inspect
    "#{value} of #{suit}"
  end
end
