class RoyalFlush
  def matches?(hand)
    StraightFlush.new.matches?(hand) && hand.ace?
  end
end
