class RoyalFlush
  def matches?(hand)
    ranks = hand.cards.map(&:rank)
    StraightFlush.new.matches?(hand) && ranks.include?(Card::RANKS.length-1)
  end
end
